package com.packt.ship.domain;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
public class Room {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_r;
	
	@OneToMany
	@JoinColumn(name = "id_r", nullable = false)
	private Set<User> listOfUsers = new HashSet<>();
	
	@NotNull
	@Enumerated(EnumType.STRING)
	private RoomStatus status;
	
	@Transient 
	private Map<Integer, List<GameState>> mapOfGame = new HashMap<>(9);
	
	public int getId_r() {
		return id_r;
	}

	public void setId_r(int id_r) {
		this.id_r = id_r;
	}
	
	public Set<User> getListOfUsers() {
		return listOfUsers;
	}
	
	public void setListOfUsers(Set<User> listOfUsers) {
		this.listOfUsers = listOfUsers;
	}

	public RoomStatus getStatus() {
		return status;
	}

	public void setStatus(RoomStatus status) {
		this.status = status;
	}

	public Map<Integer, List<GameState>> getMapOfGame() {
		return mapOfGame;
	}

	public void setMapOfGame(Map<Integer, List<GameState>> mapOfGame) {
		this.mapOfGame = mapOfGame;
	}

}
