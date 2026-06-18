import { Injectable } from '@angular/core';
import { signal } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class CartService {
  clearCartSilent() {
    throw new Error('Method not implemented.');
  }

  carrello = signal<{ id: number, nome: string, prezzo: number, quantita: number }[]>([]);
  totale = signal(0);

  addToCart(prodotto: { id: number, nome: string, prezzo: number }) {
  this.carrello.update(c => {
    const esistente = c.find(p => p.id === prodotto.id);

    if (esistente) {
      // Incremento quantità
      return c.map(p => p.id === prodotto.id ? { ...p, quantita: p.quantita + 1 } : p);
    }

    // Nuovo prodotto
    return [...c, { ...prodotto, quantita: 1 }];
  });

  // Aggiorno totale
  this.totale.update(t => t + prodotto.prezzo);
  }

  
  clearCart() {
  if (this.carrello().length === 0) {
    alert('Il carrello è già vuoto.');
    return;
  }

  const conferma = confirm('Sei sicuro di voler svuotare il carrello?');

  if (conferma) {
    this.carrello.set([]);
    this.totale.set(0);
  }
  }

  clearCartWithoutConfirmation() {
    this.carrello.set([]);
    this.totale.set(0);
  }
  


removeSingleItem(prodotto: { id: number, nome: string, prezzo: number, quantita: number }) {

  let prodottoRimosso = false;

  this.carrello.update(c => {
    return c
      .map(p => {
        if (p.id === prodotto.id) {

          const conferma = confirm('Sei sicuro di voler rimuovere questo prodotto?');

          if (conferma) {
            prodottoRimosso = true;   // Controllo se l'utente ha confermato la rimozione
            return null;
          }

          return p; // Se l'utente ha annullato non rimuovo il prodotto
        }

        return p;
      })
      .filter(p => p !== null) as any;
  });

  // Aggiorno il totale solo se il prodotto è stato rimosso
  if (prodottoRimosso) {
    this.totale.update(t => t - (prodotto.prezzo * prodotto.quantita));
  }
}

modalCheckoutAperto = signal(false);

apriCheckout() {
  this.modalCheckoutAperto.set(true);
}

chiudiCheckout() {
  this.modalCheckoutAperto.set(false);
}


}
