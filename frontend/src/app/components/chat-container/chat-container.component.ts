import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { ADMINISTRATOR, CUSTOMER } from 'src/app/constants/roles';
import { AuthService } from 'src/app/services/auth.service';
import { ChatMessage, Convo, Empty, ReceiveMessageRequest, UserProto } from 'src/proto/ChatServer_pb';
import { ChatServerClient } from 'src/proto/ChatServer_pb_service';

@Component({
  selector: 'app-chat-container',
  templateUrl: './chat-container.component.html',
  styleUrls: ['./chat-container.component.scss']
})
export class ChatContainerComponent implements OnInit {
  chatClient: ChatServerClient = new ChatServerClient("http://localhost:8083");

  public username: string;
  public users: UserProto[] = [];
  public sender: UserProto = new UserProto();
  public receiver: UserProto = new UserProto();
  public newMsg: string = '';
  public messages: ChatMessage[] = [];
  public conv: Convo;

  constructor(aRoute: ActivatedRoute, private _snackBar: MatSnackBar, public authService: AuthService) { 
    this.username = aRoute.snapshot.params['username'];
    this.conv = new Convo();
    this.conv.setSender(this.username); 
    this.conv.setReveiver(''); 

    this.sender.setUsername(this.username);
    this.sender.setRole(authService.getRole());

    this.chatClient.join(this.sender, (err, res) => {
      if (err != null)
        this._snackBar.open(err.message);
      else this._snackBar.open(res?.getMessage() || '');
    })
  }

  ngOnInit(): void {
    this.getUsers();
    this.receiveMsg();
  }

  public sendMessage(): void {
    var msg = new ChatMessage();
    msg.setMessage(this.newMsg || "");
    msg.setSender(this.username || "");
    msg.setReceiver(this.conv.getReveiver());
    
    this.newMsg = "";

    console.log(msg);
    
    this.chatClient.sendMessage(msg, (err, res) => {
      
      this.getMsessages();
      console.log(this.messages);
    });
  }

  onReceiverSelect(receiver: string) {
    this.conv.setReveiver(receiver);
    
    this.getMsessages();
  }

  getMsessages() {
    this.chatClient.getMessagesForUser(this.conv, (err, res) => {
      if (err == null && res !== null) {
        this.messages = [];
         res?.toArray()[0].forEach((element: any) => {
            let mama = new ChatMessage();
            mama.setMessage(element[2]);
            mama.setReceiver(element[1]);
            mama.setSender(element[0]);
            mama.setTime(element[3]);
            this.messages.push(mama);
        });
      }
    })
  }

  getUsers() {
    this.chatClient.getAllUsers(new Empty(), (_, res) => {
      res?.toArray()[0].forEach((element: any) => {
        if (element[1] !== this.username) {
          let usr = new UserProto();
          usr.setRole(element[2]);
          usr.setUsername(element[1]);
          this.users.push(usr);
        }
      });
    })
    window.setInterval(() => this.getMsessages(), 2000);
  }

  receiveMsg() {
    
    let recvMsg = new ReceiveMessageRequest()
    recvMsg.setUsertoreceivemessages(this.username);
    let recvStrem = this.chatClient.receiveMessage(recvMsg);
    recvStrem.on("data", (res) => {
      if (res.getReceiver() === this.username && res.getSender() === this.receiver.getUsername())
      this.messages.push(res);
    })

    window.setInterval(() => this.getMsessages(), 2000);
  }

  isAdmin(role: string) {
    return (!this.authService.isAdministrator() && role == ADMINISTRATOR) || (this.authService.isAdministrator());
  }
}