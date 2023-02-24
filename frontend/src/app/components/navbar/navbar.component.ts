import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import { UserFormComponent } from '../user-form/user-form.component';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {

  constructor(public authService: AuthService, private router: Router, public dialog: MatDialog) { }

  ngOnInit(): void {
  }

  public onLogout() {
    return this.authService.logout();
  }

  public viewUsers() {
    this.router.navigate([`admin-home`])
  }

  public viewDevices() {
    this.router.navigate([`home`])
  }

  public chat() {
    this.router.navigate([`chat/${this.authService.getUsername()}`]);
  }

  createUserDialog() {
    const dialogRef = this.dialog.open(UserFormComponent);

    dialogRef.afterClosed().subscribe(_ => {
      this.router.navigate(['admin-home'])
    });
  }
}
