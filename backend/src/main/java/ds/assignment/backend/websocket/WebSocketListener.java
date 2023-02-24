package ds.assignment.backend.websocket;

import ds.assignment.backend.dtos.DeviceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;


@Component
public class WebSocketListener {

    @Autowired
    private SimpMessagingTemplate webSocket;

    public void pushSystemStatusToWebSocket (DeviceDTO deviceDTO) {
        webSocket.convertAndSend("/broker/notify-high-consumption", deviceDTO);
    }
}