package com.packt.ship.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.packt.ship.domain.Role;
import com.packt.ship.domain.User;
import com.packt.ship.domain.UserStatus;
import com.packt.ship.service.MailService;
import com.packt.ship.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private MailService mailService;

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(@ModelAttribute("newUser") User newUser, Model model, HttpServletRequest request) {
		model.addAttribute("user", new User());
		model.addAttribute("session", request.getRemoteUser());
		return "register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("newUser") User register, HttpServletRequest request, Model model) {
		Map<String, Object> mapForReponse = new HashMap<>();
		if (register.getUserName() == null) {
			mapForReponse.put("success", false);
			mapForReponse.put("error", "empty name");
		} else if (register.getPassword() == null) {
			mapForReponse.put("success", false);
			mapForReponse.put("error", "empty password");
		} else if (register.getEmail() == null) {
			mapForReponse.put("success", false);
			mapForReponse.put("error", "empty email");
		} else {
			register.setLogin(false);
			register.setStatus(UserStatus.FREE);
			Set<Role> userRole = new HashSet<>();
			Role role = new Role();
			role.setName("USER");
			role.setId_r(1);
			userRole.add(role);
			register.setUserRoles(userRole);
			boolean success = userService.register(register);
			if (success) {
				mapForReponse.put("success", success);
				Runnable task = () -> {
					mailService.registration(register.getEmail(), register.getUserName());
				};
				Thread thread = new Thread(task);
				thread.start();
			} else {
				mapForReponse.put("success", success);
				mapForReponse.put("error", "user exist");
			}
		}
		model.addAllAttributes(mapForReponse);
		return "register";
	}

	@RequestMapping(value = "logout", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> logout(@RequestBody User logout) {
		Map<String, Object> mapForReponse = new HashMap<>();
		if (logout.getUserName() != null)
			mapForReponse.put("success", userService.logout(logout));
		else
			mapForReponse.put("success", false);

		return new ResponseEntity<Map<String, Object>>(mapForReponse, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> getUser(@RequestBody User user) {
		Map<String, Object> mapForReponse = new HashMap<>();
		User user1 = userService.getUser(user);
		if (user1 != null && user1.getLogin() && userService.validToken(user1)) {
			mapForReponse.put("success", true);
			user1.setPassword(null);
			mapForReponse.put("user", user1);
			mapForReponse.put("access", true);
		} else {
			mapForReponse.put("success", true);
			mapForReponse.put("access", false);
		}

		return new ResponseEntity<Map<String, Object>>(mapForReponse, HttpStatus.OK);
	}

	@RequestMapping(value = "update", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> updateUser(@RequestBody User update) {
		Map<String, Object> mapForReponse = new HashMap<>();
		if (update != null && update.getUserName() == null) {
			mapForReponse.put("success", false);
			mapForReponse.put("error", "empty name");
		} else {
			User user = new User();
			user = userService.getUser(user);
			boolean token = userService.validToken(user);
			if (user != null && token) {
				boolean updateUser = true;
				if (update.getNewPassword() != null && update.getOldPassword().equals(user.getPassword()))
					update.setPassword(update.getNewPassword());
				else
					updateUser = false;
				if (update.getNewPassword() == null)
					update.setPassword(user.getPassword());
				if (update.getEmail() == null)
					update.setEmail(user.getEmail());
				update.setId_u(user.getId_u());
				update.setLogin(user.getLogin());
				boolean success = false;
				if (updateUser)
					success = userService.updateUser(update);

				if (success)
					mapForReponse.put("success", success);
				else {
					mapForReponse.put("access", true);
					mapForReponse.put("success", success);
					if (updateUser)
						mapForReponse.put("error", "not save");
					else
						mapForReponse.put("error", "wrong old password");
				}
			} else {
				if (!token) {
					mapForReponse.put("success", false);
					mapForReponse.put("access", false);
					mapForReponse.put("error", "token expired");
				} else {
					mapForReponse.put("success", true);
					mapForReponse.put("access", false);
					mapForReponse.put("error", "user not exist");
				}
			}
		}

		return new ResponseEntity<Map<String, Object>>(mapForReponse, HttpStatus.OK);
	}

	@RequestMapping(value = "password", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> restartPassword(@RequestBody User password) {
		Map<String, Object> mapForReponse = new HashMap<>();
		if (password != null && password.getEmail() != null) {
			mapForReponse.put("access", true);
			User user = userService.getUser(password);
			if (user != null && userService.restartPassword(user)) {
				Runnable task = () -> {
					mailService.restartPassword(user);
				};
				Thread thread = new Thread(task);
				thread.start();
				mapForReponse.put("success", true);
			} else {
				mapForReponse.put("success", false);
				mapForReponse.put("error", "email not exist");
			}
		} else {
			mapForReponse.put("access", false);
			mapForReponse.put("success", false);
			mapForReponse.put("error", "empty emial");
		}

		return new ResponseEntity<Map<String, Object>>(mapForReponse, HttpStatus.OK);
	}
}
