import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { LoginRequest, SignupRequest } from '../../models/auth.model';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './login.component.html'
})
export class LoginComponent {

  isLoginMode = signal(true);
  errorMessage = signal('');

  loginData: LoginRequest = { username: '', password: '' };

  signupData: SignupRequest = {
    username: '',
    email: '',
    password: '',
    role: ['user']
  };

  constructor(private authService: AuthService, private router: Router) {}
  

  toggleMode() {
    this.isLoginMode.set(!this.isLoginMode());
    this.errorMessage.set('');
  }

  login() {
  this.authService.login(this.loginData).subscribe({
    next: (res) => {
      // NON serve chiamare saveUser(res) qui se lo hai già messo nel tap dell'AuthService
      // La navigazione avverrà solo quando l'AuthService ha già finito di salvare tutto
      if (this.authService.isAdmin()) {
        this.router.navigate(['/dashboard']);
      } else {
        this.router.navigate(['/shop']);
      }
    },
    error: (err) => {
      console.error(err);
      this.errorMessage.set('Username o password errati.');
    }
  });
}

  signup() {
    this.authService.signup(this.signupData).subscribe({
      next: () => {
        this.isLoginMode.set(true);
        this.errorMessage.set('Registrazione completata! Effettua il login.');
      },
      error: () => this.errorMessage.set('Errore durante la registrazione. Riprova.')
    });
  }
}