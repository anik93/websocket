package com.packt.ship.repository;

import java.util.List;

import com.packt.ship.domain.User;

public interface UserRepository {
	User login(User login);

	boolean register(User register);

	boolean logout(User logout);

	User getUser(User userToFind);

	boolean updateUser(User test);

	boolean validToken(User userToken);

	boolean restartPassword(User user);

	User getUserByName(String name);

	List<User> getFreeUsers();
}
