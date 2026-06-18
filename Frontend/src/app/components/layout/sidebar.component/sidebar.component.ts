import { CommonModule } from '@angular/common';
import { Component, Output, EventEmitter, signal } from '@angular/core'; // <- tutto da @angular/core
import { CartService } from '../../../services/cart.service';

@Component({
  selector: 'app-sidebar',
  imports: [CommonModule],
  standalone: true,
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.scss',
})
export class SidebarComponent {

  carrello = signal<any[]>([]);
  counter = signal(0);

  roundDecimal = (num: number) => num.toFixed(2);

  //@Output() apriCheckout = new EventEmitter<string>();

  constructor(private cart: CartService) {
    this.carrello = this.cart.carrello;
    this.counter = this.cart.totale;
  }

  clearCart() {
    this.cart.clearCart();
  }

  removeSingleItem(prodotto: { id: number, nome: string, prezzo: number, quantita: number }) {
    this.cart.removeSingleItem(prodotto);
  }

  checkout() {
  this.cart.apriCheckout();
}
}