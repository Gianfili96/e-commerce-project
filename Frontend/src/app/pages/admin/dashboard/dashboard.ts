import { Component, inject, OnInit, OnDestroy, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Subscription } from 'rxjs';

// Services
import { ProductService } from '../../../services/product.service';
import { CategoryService } from '../../../services/category.service';
import { UserService } from '../../../services/user.service';
import { OrderService } from '../../../services/order.service';
import { AuthService } from '../../../services/auth.service';

// Models
import { CategoryDTO, newProduct, Product } from '../../../models/product.model';
import { OrderDTO } from '../../../models/order.model';
import { UserDTO } from '../../../models/user.model';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './dashboard.html',
  styleUrl: './dashboard.scss',
})
export class Dashboard implements OnInit, OnDestroy {
  // Iniezioni
  public authService = inject(AuthService);
  private productService = inject(ProductService);
  private categoryService = inject(CategoryService);
  private userService = inject(UserService);
  private orderService = inject(OrderService);
  private cdr = inject(ChangeDetectorRef);

  // Liste Dati
  products: Product[] = []; // Tipizzato correttamente
  categories: CategoryDTO[] = [];
  users: UserDTO[] = [];
  allOrders: OrderDTO[] = [];

  // UI State
  sezioneAttiva: 'prodotti' | 'ordini' | 'utenti' = 'prodotti';
  isLoading = false;

  // Form Modelli
  newProduct: newProduct = this.getEmptyProduct();
  newCategory: CategoryDTO = { id: 0, name: '' };
  editingProduct: Product | null = null;
  editingCategory: CategoryDTO | null = null;

  private subscription: Subscription = new Subscription();

  ngOnInit() {
    // Carichiamo i dati solo se siamo autenticati
    if (this.authService.isLoggedIn()) {
      this.loadInitialData();
    }
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  loadInitialData() {
  // Avvolgiamo la chiamata in un timeout minimo
  setTimeout(() => {
    this.isLoading = true;
    this.readProducts();
    this.readCategories();
    this.readUsers();
    this.readAllOrders();
    this.isLoading = false;
  });
}


  cambiaSezione(sezione: 'prodotti' | 'ordini' | 'utenti') {
    this.sezioneAttiva = sezione;
    this.cdr.detectChanges();
  }

  editCategory(category: CategoryDTO) { this.editingCategory = { ...category }; this.cdr.detectChanges();}

  // --- LOGICA UTENTI ---
  readUsers() {
    const sub = this.userService.getUsers().subscribe({
      next: (res) => {
        this.users = res;
        this.cdr.detectChanges();
      },
      error: (err) => console.error('Errore utenti:', err)
    });
    this.subscription.add(sub);
  }

  // --- LOGICA ORDINI ---
  readAllOrders() {
  const sub = this.orderService.getAllOrders().subscribe({
    next: (res) => {
      setTimeout(() => {
        this.allOrders = res;
        this.cdr.detectChanges();
      });
    },
    error: (err) => console.error('Errore nel recupero di tutti gli ordini:', err)
  });
  this.subscription.add(sub);
}

  /**
   * Disabilita un ordine usando il metodo specifico del service
   */
  deleteOrder(id: number) {
    // Rimuovi o cambia il messaggio del confirm perché ora è un toggle (attiva/disattiva)
    if (!confirm('Vuoi cambiare lo stato di questo ordine?')) return;
    
    this.orderService.softDeleteOrder(id).subscribe({
      next: () => {
        this.allOrders = this.allOrders.map(o => 
          // Inverti il valore booleano: se è true diventa false, se è false diventa true
          o.id === id ? { ...o, deactivated: !o.deactivated } : o
        );
        this.cdr.detectChanges();
      },
      error: (err) => alert("Errore durante la modifica dell'ordine.")
    });
}

  // --- LOGICA PRODOTTI ---
  readProducts() {
  const sub = this.productService.getAllProducts().subscribe((res) => {
    setTimeout(() => {
      this.products = res;
      this.cdr.detectChanges();
    });
  });
  this.subscription.add(sub);
}

  addProducts() {
    if (!this.newProduct.category.id) {
       alert('Seleziona una categoria');
       return;
    }
    
    this.productService.createProduct(this.newProduct).subscribe((res) => {
      this.products.push(res);
      this.newProduct = this.getEmptyProduct();
      this.cdr.detectChanges();
    });
  }

  editProduct(product: Product) { 
    this.editingProduct = { ...product }; 
  }

  updateProduct() {
    if (!this.editingProduct) return;
    this.productService.updateProduct(this.editingProduct).subscribe((res) => {
      const index = this.products.findIndex(p => p.id === this.editingProduct!.id);
      if (index !== -1) {
        this.products[index] = res;
        this.products = [...this.products];
      }
      this.editingProduct = null;
      this.cdr.detectChanges();
    });
  }

  deleteProduct(id: number) {
    if (!confirm(`Vuoi cambiare lo stato di disponibilità del prodotto?`)) return;
    this.productService.softDeleteProduct(id).subscribe({
      next: () => {
        this.products = this.products.map(p => 
          p.id === id ? { ...p, deactivated: !p.deactivated } : p
        );
        this.cdr.detectChanges();
      }
    });
  }

  // --- LOGICA CATEGORIE ---
  readCategories() {
  const sub = this.categoryService.getCategories().subscribe((res) => {
    setTimeout(() => {
      this.categories = res;
      this.cdr.detectChanges();
    });
  });
  this.subscription.add(sub);
}

  addCategory() {
    if (!this.newCategory.name.trim()) return;
    this.categoryService.createCategory(this.newCategory.name).subscribe((res) => {
      this.categories.push(res);
      this.newCategory = { id: 0, name: '' };
      this.cdr.detectChanges();
    });
  }

  updateCategory() {
    if (!this.editingCategory) return;
    this.categoryService.updateCategory(this.editingCategory).subscribe((res) => {
      const index = this.categories.findIndex(c => c.id === this.editingCategory!.id);
      if (index !== -1) { 
        this.categories[index] = res; 
      }
      this.editingCategory = null;
      this.cdr.detectChanges();
    });
  }

  deleteCategory(id: number) {
    if (!confirm('Eliminare categoria? Attenzione: i prodotti collegati potrebbero non essere più visibili.')) return;
    this.categoryService.deleteCategory(id).subscribe(() => {
      this.categories = this.categories.filter(c => c.id !== id);
      this.cdr.detectChanges();
    });
  }

  // --- HELPER METHODS ---

  private getEmptyProduct(): newProduct {
    return {
      title: '', description: '', oldPrice: 0, price: 0,
      brand: '', imageUrl: '', isNew: false, category: {} as CategoryDTO
    };
  }

  compareCategories(c1: CategoryDTO, c2: CategoryDTO): boolean {
    return c1 && c2 ? c1.id === c2.id : c1 === c2;
  }

  logout() {
    this.authService.logout();
  }
}