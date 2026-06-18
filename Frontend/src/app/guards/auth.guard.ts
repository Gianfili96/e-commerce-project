import { inject, PLATFORM_ID } from '@angular/core'; // Importa PLATFORM_ID
import { isPlatformBrowser } from '@angular/common'; // Importa isPlatformBrowser
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const authGuard: CanActivateFn = () => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const platformId = inject(PLATFORM_ID);

  // Se siamo sul server, permettiamo il passaggio. 
  // Il controllo vero avverrà sul browser un istante dopo.
  if (!isPlatformBrowser(platformId)) {
    return true; 
  }

  if (!authService.isLoggedIn()) {
    router.navigate(['/login']);
    return false;
  }

  return true;
};

export const adminGuard: CanActivateFn = () => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const platformId = inject(PLATFORM_ID);

  if (!isPlatformBrowser(platformId)) {
    return true;
  }

  if (!authService.isLoggedIn()) {
    router.navigate(['/login']);
    return false;
  }

  if (!authService.isAdmin()) {
    router.navigate(['/shop']);
    return false;
  }

  return true;
};