import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CategoryDTO } from '../models/product.model';

@Injectable({ providedIn: 'root' })
export class CategoryService {

  private apiUrl = 'http://localhost:8080/api/category';

  constructor(private http: HttpClient) {}

  getCategories(): Observable<CategoryDTO[]> {
    return this.http.get<CategoryDTO[]>(`${this.apiUrl}/categories`);
  }

  getCategory(id: number): Observable<CategoryDTO> {
    return this.http.get<CategoryDTO>(`${this.apiUrl}/?id=${id}`);
  }

  createCategory(name: string): Observable<CategoryDTO> {
    return this.http.post<CategoryDTO>(`${this.apiUrl}/new`, { name });
  }

  updateCategory(category: CategoryDTO): Observable<CategoryDTO> {
    return this.http.put<CategoryDTO>(`${this.apiUrl}/update`, category);
  } 

  deleteCategory(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/delete/${id}`);
  }
}