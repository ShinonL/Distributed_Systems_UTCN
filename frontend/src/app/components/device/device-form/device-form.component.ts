import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Device } from 'src/app/models/device.model';
import { DeviceService } from 'src/app/services/device.service';
import { Address } from 'src/app/models/address.model';
import { AddressService } from 'src/app/services/address.service';

@Component({
  selector: 'app-device-form',
  templateUrl: './device-form.component.html',
  styleUrls: ['./device-form.component.scss']
})
export class DeviceFormComponent implements OnInit {
  addresses: Address[] = [];
  newAddress: boolean = false;
  addressId: string = '';

  description: FormControl;
  addressLine1: FormControl;
  addressLine2: FormControl;
  maximumHourlyConsumption: FormControl;

  constructor(
    private deviceService: DeviceService, 
    private addressService: AddressService,
    @Inject(MAT_DIALOG_DATA) public data: any
    ) {
    this.description = new FormControl(this.data?.device?.description ?? '', Validators.required);
    this.addressLine1 = new FormControl(this.data?.device?.address.addressLine1 ?? '', Validators.required);
    this.addressLine2 = new FormControl(this.data?.device?.address?.addressLine2 ?? '');
    this.maximumHourlyConsumption = new FormControl(this.data?.device?.maximumHourlyConsumption ?? '', Validators.required);

    if (!!this.data?.device) {
      this.addressId = this.data?.device?.address.id ?? '';
      this.newAddress = false;
    }


    this.addressService.getAddresses(this.data.username).subscribe(
      (res) => this.addresses = res.data,
      (err) => console.log(err)
    )
  }

  ngOnInit(): void {
  }

  onRegister() {
    var device: Device = {
      description : this.description.value,
      maximumHourlyConsumption: this.maximumHourlyConsumption.value,
      energyConsumptions: [],
      user: { username: this.data.username }
    }

    device.address = this.addresses.find(address => address.id === this.addressId) ?? {
      addressLine1 : this.addressLine1.value,
      addressLine2 : this.addressLine2.value,
    };

    this.deviceService.createDevice(device).subscribe(
      (_) => location.reload(),
      (err) => console.log(err)
    )
  }

  onUpdate() {
    var device: Device = {
      id: this.data.device.id,
      description : this.description.value,
      maximumHourlyConsumption: this.maximumHourlyConsumption.value,
      energyConsumptions: this.data.device.energyConsumptions,
      user: { username: this.data.username }
    }

    device.address = this.addresses.find(address => address.id === this.addressId) ?? {
      addressLine1 : this.addressLine1.value,
      addressLine2 : this.addressLine2.value,
    };

    this.deviceService.updateDevice(device).subscribe(
      (_) => location.reload(),
      (err) => console.log(err)
    )
  }

  public parseAddress(address: Address) {
    return this.deviceService.parseAddress(address);
  }

  isDisabled() {
    if (this.addresses.length == 0) {
      this.newAddress = true
      return true;
    }

    return false;
  }
}
