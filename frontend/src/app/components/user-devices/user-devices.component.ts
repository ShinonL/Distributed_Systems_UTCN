import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';

import { DeviceFormComponent } from '../device/device-form/device-form.component';

@Component({
  selector: 'app-user-devices',
  templateUrl: './user-devices.component.html',
  styleUrls: ['./user-devices.component.scss']
})
export class UserDevicesComponent implements OnInit {
  public username: string;

  constructor(aRoute: ActivatedRoute, private dialog: MatDialog, private router: Router) { 
    this.username = aRoute.snapshot.params['username'];
  }

  ngOnInit(): void {
  }

  public createDevice() {
    const dialogRef = this.dialog.open(DeviceFormComponent, {
      data: {
        username: this.username
      }
    });

    dialogRef.afterClosed().subscribe(_ => {
      this.router.navigate([`user-device/${this.username}`])
    });
  }
}
