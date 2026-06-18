import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { newProduct, Product } from '../models/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private apiUrl = "http://localhost:8080/api/product";

  constructor(private http: HttpClient) { }

  // GET ALL PRODUCTS
  getAllProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.apiUrl}/products`);
  }

  // GET PRODUCT BY ID
  getProductById(id: number): Observable<Product> {
    return this.http.get<Product>(`${this.apiUrl}/product?t=${id}`);
  }

  // CREATE PRODUCT
  createProduct(product: newProduct): Observable<Product> {
    return this.http.post<Product>(`${this.apiUrl}/new`, product);
  }

  // UPDATE PRODUCT
  updateProduct(product: Product): Observable<Product> {
    return this.http.put<Product>(`${this.apiUrl}/update`, product);
  }

  // DELETE PRODUCT
  deleteProduct(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/delete/${id}`);
  }

  // SEARCH BY TITLE
  getProductsByTitle(title: string): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.apiUrl}/get/${title}`);
  }

  getProduct(id: number): Observable<Product> {
    return this.http.get<Product>(`${this.apiUrl}/product?t=${id}`);
  }

  // Sostituisci il vecchio deleteProduct o aggiungi questo:
  softDeleteProduct(id: number): Observable<void> {
    // Notare che usiamo .put e l'URL mappato dal tuo collega
    return this.http.put<void>(`${this.apiUrl}/delete/${id}`, {});
  }

  // Aggiungi questo nel tuo ProductService
  getActiveProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.apiUrl}/active`);
  }

}
