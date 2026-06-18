export interface UserDTO {
  id: string;
  name: string;
  surname: string;
  username: string;
  email: string;
  role: string;
  active?: boolean; // Opzionale, per la gestione attivazione/disattivazione
}