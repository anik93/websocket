package com.packt.ship.controller;

import java.security.Principal;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

import com.packt.ship.domain.Message;
import com.packt.ship.domain.User;
import com.packt.ship.service.ChatService;
import com.packt.ship.service.RoomService;
import com.packt.ship.service.UserService;

@Controller
public class RoomChatController {

	@Autowired
	private ChatService chatService;

	@Autowired
	private RoomService roomService;
	
	@Autowired
	private UserService userService;
	
	@MessageMapping("/roomChat")
	@SendToUser("/queue/roomPrivateChat")
	public void handleRoomPrivateChat(Principal principal, Message message) {
		message.setUser(principal.getName());
		User user = userService.getUserByName(principal.getName());
		List<User> listOfUsers = roomService.getUsersFromUserRoom(user);
		/*List<User> listOfUsers = new ArrayList<>();
		User user = new User();
		User user1 = new User();
		if(message.getUser().equals("test")){
			user.setName("test");
			user.setStatus(UserStatus.Playing);
			user.setId_r(1);
			user1.setName("franek");
			user1.setStatus(UserStatus.Observator);
			user1.setId_r(1);
		} else {
			System.out.println("ktory");
			user.setName(principal.getName());
			user.setStatus(UserStatus.Observator);
			user.setId_r(1);
			user1.setName("test");
			user1.setStatus(UserStatus.Playing);
			user1.setId_r(1);
		}
		listOfUsers.add(user1);
		listOfUsers.add(user);*/
		message.setDate(LocalTime.now().toString());
		chatService.broadcastMessageToRoom(message, listOfUsers, user);
	}	
	
}
