package com.packt.ship.service;

import com.packt.ship.domain.User;

public interface MailService {
	void restartPassword(User user);
	void registration(String toAddress, String name);
}
