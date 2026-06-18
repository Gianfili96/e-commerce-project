/*export interface OrderRequestDTO {
  productId: number;
  quantity: number;
}

export interface OrderDTO {
  id: number;
  creationDate: string; // LocalDateTime viene inviato come stringa ISO
  items: CartDTO[];
  total: number;       // Rinominato da totalPrice a total per matchare il backend
}

export interface CartDTO {
  id: number;
  productName: string; 
  price: number;       
  quantity: number;    
}*/

// 1. Quello che ricevi dal server (Storico Ordini)
export interface OrderDTO {
  id: number;
  username: string; // Oggetto annidato con i dettagli dell'utente
  creationDate: string;
  items: CartDTO[];
  total: number;
  deactivated: boolean; // <-- AGGIUNGI QUESTA RIGA!
}

export interface CartDTO {
  id: number;
  createdAt: string;
  quantity: number;
  product: ProductDTO; // Oggetto annidato
}

export interface ProductDTO {
  id: number;
  title: string;
  price: number;
  imageUrl?: string;
}

// 2. Quello che invii al server (Checkout)
// Questa è l'interfaccia che ti viene segnalata come mancante!
export interface OrderRequestDTO {
  productId: number;
  quantity: number;
}