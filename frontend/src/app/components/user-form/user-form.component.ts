import { Component, Inject, Input, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';

import { ADMINISTRATOR, CUSTOMER } from 'src/app/constants/roles';
import { UserModel } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.scss']
})
export class UserFormComponent implements OnInit {
  username: FormControl;
  password: FormControl;
  firstName: FormControl;
  lastName: FormControl;
  phoneNumber: FormControl;
  email: FormControl;
  role: string;

  roles: string[] = [ADMINISTRATOR, CUSTOMER];

  constructor(
    private userService: UserService, 
    @Inject(MAT_DIALOG_DATA) public data: UserModel
    ) {
    this.username = new FormControl(
      {value: this.data?.username ?? '', disabled: this.isDisabled()},
      Validators.required
    );
    this.password = new FormControl(
      {value: this.data?.password ?? '', disabled: this.isDisabled()}, Validators.required);
    this.firstName = new FormControl(this.data?.firstName ?? '', Validators.required);
    this.lastName = new FormControl(this.data?.lastName ?? '', Validators.required);
    this.phoneNumber = new FormControl(this.data?.phoneNumber ?? '', Validators.required);
    this.email = new FormControl(this.data?.email ?? '', Validators.required);
    this.role = this.data?.role ?? ''
  }

  ngOnInit(): void {
  }

  onRegister() {
    var user = {
      username : this.username.value,
      password : this.password.value,
      firstName : this.firstName.value,
      lastName : this.lastName .value,
      phoneNumber : this.phoneNumber.value,
      email : this.email.value,
      role : this.role
    }

    this.userService.createUser(user).subscribe(
      (res) => location.reload(),
      (err) => console.log(err)
    )
  }

  onUpdate() {
    var user = {
      id: this.data.id ?? '',
      username : this.username.value,
      password : this.password.value,
      firstName : this.firstName.value,
      lastName : this.lastName .value,
      phoneNumber : this.phoneNumber.value,
      email : this.email.value,
      role : this.role
    }

    this.userService.updateUser(user).subscribe(
      (res) => location.reload(),
      (err) => console.log(err)
    )
  }

  isDisabled() {
    return !!this.data
  }
}
