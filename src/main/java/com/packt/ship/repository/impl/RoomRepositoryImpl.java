package com.packt.ship.repository.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.packt.ship.domain.Room;
import com.packt.ship.domain.RoomStatus;
import com.packt.ship.repository.RoomRepository;

@Repository
public class RoomRepositoryImpl implements RoomRepository{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Map<RoomStatus, List<Room>> getRooms() {
		Map<RoomStatus, List<Room>> mapOfStatusRooms = new HashMap<>();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Room.class);
		cr.add(Restrictions.eq("status", RoomStatus.PRIVATE));
		List<Room> listOfPrivateRooms = new ArrayList<>(0);		
		listOfPrivateRooms = cr.list();
		Criteria cr1 = session.createCriteria(Room.class);
		List<Room> listOfPublicRooms = new ArrayList<>(0);
		cr1.add(Restrictions.eq("status", RoomStatus.PUBLIC));
		listOfPublicRooms = cr1.list();
		mapOfStatusRooms.put(RoomStatus.PRIVATE, listOfPrivateRooms);
		mapOfStatusRooms.put(RoomStatus.PUBLIC, listOfPublicRooms);
		return mapOfStatusRooms;
	}

	@Override
	public Room getRoom(int id) {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Room.class);
		cr.add(Restrictions.eq("id", id));
		List<Room> listOfUser = new ArrayList<>(0);
		listOfUser = cr.list();
		return listOfUser.get(0);
	}

}
