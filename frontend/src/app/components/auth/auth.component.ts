import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';

import { ADMINISTRATOR, CUSTOMER } from 'src/app/constants/roles';
import { UserModel } from 'src/app/models/user.model';
import { AuthService } from 'src/app/services/auth.service';

const SCRIPT_PATH = '..\\..\\..\\assets\\scripts\\main.js';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.scss']
})
export class AuthComponent implements OnInit {
  public registerForm: FormGroup;
  public loginForm: FormGroup;
  roles: string[] = [ADMINISTRATOR, CUSTOMER];

  constructor(private authService: AuthService, public router: Router) { 
    this.loadScripts();

    this.registerForm = new FormGroup({
      lastName: new FormControl(''),
      firstName: new FormControl(''),
      email: new FormControl(''),
      phoneNumber: new FormControl(''),
      username: new FormControl(''),
      password: new FormControl(''),
      role: new FormControl(CUSTOMER)
    });

    this.loginForm = new FormGroup({
      username: new FormControl(''),
      password: new FormControl('')
    });
  }
 
  ngOnInit() {
    sessionStorage.clear();
  }

  loadScripts() {
    const node = document.createElement('script');
    node.src = SCRIPT_PATH;
    node.type = 'text/javascript';
    node.async = false;
    node.charset = 'utf-8';
    document.getElementsByTagName('head')[0].appendChild(node);
  }

  register() {
    const user: UserModel = {
      username : this.registerForm.get('username')?.value,
      password : this.registerForm.get('password')?.value,
      firstName : this.registerForm.get('firstName')?.value,
      lastName : this.registerForm.get('lastName')?.value,
      phoneNumber : this.registerForm.get('phoneNumber')?.value,
      email : this.registerForm.get('email')?.value,
      role: this.registerForm.get('role')?.value
    }

    this.authService.register(user).subscribe(
        (res) => {
          sessionStorage.setItem('token', res.data);

          if (this.authService.isAdministrator()) {
            this.router.navigate(['admin-home']);
          } else {
            this.router.navigate(['home']);
          }
        }, 
        (err) => console.log(err)
      );
  }

  login() {
    const user: UserModel = {
      username : this.loginForm.get('username')?.value,
      password : this.loginForm.get('password')?.value
    }

    this.authService.login(user).subscribe(
        (res) => {
          sessionStorage.setItem('token', res.data);
          
          if (this.authService.isAdministrator()) {
            this.router.navigate(['admin-home']);
          } else {
            this.router.navigate(['home']);
          }
        }, 
        (err) => console.log(err)
      );
  }
}
