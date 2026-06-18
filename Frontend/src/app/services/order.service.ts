import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OrderDTO, OrderRequestDTO } from '../models/order.model';
import { AuthService } from './auth.service';

@Injectable({ providedIn: 'root' })
export class OrderService {
  private http = inject(HttpClient);
  private authService = inject(AuthService);
  private apiUrl = 'http://localhost:8080/api/orders';

  /*private getHeaders(): HttpHeaders {
    const token = this.authService.getToken();
    console.log("Token recuperato dall'AuthService:", token);
    return new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });
  }*/

  // Nota: Le opzioni { headers: ... } sono state rimosse perché ora 
  // gestite globalmente dall'authInterceptor.

  checkout(items: OrderRequestDTO[]): Observable<OrderDTO> {
    return this.http.post<OrderDTO>(
      `${this.apiUrl}/checkout`, 
      items
    );
  }

  getMyOrders(): Observable<OrderDTO[]> {
    return this.http.get<OrderDTO[]>(
      `${this.apiUrl}/my-orders`
    );
  }

  getAllOrders(): Observable<OrderDTO[]> {
    return this.http.get<OrderDTO[]>(
      `${this.apiUrl}/all`
    );
  }

  disableOrder(id: number): Observable<any> {
    return this.http.put<any>(
      `${this.apiUrl}/disable/${id}`,
      {}
    );
  }

  // --- NUOVO METODO AGGIUNTO ---
  
  /**
   * Disabilita un ordine (Soft Delete)
   * @param id ID dell'ordine da disabilitare
   */
  softDeleteOrder(id: number): Observable<any> {
    return this.http.put<any>(
      `${this.apiUrl}/disable/${id}`, 
      {}
    );
  }
}