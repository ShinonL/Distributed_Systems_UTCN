import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { Device } from 'src/app/models/device.model';
import { AuthService } from 'src/app/services/auth.service';
import { DeviceService } from 'src/app/services/device.service';
import { EnergyFormComponent } from '../../energy-form/energy-form.component';
import { DeviceFormComponent } from '../device-form/device-form.component';

@Component({
  selector: 'app-device-overview',
  templateUrl: './device-overview.component.html',
  styleUrls: ['./device-overview.component.scss']
})
export class DeviceOverviewComponent implements OnInit {
  @Input() username: string = '';
  public devices: Device[] = [];

  constructor(
    private deviceService: DeviceService, 
    protected authService: AuthService, 
    private router: Router,
    private dialog: MatDialog,
    aRoute: ActivatedRoute) {
      this.username = aRoute.snapshot.params['username'];
  }

  ngOnInit(): void { 
    this.deviceService.getDevices(this.username).subscribe(
      (res) => this.devices = res.data,
      (err) => console.log(err)
    )
  }

  public parseAddress(device: Device) {
    if (device.address)
      return this.deviceService.parseAddress(device.address);
    return ''
  }

  public viewDevice(device: Device) {
    this.router.navigate([`device/${device.id}`]);
  }

  public deleteDevice(device: Device) {
    this.deviceService.deleteDevice(device.id ?? '').subscribe(
      (res) => location.reload(),
      (err) => console.log(err)
    )
  }

  public editDevice(device: Device) {
    const dialogRef = this.dialog.open(DeviceFormComponent, {
      data: {
        device: device,
        username: this.username
      }
    });

    dialogRef.afterClosed().subscribe(_ => {
      location.reload()
    });
  }

  public addEC(device: Device) {
    const dialogRef = this.dialog.open(EnergyFormComponent, {
      data: {
        deviceId: device.id
      }
    });

    dialogRef.afterClosed().subscribe(_ => {
      location.reload()
    });
  }
}
