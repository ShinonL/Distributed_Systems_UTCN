// package: chat.server
// file: ChatServer.proto

var ChatServer_pb = require("./ChatServer_pb");
var grpc = require("@improbable-eng/grpc-web").grpc;

var ChatServer = (function () {
  function ChatServer() {}
  ChatServer.serviceName = "chat.server.ChatServer";
  return ChatServer;
}());

ChatServer.join = {
  methodName: "join",
  service: ChatServer,
  requestStream: false,
  responseStream: false,
  requestType: ChatServer_pb.UserProto,
  responseType: ChatServer_pb.JoinResponse
};

ChatServer.sendMessage = {
  methodName: "sendMessage",
  service: ChatServer,
  requestStream: false,
  responseStream: false,
  requestType: ChatServer_pb.ChatMessage,
  responseType: ChatServer_pb.SendMessageResponse
};

ChatServer.receiveMessage = {
  methodName: "receiveMessage",
  service: ChatServer,
  requestStream: false,
  responseStream: true,
  requestType: ChatServer_pb.ReceiveMessageRequest,
  responseType: ChatServer_pb.ChatMessage
};

ChatServer.getAllUsers = {
  methodName: "getAllUsers",
  service: ChatServer,
  requestStream: false,
  responseStream: false,
  requestType: ChatServer_pb.Empty,
  responseType: ChatServer_pb.UserList
};

ChatServer.getMessagesForUser = {
  methodName: "getMessagesForUser",
  service: ChatServer,
  requestStream: false,
  responseStream: false,
  requestType: ChatServer_pb.Convo,
  responseType: ChatServer_pb.MessagesList
};

exports.ChatServer = ChatServer;

function ChatServerClient(serviceHost, options) {
  this.serviceHost = serviceHost;
  this.options = options || {};
}

ChatServerClient.prototype.join = function join(requestMessage, metadata, callback) {
  if (arguments.length === 2) {
    callback = arguments[1];
  }
  var client = grpc.unary(ChatServer.join, {
    request: requestMessage,
    host: this.serviceHost,
    metadata: metadata,
    transport: this.options.transport,
    debug: this.options.debug,
    onEnd: function (response) {
      if (callback) {
        if (response.status !== grpc.Code.OK) {
          var err = new Error(response.statusMessage);
          err.code = response.status;
          err.metadata = response.trailers;
          callback(err, null);
        } else {
          callback(null, response.message);
        }
      }
    }
  });
  return {
    cancel: function () {
      callback = null;
      client.close();
    }
  };
};

ChatServerClient.prototype.sendMessage = function sendMessage(requestMessage, metadata, callback) {
  if (arguments.length === 2) {
    callback = arguments[1];
  }
  var client = grpc.unary(ChatServer.sendMessage, {
    request: requestMessage,
    host: this.serviceHost,
    metadata: metadata,
    transport: this.options.transport,
    debug: this.options.debug,
    onEnd: function (response) {
      if (callback) {
        if (response.status !== grpc.Code.OK) {
          var err = new Error(response.statusMessage);
          err.code = response.status;
          err.metadata = response.trailers;
          callback(err, null);
        } else {
          callback(null, response.message);
        }
      }
    }
  });
  return {
    cancel: function () {
      callback = null;
      client.close();
    }
  };
};

ChatServerClient.prototype.receiveMessage = function receiveMessage(requestMessage, metadata) {
  var listeners = {
    data: [],
    end: [],
    status: []
  };
  var client = grpc.invoke(ChatServer.receiveMessage, {
    request: requestMessage,
    host: this.serviceHost,
    metadata: metadata,
    transport: this.options.transport,
    debug: this.options.debug,
    onMessage: function (responseMessage) {
      listeners.data.forEach(function (handler) {
        handler(responseMessage);
      });
    },
    onEnd: function (status, statusMessage, trailers) {
      listeners.status.forEach(function (handler) {
        handler({ code: status, details: statusMessage, metadata: trailers });
      });
      listeners.end.forEach(function (handler) {
        handler({ code: status, details: statusMessage, metadata: trailers });
      });
      listeners = null;
    }
  });
  return {
    on: function (type, handler) {
      listeners[type].push(handler);
      return this;
    },
    cancel: function () {
      listeners = null;
      client.close();
    }
  };
};

ChatServerClient.prototype.getAllUsers = function getAllUsers(requestMessage, metadata, callback) {
  if (arguments.length === 2) {
    callback = arguments[1];
  }
  var client = grpc.unary(ChatServer.getAllUsers, {
    request: requestMessage,
    host: this.serviceHost,
    metadata: metadata,
    transport: this.options.transport,
    debug: this.options.debug,
    onEnd: function (response) {
      if (callback) {
        if (response.status !== grpc.Code.OK) {
          var err = new Error(response.statusMessage);
          err.code = response.status;
          err.metadata = response.trailers;
          callback(err, null);
        } else {
          callback(null, response.message);
        }
      }
    }
  });
  return {
    cancel: function () {
      callback = null;
      client.close();
    }
  };
};

ChatServerClient.prototype.getMessagesForUser = function getMessagesForUser(requestMessage, metadata, callback) {
  if (arguments.length === 2) {
    callback = arguments[1];
  }
  var client = grpc.unary(ChatServer.getMessagesForUser, {
    request: requestMessage,
    host: this.serviceHost,
    metadata: metadata,
    transport: this.options.transport,
    debug: this.options.debug,
    onEnd: function (response) {
      if (callback) {
        if (response.status !== grpc.Code.OK) {
          var err = new Error(response.statusMessage);
          err.code = response.status;
          err.metadata = response.trailers;
          callback(err, null);
        } else {
          callback(null, response.message);
        }
      }
    }
  });
  return {
    cancel: function () {
      callback = null;
      client.close();
    }
  };
};

exports.ChatServerClient = ChatServerClient;

