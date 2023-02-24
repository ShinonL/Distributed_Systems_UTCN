// package: chat.server
// file: ChatServer.proto

import * as ChatServer_pb from "./ChatServer_pb";
import {grpc} from "@improbable-eng/grpc-web";

type ChatServerjoin = {
  readonly methodName: string;
  readonly service: typeof ChatServer;
  readonly requestStream: false;
  readonly responseStream: false;
  readonly requestType: typeof ChatServer_pb.UserProto;
  readonly responseType: typeof ChatServer_pb.JoinResponse;
};

type ChatServersendMessage = {
  readonly methodName: string;
  readonly service: typeof ChatServer;
  readonly requestStream: false;
  readonly responseStream: false;
  readonly requestType: typeof ChatServer_pb.ChatMessage;
  readonly responseType: typeof ChatServer_pb.SendMessageResponse;
};

type ChatServerreceiveMessage = {
  readonly methodName: string;
  readonly service: typeof ChatServer;
  readonly requestStream: false;
  readonly responseStream: true;
  readonly requestType: typeof ChatServer_pb.ReceiveMessageRequest;
  readonly responseType: typeof ChatServer_pb.ChatMessage;
};

type ChatServergetAllUsers = {
  readonly methodName: string;
  readonly service: typeof ChatServer;
  readonly requestStream: false;
  readonly responseStream: false;
  readonly requestType: typeof ChatServer_pb.Empty;
  readonly responseType: typeof ChatServer_pb.UserList;
};

type ChatServergetMessagesForUser = {
  readonly methodName: string;
  readonly service: typeof ChatServer;
  readonly requestStream: false;
  readonly responseStream: false;
  readonly requestType: typeof ChatServer_pb.Convo;
  readonly responseType: typeof ChatServer_pb.MessagesList;
};

export class ChatServer {
  static readonly serviceName: string;
  static readonly join: ChatServerjoin;
  static readonly sendMessage: ChatServersendMessage;
  static readonly receiveMessage: ChatServerreceiveMessage;
  static readonly getAllUsers: ChatServergetAllUsers;
  static readonly getMessagesForUser: ChatServergetMessagesForUser;
}

export type ServiceError = { message: string, code: number; metadata: grpc.Metadata }
export type Status = { details: string, code: number; metadata: grpc.Metadata }

interface UnaryResponse {
  cancel(): void;
}
interface ResponseStream<T> {
  cancel(): void;
  on(type: 'data', handler: (message: T) => void): ResponseStream<T>;
  on(type: 'end', handler: (status?: Status) => void): ResponseStream<T>;
  on(type: 'status', handler: (status: Status) => void): ResponseStream<T>;
}
interface RequestStream<T> {
  write(message: T): RequestStream<T>;
  end(): void;
  cancel(): void;
  on(type: 'end', handler: (status?: Status) => void): RequestStream<T>;
  on(type: 'status', handler: (status: Status) => void): RequestStream<T>;
}
interface BidirectionalStream<ReqT, ResT> {
  write(message: ReqT): BidirectionalStream<ReqT, ResT>;
  end(): void;
  cancel(): void;
  on(type: 'data', handler: (message: ResT) => void): BidirectionalStream<ReqT, ResT>;
  on(type: 'end', handler: (status?: Status) => void): BidirectionalStream<ReqT, ResT>;
  on(type: 'status', handler: (status: Status) => void): BidirectionalStream<ReqT, ResT>;
}

export class ChatServerClient {
  readonly serviceHost: string;

  constructor(serviceHost: string, options?: grpc.RpcOptions);
  join(
    requestMessage: ChatServer_pb.UserProto,
    metadata: grpc.Metadata,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.JoinResponse|null) => void
  ): UnaryResponse;
  join(
    requestMessage: ChatServer_pb.UserProto,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.JoinResponse|null) => void
  ): UnaryResponse;
  sendMessage(
    requestMessage: ChatServer_pb.ChatMessage,
    metadata: grpc.Metadata,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.SendMessageResponse|null) => void
  ): UnaryResponse;
  sendMessage(
    requestMessage: ChatServer_pb.ChatMessage,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.SendMessageResponse|null) => void
  ): UnaryResponse;
  receiveMessage(requestMessage: ChatServer_pb.ReceiveMessageRequest, metadata?: grpc.Metadata): ResponseStream<ChatServer_pb.ChatMessage>;
  getAllUsers(
    requestMessage: ChatServer_pb.Empty,
    metadata: grpc.Metadata,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.UserList|null) => void
  ): UnaryResponse;
  getAllUsers(
    requestMessage: ChatServer_pb.Empty,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.UserList|null) => void
  ): UnaryResponse;
  getMessagesForUser(
    requestMessage: ChatServer_pb.Convo,
    metadata: grpc.Metadata,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.MessagesList|null) => void
  ): UnaryResponse;
  getMessagesForUser(
    requestMessage: ChatServer_pb.Convo,
    callback: (error: ServiceError|null, responseMessage: ChatServer_pb.MessagesList|null) => void
  ): UnaryResponse;
}

