import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { FlexLayoutModule } from '@angular/flex-layout';
import { ChatModule } from '@progress/kendo-angular-conversational-ui';
import { NgChartsModule } from 'ng2-charts';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AuthComponent } from './components/auth/auth.component';
import { MaterialModule } from './material.module';

import { AdminHomeComponent } from './components/admin-home/admin-home.component';
import { CustomerHomeComponent } from './components/customer-home/customer-home.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { DeviceComponent } from './components/device/device.component';
import { ChartComponent } from './components/chart/chart.component';
import { DeviceOverviewComponent } from './components/device/device-overview/device-overview.component';
import { UserDevicesComponent } from './components/user-devices/user-devices.component';
import { UserFormComponent } from './components/user-form/user-form.component';
import { DeviceFormComponent } from './components/device/device-form/device-form.component';
import { EnergyFormComponent } from './components/energy-form/energy-form.component';
import { QueueMessageComponent } from './components/queue-message/queue-message.component';
import { ChatContainerComponent } from './components/chat-container/chat-container.component';
import { MAT_SNACK_BAR_DEFAULT_OPTIONS } from '@angular/material/snack-bar';

@NgModule({
  declarations: [
    AppComponent,
    AuthComponent,
    AdminHomeComponent,
    CustomerHomeComponent,
    NavbarComponent,
    ChartComponent,
    DeviceComponent,
    DeviceOverviewComponent,
    UserDevicesComponent,
    UserFormComponent,
    DeviceFormComponent,
    EnergyFormComponent,
    QueueMessageComponent,
    ChatContainerComponent,
  ],
  imports: [
    ChatModule,
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    MaterialModule,
    FormsModule,
    ReactiveFormsModule,
    NgChartsModule,
    FlexLayoutModule,
  ],
  bootstrap: [AppComponent],
  providers: [
    {provide: MAT_SNACK_BAR_DEFAULT_OPTIONS, useValue: {duration: 2000}}
  ]
})
export class AppModule { }
