import { Component } from '@angular/core';
import { HttpServer } from '../../components/http-server/http-server';
import { SidebarComponent } from '../../components/layout/sidebar.component/sidebar.component';
import { CommonModule } from '@angular/common';
import { EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-shop',
  standalone: true,
  imports: [CommonModule, HttpServer, SidebarComponent],
  template: `
    <div class="d-flex h-100 overflow-hidden">
      <app-sidebar 
        class="flex-shrink-0" 
        style="width: 350px; overflow-y: auto;"
        (apriCheckout)="apriCheckout.emit()">
      </app-sidebar>
      <app-http-server class="flex-grow-1 overflow-auto"></app-http-server>
    </div>
  `
})
export class ShopComponent {
  @Output() apriCheckout = new EventEmitter();
}