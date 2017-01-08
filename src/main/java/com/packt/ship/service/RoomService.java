package com.packt.ship.service;

import java.util.List;
import java.util.Map;

import com.packt.ship.domain.Room;
import com.packt.ship.domain.RoomStatus;
import com.packt.ship.domain.User;

public interface RoomService {

	public List<User> getUsersFromUserRoom(User user);
	
	public Map<RoomStatus, List<Room>> getRooms();
}
