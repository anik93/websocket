package com.packt.ship.repository;

import java.util.List;
import java.util.Map;

import com.packt.ship.domain.Room;
import com.packt.ship.domain.RoomStatus;

public interface RoomRepository {

	public Map<RoomStatus, List<Room>> getRooms();
	
	public Room getRoom(int id);
}
