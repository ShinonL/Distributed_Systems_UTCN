//package grpc.project.chatbackend;
//
//import io.grpc.stub.StreamObserver;
//import org.lognet.springboot.grpc.GRpcService;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import chat.serv.*;
//
//@GRpcService
//public class Chat extends ChatGrpc.ChatImplBase {
//    private Map<String, StreamObserver<ChatMessage>> connectedUsers = new HashMap<>();
//    private List<ChatMessage> messages = new ArrayList<>();
//
//    @Override
//    public void getAllUsers(Empty request, StreamObserver<UserList> responseObserver) {
//        super.getAllUsers(request, responseObserver);
//    }
//
//    @Override
//    public void getMessagesForUser(User request, StreamObserver<MessagesList> responseObserver) {
//        super.getMessagesForUser(request, responseObserver);
//    }
//
//    @Override
//    public void receiveMessage(ReceiveMessageRequest request, StreamObserver<ChatMessage> responseObserver) {
//        if (!connectedUsers.containsKey(request.getUserToReceiveMessages())) {
//            connectedUsers.put(request.getUserToReceiveMessages(), responseObserver);
//        }
//    }
//
//    @Override
//    public void sendMessage(ChatMessage request, StreamObserver<SendMessageResponse> responseObserver) {
//        String message = "Not sent.";
//
//        if (connectedUsers.containsKey(request.getReceiver())) {
//            StreamObserver<ChatMessage> chatMessageStream = connectedUsers.get(request.getReceiver());
//            chatMessageStream.onNext(request);
//
//            message = "Sent message.";
//        }
//
//        SendMessageResponse messageResponse = SendMessageResponse.newBuilder()
//                .setMessage(message)
//                .build();
//        responseObserver.onNext(messageResponse);
//        responseObserver.onCompleted();
//    }
//}
