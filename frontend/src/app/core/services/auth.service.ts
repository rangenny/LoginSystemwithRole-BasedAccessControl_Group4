import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  // Points to your Spring Boot backend AuthController endpoint
  private apiUrl = 'http://localhost:8080/api/auth';
  
  private currentUserRoleSubject = new BehaviorSubject<string | null>(localStorage.getItem('user_role'));
  public currentUserRole$ = this.currentUserRoleSubject.asObservable();

  constructor(private http: HttpClient) {}

  login(credentials: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/login`, credentials).pipe(
      tap(res => {
        if (res && res.token) {
          localStorage.setItem('token', res.token);
          localStorage.setItem('user_role', res.role);
          this.currentUserRoleSubject.next(res.role);
        }
      })
    );
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('user_role');
    this.currentUserRoleSubject.next(null);
  }

  isLoggedIn(): boolean {
    return !!localStorage.getItem('token');
  }

  isAdmin(): boolean {
    return this.currentUserRoleSubject.value === 'ADMIN';
  }

  getUserRole(): string | null {
    return this.currentUserRoleSubject.value;
  }
}