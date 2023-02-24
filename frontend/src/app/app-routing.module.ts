import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AdminHomeComponent } from './components/admin-home/admin-home.component';
import { AuthComponent } from './components/auth/auth.component';
import { ChatContainerComponent } from './components/chat-container/chat-container.component';
import { CustomerHomeComponent } from './components/customer-home/customer-home.component';
import { DeviceComponent } from './components/device/device.component';
import { UserDevicesComponent } from './components/user-devices/user-devices.component';
import { CUSTOMER, ADMINISTRATOR } from './constants/roles';
import { AuthGuardService as AuthGuard} from './guards/auth-guard.service';
import { RoleGuardService as RoleGuard } from './guards/role-guard.service';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'admin-home' },
  { path: 'login', component: AuthComponent },
  { 
    path: 'home', 
    component: CustomerHomeComponent,
    canActivate: [RoleGuard],
    data: { 
      expectedRole: CUSTOMER
    } 
  },
  { 
    path: 'device/:id', 
    component: DeviceComponent, 
    canActivate: [AuthGuard] 
  },
  { 
    path: 'admin-home', 
    component: AdminHomeComponent,
    canActivate: [RoleGuard],
    data: { 
      expectedRole: ADMINISTRATOR
    } 
  },
  { 
    path: 'user-devices/:username', 
    component: UserDevicesComponent,
    data: { 
      expectedRole: ADMINISTRATOR
    } 
  },
  { 
    path: 'chat/:username', 
    component: ChatContainerComponent,
    canActivate: [AuthGuard]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
