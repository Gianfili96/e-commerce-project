import { Component, inject, signal, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';
import { Router, RouterOutlet, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { HeaderComponent } from "./components/layout/header.component/header.component";
import { FooterComponent } from './components/layout/footer.component/footer.component';
import { CartService } from './services/cart.service';
import { CommonModule } from '@angular/common';
import { OrderService } from './services/order.service';
import { OrderRequestDTO } from './models/order.model';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, HeaderComponent, FooterComponent, CommonModule],
  templateUrl: './app.html',
  styleUrl: './app.scss'
})
export class App {

  private cart = inject(CartService);
  private orderService = inject(OrderService);
  private platformId = inject(PLATFORM_ID);
  private authService = inject(AuthService);

  modalAperto = this.cart.modalCheckoutAperto;
  carrello = this.cart.carrello;
  counter = this.cart.totale;
  ordineSuccesso = signal(false);
  isAdminRoute = signal(false);

  roundDecimal = (num: number) => parseFloat(num.toFixed(2));

  constructor() {
    if (isPlatformBrowser(this.platformId)) {
      const router = inject(Router);
      router.events.pipe(
        filter(e => e instanceof NavigationEnd)
      ).subscribe((e: any) => {    
          this.isAdminRoute.set(
          e.urlAfterRedirects.startsWith('/dashboard') || 
          e.urlAfterRedirects.startsWith('/login')
        );
      });
    }
  }

  chiudiCheckout() {
    this.cart.chiudiCheckout();
  }

  confermaOrdine() {
  // 1. Prepariamo i dati (assicurati che productId e quantity siano i nomi esatti del DTO Java)
  const items: OrderRequestDTO[] = this.carrello().map(item => ({
    productId: item.id,
    quantity: item.quantita // mappiamo l'italiano del carrello all'inglese del DTO
  }));

  // 2. Chiamata al service (NON passiamo userId, lo legge il backend dal Token)
  this.orderService.checkout(items).subscribe({
    next: (ordine) => {
      console.log('Ordine confermato con successo:', ordine);
      
      // Reset del carrello e UI
      this.cart.clearCartWithoutConfirmation();
      this.chiudiCheckout();
      
      // Feedback all'utente
      this.ordineSuccesso.set(true);
      setTimeout(() => this.ordineSuccesso.set(false), 3000);
    },
    error: (err) => {
      console.error('Errore durante il checkout:', err);
      
      // Gestione specifica dell'errore di autorizzazione
      if (err.status === 401) {
        alert("Sessione scaduta o non autorizzata. Effettua il login.");
      } else {
        alert("Si è verificato un errore durante l'ordine. Riprova.");
      }
    }
  });
}
}