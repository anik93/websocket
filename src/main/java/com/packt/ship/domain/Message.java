package com.packt.ship.domain;

public class Message {
	private Long id;
	private String user;
	private String message;
	private String date;
	private String to;
	private int roomId;
	private UserStatus status;

	public Message() {
	}

	public Message(Long id, String user, String message, String date, String to) {
		super();
		this.id = id;
		this.user = user;
		this.message = message;
		this.date = date;
		this.to = to;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUser() {
		return user;
	}

	public String getMessage() {
		return message;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}
}
