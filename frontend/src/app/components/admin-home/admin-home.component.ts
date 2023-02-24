import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';

import { UserModel } from 'src/app/models/user.model';
import { AuthService } from 'src/app/services/auth.service';
import { UserService } from 'src/app/services/user.service';
import { UserFormComponent } from '../user-form/user-form.component';

@Component({
  selector: 'app-admin-home',
  templateUrl: './admin-home.component.html',
  styleUrls: ['./admin-home.component.scss']
})
export class AdminHomeComponent implements OnInit {
  public users: UserModel[] = [];

  constructor(
    private userService: UserService, 
    private authService: AuthService, 
    private router: Router,
    private dialog: MatDialog) {
  }

  ngOnInit(): void { 
    this.userService.getUsers().subscribe(
      (res) => this.users = res.data,
      (err) => console.log(err)
    )
  }

  public parseName(user: UserModel) {
    return this.userService.parseName(user);
  }

  public parseRole(user: UserModel) {
    return this.userService.parseRole(user);
  }

  public viewDevices(user: UserModel) {
    this.router.navigate([`user-devices/${user.username}`])
  }

  public onDelete(user: UserModel) {
    this.userService.deleteUser(user.id ?? '').subscribe(
      (res) => location.reload(),
      (err) => console.log(err)
    );
  }

  public isDisabled(user: UserModel) {
    return user.username === this.authService.getUsername();
  }

  public editUser(user: UserModel) {
    const dialogRef = this.dialog.open(UserFormComponent, {
      data: user
    });

    dialogRef.afterClosed().subscribe(_ => {
      this.router.navigate(['admin-home'])
    });
  }
}
