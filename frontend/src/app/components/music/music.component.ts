import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

interface Music {
  id?: number;
  title: string;
  artist: string;
  youtube_link: string;
}

@Component({
  selector: 'app-music',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './music.component.html',
  styleUrls: ['./music.component.css']
})

export class MusicComponent implements OnInit {
  musicList: Music[] = [];
  newTrack: Music = { title: '', artist: '', youtube_link: '' };
  
  isAdmin = false;
  userRole: string | null = '';
  private backendUrl = 'http://localhost:8080/api/music'; // Points to MusicController

  constructor(
    private http: HttpClient, 
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    if (!this.authService.isLoggedIn()) {
      this.router.navigate(['/login']);
      return;
    }

    this.isAdmin = this.authService.isAdmin();
    this.userRole = this.authService.getUserRole();
    this.fetchMusicCatalog();
  }

  fetchMusicCatalog() {
    this.http.get<Music[]>(this.backendUrl).subscribe({
      next: (data) => this.musicList = data,
      error: (err) => console.error('Could not fetch music inventory', err)
    });
  }

  saveTrack() {
    this.http.post<Music>(this.backendUrl, this.newTrack).subscribe({
      next: () => {
        this.fetchMusicCatalog(); 
        this.newTrack = { title: '', artist: '', youtube_link: '' }; 
      },
      error: (err) => alert('Action failed. Check API configuration setup.')
    });
  }

  deleteTrack(id: number) {
    if(confirm('Are you sure you want to remove this music entry?')) {
      this.http.delete(`${this.backendUrl}/${id}`).subscribe({
        next: () => this.fetchMusicCatalog(),
        error: (err) => console.error('Error executing delete action', err)
      });
    }
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}