import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { RouterLink, RouterModule } from "@angular/router";
import { SearchService } from '../../../services/search.service';
import { AuthService } from '../../../services/auth.service';
import { Router } from 'express';
import { Location } from '@angular/common'; // Deve essere questo!

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule, RouterLink, RouterModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss',
})
export class HeaderComponent {

  searchService = inject(SearchService);
  authService = inject(AuthService);
  private location = inject(Location); // Iniettiamo Location invece di Router

  // Usiamo una funzione che controlla il path attuale
  isShopPage(): boolean {
    return this.location.path().startsWith('/shop');
  }
  
  onSearch(event: Event) {
  const value = (event.target as HTMLInputElement).value;
  this.searchService.searchQuery.set(value);
}

logout() {
  this.authService.logout();
}

}
