import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Observable } from 'rxjs';

import { ApiRespone } from '../models/api-response.model';
import { UserModel } from '../models/user.model';
import { LOGIN, REGISTER } from '../constants/endpoints';
import { ADMINISTRATOR } from '../constants/roles';

const JWT_HELPER = new JwtHelperService();

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  constructor(protected httpClient: HttpClient) {}

  public login(user: UserModel): Observable<ApiRespone> {
    return this.httpClient
      .post<ApiRespone>(`${LOGIN}`, user)
  }

  public register(user: UserModel): Observable<ApiRespone> {
    return this.httpClient
      .post<ApiRespone>(`${REGISTER}`, user)
  }

  public logout(): void {
    sessionStorage.removeItem('token');
    location.reload();
  }

  public isAuthenticated(): boolean {
    const token = sessionStorage.getItem('token') ?? '';
    return !JWT_HELPER.isTokenExpired(token);
  }

  public isAdministrator(): boolean {
    const token = sessionStorage.getItem('token') ?? '';
    return JWT_HELPER.decodeToken(token).role[0].authority === ADMINISTRATOR;
  }

  public getRole(): string {
    const token = sessionStorage.getItem('token') ?? '';
    return JWT_HELPER.decodeToken(token).role[0].authority;
  }

  public getUsername(): string {
    const token = sessionStorage.getItem('token') ?? '';
    return JWT_HELPER.decodeToken(token).username;
  }
}
