package com.packt.ship.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.ship.domain.Room;
import com.packt.ship.domain.RoomStatus;
import com.packt.ship.domain.User;
import com.packt.ship.repository.RoomRepository;
import com.packt.ship.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomRepository roomRepository;
	
	public List<User> getUsersFromUserRoom(User user){
		List<User> listOfUsers = new ArrayList<>();
		listOfUsers.add(user);
		return listOfUsers;
	}

	@Override
	public Map<RoomStatus, List<Room>> getRooms() {
		return roomRepository.getRooms();
	}
	
	
}
