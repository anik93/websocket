package com.packt.ship.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.packt.ship.controller.ChatController;
import com.packt.ship.domain.Message;
import com.packt.ship.domain.User;
import com.packt.ship.domain.UserStatus;
import com.packt.ship.service.ChatService;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SimpMessagingTemplate messaging;
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(ChatController.class);

	@Override
	public void broadcastMessage(Message message) {
		messaging.convertAndSendToUser(message.getUser(), "/queue/notifications", message);
		messaging.convertAndSendToUser(message.getTo(), "/queue/notifications", message);
	}

	@Override
	public void broadcastMessageToRoom(Message message, List<User> listOfUsers, User sender) {
		//log.info("sender "+ sender.getStatus());
		for (User user : listOfUsers) {
			//log.info("{}", user.getStatus());
			if (user.getRooms().getId_r() == message.getRoomId()) {
				if (user.getStatus().equals(UserStatus.PLAYING) && sender.getStatus().equals(UserStatus.PLAYING)) {
					messaging.convertAndSendToUser(user.getUserName(), "/queue/roomPrivateChat", message);
				}
				if (user.getStatus().equals(UserStatus.OBSERVATOR)) {
					messaging.convertAndSendToUser(user.getUserName(), "/queue/roomPrivateChat", message);
				}
			}
		}
		// messaging.convertAndSendToUser(sender.getName(),
		// "/queue/roomPrivateChat", message);
	}
}
