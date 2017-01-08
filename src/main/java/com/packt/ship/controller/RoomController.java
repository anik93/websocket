package com.packt.ship.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.packt.ship.domain.Room;
import com.packt.ship.domain.RoomStatus;
import com.packt.ship.service.RoomService;
import com.packt.ship.service.UserService;

@Controller
@RequestMapping("/rooms")
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "get", method = RequestMethod.GET)
	public String getRooms(Model model, HttpServletRequest request){
		model.addAttribute("session", request.getRemoteUser());
		model.addAttribute("rooms", roomService.getRooms());
		return "rooms";
	}
	
	@RequestMapping(value = "createPrivate", method = RequestMethod.GET)
	public String createPrivate(Model model, HttpServletRequest request){
		model.addAttribute("roomType", RoomStatus.PRIVATE);
		model.addAttribute("session", request.getRemoteUser());
		model.addAttribute("rooms", roomService.getRooms());
		model.addAttribute("users", userService.getFreeUsers());
		return "roomGame";
	}
	
	@RequestMapping(value = "createPublic", method = RequestMethod.GET)
	public String createPublic(Model model, HttpServletRequest request){
		model.addAttribute("roomType", RoomStatus.PUBLIC);
		model.addAttribute("session", request.getRemoteUser());
		model.addAttribute("rooms", roomService.getRooms());
		model.addAttribute("users", userService.getFreeUsers());
		return "roomGame";
	}
	
	@MessageMapping("/inviteGame")
	@SendToUser("/queue/inviteGame")
	public void handleRoomGame(Principal principal, Room room) {
		
	}
}
