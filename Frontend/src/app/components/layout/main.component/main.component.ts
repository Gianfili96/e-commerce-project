import { CommonModule } from '@angular/common';
import { Component, signal } from '@angular/core';
import { CartService } from '../../../services/cart.service';
import { FooterComponent } from "../footer.component/footer.component";
import { HttpServer } from '../../http-server/http-server';

@Component({
  selector: 'app-main',
  imports: [CommonModule, HttpServer],
  standalone: true,
  templateUrl: './main.component.html',
  styleUrl: './main.component.scss',
})
export class MainComponent {


  constructor(private cart: CartService) {}

  addToCart(prodotto: {id: number, nome: string, prezzo: number}) {
    this.cart.addToCart(prodotto);
  }

  clearCart() {
    this.cart.clearCart();
  }

  
  
}
