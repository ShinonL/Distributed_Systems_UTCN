import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { CREATE_DEVICE, DELETE_DEVICE, GET_DEVICES, GET_DEVICE_BY_ID, UPDATE_DEVICE } from '../constants/endpoints';
import { Address } from '../models/address.model';
import { ApiRespone } from '../models/api-response.model';
import { Device } from '../models/device.model';

@Injectable({
  providedIn: 'root'
})
export class DeviceService {
  constructor(protected httpClient: HttpClient) {}

  public getDevices(username: string): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .get<ApiRespone>(`${GET_DEVICES}/${username}`, {headers: headers})
  }

  public getDeviceById(id: string): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .get<ApiRespone>(`${GET_DEVICE_BY_ID}/${id}`, {headers: headers})
  }

  public createDevice(device: Device): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .post<ApiRespone>(`${CREATE_DEVICE}`, device, {headers: headers});
  }

  public deleteDevice(deviceId: string): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .delete<ApiRespone>(`${DELETE_DEVICE}${deviceId}`, {headers: headers});
  }

  public updateDevice(device: Device): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .put<ApiRespone>(`${UPDATE_DEVICE}`, device, {headers: headers});
  }

  public parseAddress(address: Address): string {
    return address.addressLine1 + ' ' + (address.addressLine2 ?? '');
  }
}
