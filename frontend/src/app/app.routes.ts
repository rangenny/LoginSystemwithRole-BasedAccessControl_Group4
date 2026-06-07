import { Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { MusicComponent } from './components/music/music.component';

export const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'music', component: MusicComponent },
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: '**', redirectTo: '/login' }
];