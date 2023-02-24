import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { EnergyConsumptionService } from 'src/app/services/energy-consumption.service';

@Component({
  selector: 'app-energy-form',
  templateUrl: './energy-form.component.html',
  styleUrls: ['./energy-form.component.scss']
})
export class EnergyFormComponent implements OnInit {
  energyConsumption: FormControl;
  date: FormControl;

  defaultValue= {hour: 13, minute: 30};

  startDateFilter = (date: Date | null): boolean => {
    const startDate = date || new Date();
    return startDate >= new Date();
  };

  timeChangeHandler(event: Date) {
    this.defaultValue = {hour: event.getHours(), minute: event.getMinutes()}
  }

  constructor(
    private ecService: EnergyConsumptionService,
    @Inject(MAT_DIALOG_DATA) public data: any
    ) {
    this.energyConsumption = new FormControl('', Validators.required);
    this.date = new FormControl('', Validators.required);
  }

  ngOnInit(): void {
  }

  onRegister() {
    var timestamp = new Date(this.date.value);
    timestamp.setHours(this.defaultValue.hour);
    timestamp.setMinutes(this.defaultValue.minute);

    var ec = {
      energyConsumption: this.energyConsumption.value,
      timestamp: timestamp
    };

    this.ecService.createEC(ec, this.data.deviceId).subscribe(
      (_) => location.reload(),
      (err) => console.log(err)
    )
  }
}
