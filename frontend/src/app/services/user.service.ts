import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { CREATE_USER, DELETE_USER, GET_USERS, UPDATE_USER } from '../constants/endpoints';
import { ADMINISTRATOR } from '../constants/roles';
import { ApiRespone } from '../models/api-response.model';
import { UserModel } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  constructor(protected httpClient: HttpClient) {}

  public getUsers(): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .get<ApiRespone>(`${GET_USERS}`, {headers: headers})
  }

  public deleteUser(userId: string): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .delete<ApiRespone>(`${DELETE_USER}${userId}`, {headers: headers});
  }

  public createUser(user: UserModel): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .post<ApiRespone>(`${CREATE_USER}`, user, {headers: headers});
  }

  public updateUser(user: UserModel): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .put<ApiRespone>(`${UPDATE_USER}`, user, {headers: headers});
  }

  public parseName(user: UserModel): string {
    return (user.firstName ?? '') + ' ' + (user.lastName ?? '');
  }

  public parseRole(user: UserModel): string {
    return user.role === ADMINISTRATOR ? 'Administrator' : 'Customer';
  }
}
