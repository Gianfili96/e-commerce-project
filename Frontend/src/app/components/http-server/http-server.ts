import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, computed, inject, signal, WritableSignal } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { SearchService } from '../../services/search.service';
import { ProductService } from '../../services/product.service';
import { Product } from '../../models/product.model';

@Component({
  selector: 'app-http-server',
  imports: [CommonModule],
  templateUrl: './http-server.html',
  styleUrl: './http-server.scss',
})
export class HttpServer {

  http = inject(HttpClient);

  products: WritableSignal<Product[]> = signal([]);

  searchService = inject(SearchService);

  filteredProducts = computed(() => {
    const query = this.searchService.searchQuery().toLowerCase().trim();
    if (!query) return this.products();
    return this.products().filter(p =>
      p.title.toLowerCase().includes(query) ||
      p.brand.toLowerCase().includes(query) ||
      p.category.name.toLowerCase().includes(query)
    );
  });

  // Signal per il modal dettaglio
  prodottoSelezionato = signal<Product | null>(null);
  modalDettaglioAperto = signal(false);

  url = 'http://localhost:8080/api/product/products';
  urlActive = 'http://localhost:8080/api/product/active';

  constructor(private cart: CartService, private productService: ProductService) {}

  loadProducts() {
  // Ora questa chiamata recupererà solo i prodotti dove deactivated è false
  this.http.get<Product[]>(this.urlActive)
    .subscribe((res) => {
      console.log("API DATA (Solo Attivi):", res);
      this.products.set(res);
    });
  }

  ngOnInit() {
      this.loadProducts();
  }

  addToCart(prodotto: { id: number, nome: string, prezzo: number }) {
    this.cart.addToCart(prodotto);
  }

  apriDettaglio(id: number) {
    this.productService.getProductById(id).subscribe({
      next: (prodotto) => {
        this.prodottoSelezionato.set(prodotto);
        this.modalDettaglioAperto.set(true);
      },
      error: (err) => console.error('Errore caricamento prodotto:', err)
    });
  }

  chiudiDettaglio() {
    this.modalDettaglioAperto.set(false);
    this.prodottoSelezionato.set(null);
  }
}