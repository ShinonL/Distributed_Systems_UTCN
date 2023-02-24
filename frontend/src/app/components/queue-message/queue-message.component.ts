import { Component, Inject, Input, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Device } from 'src/app/models/device.model';

@Component({
  selector: 'app-queue-message',
  templateUrl: './queue-message.component.html',
  styleUrls: ['./queue-message.component.scss']
})
export class QueueMessageComponent implements OnInit {
  public device: Device
  constructor(@Inject(MAT_DIALOG_DATA) public data: Device) { 
    this.device = data;
  }

  ngOnInit(): void {
  }

}
