import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import SockJS from 'sockjs-client';
import { NOTIFY_HIGH_CONSUMPTION } from 'src/app/constants/endpoints';
import { Device } from 'src/app/models/device.model';
import { AuthService } from 'src/app/services/auth.service';
import Stomp from 'stompjs';
import { QueueMessageComponent } from '../queue-message/queue-message.component';

@Component({
  selector: 'app-customer-home',
  templateUrl: './customer-home.component.html',
  styleUrls: ['./customer-home.component.scss']
})
export class CustomerHomeComponent implements OnInit {
  public devices: Device[] = [];

  private handleOpenSocket = (dialog: MatDialog) => {
    var sock = new SockJS(NOTIFY_HIGH_CONSUMPTION);
    sock.onopen = function() {
        console.log('open socket');
    };

    sock.onmessage = function(e) {
        sock.close();
    };

    sock.onclose = function() {
        console.log('close');
    };

    var stompcli = Stomp.over(sock);

    stompcli.connect({}, function (frame) {
      stompcli.subscribe('/broker/notify-high-consumption', function (res) {
        console.log(res);
        
        dialog.open(QueueMessageComponent, {
          data: JSON.parse(res.body)
        });
      });
    });
  }

  constructor(private authService: AuthService, private dialog: MatDialog) {
  }

  ngOnInit(): void {
    this.handleOpenSocket(this.dialog);
  }

  public getUsername() {
    return this.authService.getUsername();
  }
}
