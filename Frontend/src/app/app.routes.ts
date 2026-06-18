import { Routes } from '@angular/router';
import { ShopComponent } from './pages/shop/shop.component';
import { OrdiniComponent } from './pages/ordini/ordini.component';
import { ProfiloComponent } from './pages/profilo/profilo.component';
import { Dashboard } from './pages/admin/dashboard/dashboard';
import { LoginComponent } from './components/login/login.component';
import { adminGuard, authGuard } from './guards/auth.guard';

export const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'shop', component: ShopComponent, canActivate: [authGuard] },
  { path: 'ordini', component: OrdiniComponent, canActivate: [authGuard] },
  { path: 'profilo', component: ProfiloComponent, canActivate: [authGuard] },
  { path: 'dashboard', component: Dashboard, canActivate: [adminGuard] },
];