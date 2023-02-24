package ds.assignment.backend.broker;

import ds.assignment.backend.dtos.EnergyConsumptionDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class Producer {
    private final AmqpTemplate amqpTemplate;

    public Producer(AmqpTemplate amqpTemplate) {
        this.amqpTemplate = amqpTemplate;
    }

    public void publish(EnergyConsumptionDTO deviceEnergyConsumptionDTO, String exchange, String routingKey) {
        amqpTemplate.convertAndSend(exchange, routingKey, deviceEnergyConsumptionDTO);
        log.debug("Send::RabbitMQ::" + exchange + "::" + routingKey + ":: payload = " + deviceEnergyConsumptionDTO);
    }
}
