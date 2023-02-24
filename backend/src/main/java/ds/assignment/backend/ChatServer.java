package ds.assignment.backend;

import chat.server.*;
import com.google.protobuf.Timestamp;
import com.google.protobuf.util.Timestamps;
import io.grpc.stub.StreamObserver;
import lombok.extern.slf4j.Slf4j;
import org.lognet.springboot.grpc.GRpcService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

@GRpcService
@Slf4j
public class ChatServer extends ChatServerGrpc.ChatServerImplBase {
    private Map<UserProto, StreamObserver<JoinResponse>> connectedUsers = new HashMap<>();
    private List<ChatMessage> messages = new ArrayList<>();
    private Map<String, StreamObserver<ChatMessage>> listeners = new HashMap<>();

    @Override
    public void join(UserProto request, StreamObserver<JoinResponse> responseObserver) {
        String username = request.getUsername();
        Timestamp timestamp = Timestamps.fromMillis(System.currentTimeMillis());

        AtomicBoolean found = new AtomicBoolean(false);
        connectedUsers.forEach((key, value) -> {
            if (!found.get())
                found.set(key.getUsername().equals(username));
        });

        if (found.get()) {
            log.warn("Username " + username + " is already connected.");

            JoinResponse serverErrorMessage = JoinResponse.newBuilder()
                .setMessage("Username " + username + " is already connected.")
                .setResponseStatusCode(400)
                .setTimestamp(timestamp)
                .build();

            responseObserver.onNext(serverErrorMessage);
            responseObserver.onCompleted();

            return;
        }

        JoinResponse serverSuccessMessage = JoinResponse.newBuilder()
            .setMessage("Connected to Chat")
            .setResponseStatusCode(200)
            .setTimestamp(timestamp)
            .build();

        connectedUsers.put(request, responseObserver);
        log.info("Connected to Chat");

        responseObserver.onNext(serverSuccessMessage);
        responseObserver.onCompleted();
    }

    @Override
    public void sendMessage(ChatMessage request, StreamObserver<SendMessageResponse> responseObserver) {
        log.info("Received client message: {} from user: {}", request.getMessage(), request.getSender());

        SendMessageResponse message = SendMessageResponse.newBuilder()
                .setMessage(request.getMessage())
                .setSender(request.getReceiver())
                .setReceiver(request.getSender())
                .setTimestamp(Timestamps.fromMillis(System.currentTimeMillis()))
                .build();

        messages.add(request);

        listeners.forEach((username, subscribedObserver) -> {
            if(request.getReceiver().equals(username)) {
                subscribedObserver.onNext(request);
            }
        });

        responseObserver.onNext(message);
        responseObserver.onCompleted();
    }

    @Override
    public void getAllUsers(Empty request, StreamObserver<UserList> responseObserver) {
        List<UserProto> users = new ArrayList<>();
        connectedUsers.forEach((connectedUser, streamObserver) -> {
            log.info("username " + connectedUser.getUsername() + " role " + connectedUser.getRole());
            UserProto user = UserProto.newBuilder()
                    .setUsername(connectedUser.getUsername())
                    .setRole(connectedUser.getRole())
                    .build();
            users.add(user);
        });
        UserList usersList = UserList.newBuilder().addAllUsers(users).build();
        responseObserver.onNext(usersList);
        responseObserver.onCompleted();
    }

    @Override
    public void getMessagesForUser(Convo request, StreamObserver<MessagesList> responseObserver) {
        List<ChatMessage> chatMessagesForUser = new ArrayList<>();
        messages.forEach(chatMessage -> {
            if ((chatMessage.getSender().equals(request.getSender()) && chatMessage.getReceiver().equals(request.getReveiver())) ||
                    (chatMessage.getSender().equals(request.getReveiver()) && chatMessage.getReceiver().equals(request.getSender()))) {
                chatMessagesForUser.add(chatMessage);
            }
        });

        MessagesList messagesList = MessagesList.newBuilder().addAllChatMessages(chatMessagesForUser).build();

        responseObserver.onNext(messagesList);
        responseObserver.onCompleted();
    }

    @Override
    public void receiveMessage(ReceiveMessageRequest request, StreamObserver<ChatMessage> responseObserver) {
        listeners.put(request.getUserToReceiveMessages(), responseObserver);
        responseObserver.onNext(ChatMessage.newBuilder().build());
    }

//    @Override
//    public void getConversation(ConversationRequest request, StreamObserver<MessagesList> responseObserver) {
//        List<ChatMessage> conversationMessages = new ArrayList<>();
//        chatMessages.forEach(chatMessage -> {
//            if (chatMessage.getSender().equals(request.getParticipantOne()) ||
//                    chatMessage.getReceiver().equals(request.getParticipantOne()) ||
//                    chatMessage.getSender().equals(request.getParticipantTwo()) ||
//                    chatMessage.getReceiver().equals(request.getParticipantTwo())) {
//                conversationMessages.add(chatMessage);
//            }
//        });
//
//        MessagesList messagesList = MessagesList.newBuilder().addAllChatMessages(conversationMessages).build();
//
//        responseObserver.onNext(messagesList);
//        responseObserver.onCompleted();
//    }
}
