package com.packt.ship.controller;

import java.security.Principal;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

import com.packt.ship.domain.Room;

@Controller
public class GameController {
	
	@MessageMapping("/roomGame")
	@SendToUser("/queue/roomGame")
	public void handleRoomGame(Principal principal, Room room) {
		
	}
}
