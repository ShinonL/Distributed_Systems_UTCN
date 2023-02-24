import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { GET_ADDRESSES } from '../constants/endpoints';
import { ApiRespone } from '../models/api-response.model';

@Injectable({
  providedIn: 'root'
})
export class AddressService {
  constructor(protected httpClient: HttpClient) {}

  public getAddresses(username: string): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .get<ApiRespone>(`${GET_ADDRESSES}/${username}`, {headers: headers})
  }
}
