import { Component, signal, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-profilo',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './profilo.component.html'
})
export class ProfiloComponent implements OnInit {
  // Iniezione dei servizi
  private userService = inject(UserService);

  utente = signal<any>(null);

  ngOnInit() {
    this.caricaProfilo();
  }

  caricaProfilo() {
    this.userService.getProfile().subscribe({
      next: (data) => {
        console.log('Dati profilo ricevuti:', data);
        this.utente.set(data);
      },
      error: (err) => {
        console.error('Errore caricamento profilo:', err);
        if (err.status === 401) {
           alert("Sessione scaduta!");
        }
      }
    });
  }
}