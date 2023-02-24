import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiRespone } from '../models/api-response.model';
import { EnergyConsumption } from '../models/energy-consumption.model';
import { CREATE_EC } from '../constants/endpoints';

@Injectable({
  providedIn: 'root'
})
export class EnergyConsumptionService {
  constructor(protected httpClient: HttpClient) {}

  public createEC(energyConsumption: EnergyConsumption, deviceId: string): Observable<ApiRespone> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + sessionStorage.getItem('token'));

    return this.httpClient
      .post<ApiRespone>(`${CREATE_EC}/${deviceId}`, energyConsumption, {headers: headers});
  }
}
