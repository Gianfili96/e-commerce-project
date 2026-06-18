import { Component, signal, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OrderService } from '../../services/order.service';
import { OrderDTO } from '../../models/order.model';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-ordini',
  standalone: true,
  imports: [CommonModule, RouterLink], // Aggiunto RouterLink per il tasto "Vai allo Shop"
  templateUrl: './ordini.component.html',// Opzionale, se hai stili specifici
})
export class OrdiniComponent implements OnInit {
  // Injection moderna dei servizi
  private orderService = inject(OrderService);

  // Signal tipizzato correttamente per far capire ad Angular quali proprietà esistono
  ordini = signal<OrderDTO[]>([]);
  
  // Stato per gestire il caricamento (opzionale ma consigliato)
  loading = signal<boolean>(true);

  ngOnInit(): void {
    this.caricaStoricoOrdini();
  }

  /**
   * Recupera gli ordini dal server.
   * Non passiamo l'ID perché il service usa il Token JWT 
   * per identificare l'utente nel backend.
   */
  caricaStoricoOrdini() {
    this.loading.set(true);
    
    this.orderService.getMyOrders().subscribe({
      next: (data: OrderDTO[]) => {
        console.log('Ordini ricevuti dal backend:', data);

        // --- APPLICHIAMO IL FILTRO QUI ---
        // Teniamo solo gli ordini dove deactivated è false (o nullo per sicurezza)
        const ordiniAttivi = data.filter(o => !o.deactivated);

        // Ordiniamo gli ordini filtrati dal più recente al più vecchio
        const sortedData = ordiniAttivi.sort((a, b) => 
          new Date(b.creationDate).getTime() - new Date(a.creationDate).getTime()
        );

        // Aggiorniamo il signal con i dati filtrati e ordinati
        this.ordini.set(sortedData);
        this.loading.set(false);
      },
      error: (err) => {
        console.error('Errore durante il recupero degli ordini:', err);
        this.loading.set(false);
        // ... resto del codice
      }
    });
  }
}