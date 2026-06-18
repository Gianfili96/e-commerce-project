import { Injectable, signal, inject, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs'; // <-- IMPORTA tap QUI
import { LoginRequest, LoginResponse, SignupRequest } from '../models/auth.model';
import { Router } from '@angular/router';

@Injectable({ providedIn: 'root' })
export class AuthService {

  private apiUrl = 'http://localhost:8080/api/auth';
  private platformId = inject(PLATFORM_ID);

  currentUser = signal<LoginResponse | null>(null);

  constructor(private http: HttpClient, private router: Router) {
    if (isPlatformBrowser(this.platformId)) {
      const saved = sessionStorage.getItem('currentUser');
      if (saved) this.currentUser.set(JSON.parse(saved));
    }
  }

  // --- MODIFICA QUI ---
  login(request: LoginRequest): Observable<LoginResponse> {
  return this.http.post<LoginResponse>(`${this.apiUrl}/signin`, request).pipe(
    tap((response) => {
      this.saveUser(response); // <--- DEVE ESSERE QUI
      console.log("Token appena salvato:", response.accessToken);
    })
  );
}

  signup(request: SignupRequest): Observable<any> {
    return this.http.post(`${this.apiUrl}/signup`, request);
  }

  logout(): void {
    // Nota: lo svuotamento deve avvenire DOPO o durante la chiamata di signout
    this.http.post(`${this.apiUrl}/signout`, {}).subscribe({
        next: () => this.clearAuthData(),
        error: () => this.clearAuthData() // Puliamo comunque in caso di errore
    });
  }

  // Metodo di utility per pulire tutto
  private clearAuthData() {
    if (isPlatformBrowser(this.platformId)) {
        sessionStorage.removeItem('currentUser');
    }
    this.currentUser.set(null);
    this.router.navigate(['/login']);
  }

  saveUser(user: LoginResponse): void {
    if (isPlatformBrowser(this.platformId)) {
      sessionStorage.setItem('currentUser', JSON.stringify(user));
    }
    this.currentUser.set(user);
  }

  getToken(): string | null {
  // 1. Prova dal signal
  let token = this.currentUser()?.accessToken;
  
  // 2. Se è null (magari dopo un F5), prova a recuperarlo dal disco
  if (!token && isPlatformBrowser(this.platformId)) {
    const saved = sessionStorage.getItem('currentUser');
    if (saved) {
      const user = JSON.parse(saved);
      token = user.accessToken;
      this.currentUser.set(user); // Sincronizziamo il signal per il futuro
    }
  }
  return token ?? null;
}

  getUserId(): number | null {
    return this.currentUser()?.id ?? null;
  }

  isLoggedIn(): boolean {
    return this.currentUser() !== null;
  }

  isAdmin(): boolean {
    return this.currentUser()?.roles?.includes('ROLE_ADMIN') ?? false;
  }
}