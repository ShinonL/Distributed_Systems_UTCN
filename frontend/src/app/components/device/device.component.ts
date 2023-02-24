import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDatepickerInputEvent } from '@angular/material/datepicker';
import { ActivatedRoute } from '@angular/router';
import { ChartDataset } from 'chart.js';
import { Device } from 'src/app/models/device.model';
import { DeviceService } from 'src/app/services/device.service';

@Component({
  selector: 'app-device',
  templateUrl: './device.component.html',
  styleUrls: ['./device.component.scss']
})
export class DeviceComponent implements OnInit {

  public device!: Device;
  public date!: FormControl;
  dataset: ChartDataset<"bar", number[]>[] = [];

  constructor(private aRoute: ActivatedRoute, private deviceService: DeviceService) { 
  }

  ngOnInit(): void {
    const deviceId = this.aRoute.snapshot.params['id'];

    this.deviceService.getDeviceById(deviceId).subscribe(
      (res) => this.device = res.data,
      (err) => console.log(err)
    )

    this.date = new FormControl(new Date());

    this.changeDataset(this.date.value);
  }

  public parseAddress() {
    if (this.device.address)
      return this.deviceService.parseAddress(this.device.address);
    return '';
  }

  public changeDataset(filterDate: Date): void {
    let map = new Map<number, number>();

    for (let index = 0; index < 24; index++) {
      map.set(index, 0);
    }

    this.device?.energyConsumptions?.forEach(ec => {
      let ecDate = new Date(ec.timestamp);

      let hour = 0;
      if (filterDate.getDate() == ecDate.getDate())
        hour = ((ecDate.getHours() ?? 0) - 2 >= 0) ? (ecDate.getHours() ?? 0) - 2 : 24 - (ecDate.getHours() ?? 0) + 2;
        map.set(hour, (map.get(hour) ?? 0) + ec.energyConsumption);
    });

    this.dataset = [{
      label: "Hourly Consumptions",
      data: Array.from(map.values())
    }]
  }

  public getDataset(): ChartDataset<"bar", number[]>[] {
    return this.dataset;
  }
}
