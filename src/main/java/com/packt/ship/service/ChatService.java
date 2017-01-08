package com.packt.ship.service;

import java.util.List;

import com.packt.ship.domain.Message;
import com.packt.ship.domain.User;

public interface ChatService {
	void broadcastMessage(Message spittle);

	void broadcastMessageToRoom(Message message, List<User> listOfUsers, User user);
}
