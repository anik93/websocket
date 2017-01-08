package com.packt.ship.controller;

import java.security.Principal;
import java.time.LocalTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

import com.packt.ship.domain.Message;
import com.packt.ship.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(ChatController.class);

	@MessageMapping("/chat")
	public Message handlecHAT(Message message, Principal principal) {
		message.setDate(LocalTime.now().toString());
		message.setUser(principal.getName());
		return message;
	}

	@MessageMapping("/privateChat")
	@SendToUser("/queue/notifications")
	public void handleprivateChat(Principal principal, Message message) {
		message.setUser(principal.getName());
		message.setDate(LocalTime.now().toString());
		chatService.broadcastMessage(message);
	}
}
