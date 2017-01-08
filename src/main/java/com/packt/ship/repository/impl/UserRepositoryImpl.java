package com.packt.ship.repository.impl;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.packt.ship.domain.User;
import com.packt.ship.domain.UserStatus;
import com.packt.ship.repository.UserRepository;

@Repository
public class UserRepositoryImpl implements UserRepository{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private static final Logger log = LoggerFactory.getLogger(UserRepositoryImpl.class);
	
	@Override
	public User login(User login) {
		User user = getUser(login);
		if(user != null){
			user.setLogin(true);
			updateUser(user);
		}
		return user;
	}

	@Override
	public boolean register(User register) {
		Session session = null;
		try{
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(register); 
			session.getTransaction().commit();
			return true;
		} catch (Exception e){
			session.getTransaction().rollback();
			log.error("Error when save user ",e);
		} finally {
			session.close();
		}
		return false;
	}
	
	@Override
	public boolean logout(User logout) {
		User user = getUser(logout);
		if(user != null){
			user.setLogin(false);
			updateUser(user);
			return true;
		}
		return false;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public User getUser(User userToFind){
		User user = null;
		Session session = sessionFactory.openSession();
		@SuppressWarnings("deprecation")
		Criteria cr = session.createCriteria(User.class);
		List<User> listOfUser = new ArrayList<>(0);
		if(userToFind.getUserName() != null && userToFind.getPassword() != null){ //logowanie
			cr.add(Restrictions.eq("name", userToFind.getUserName()));
			cr.add(Restrictions.eq("password", userToFind.getPassword()));		
		} else if(userToFind.getId_u() != null && userToFind.getUserName() != null){
			cr.add(Restrictions.eq("name", userToFind.getUserName()));
			cr.add(Restrictions.eq("id_u", userToFind.getId_u()));		
		} else if(userToFind.getEmail() != null){
			cr.add(Restrictions.eq("email", userToFind.getEmail()));
		}
		listOfUser = cr.list();
		if(!listOfUser.isEmpty())
			user = listOfUser.get(0);
		session.close();
		return user;
	}
	
	@Override
	public boolean updateUser(User test){
		User user = new User();
		user.setId_u(test.getId_u());
		user.setUserName(test.getUserName());
		user.setPassword(test.getPassword());
		user.setEmail(test.getEmail());			
		user.setLogin(test.getLogin());
		Session session = null;
		try{			
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(user); 
			session.getTransaction().commit();
			session.close();
			return true;
		}catch(Exception e){
			session.getTransaction().rollback();
			log.error("Error when update user", e);
		} finally {
			session.close();
		}
		return false;
	}
	
	@Override
	public boolean validToken(User userToken) {
		User user = getUser(userToken);
		if(user != null){
			updateUser(user);
			return true;
		} else {
			user.setLogin(false);
			updateUser(user);
			return false;
		}
	}

	@Override
	public boolean restartPassword(User user) {
		user.setPassword(RandomStringUtils.random(10));
		if(updateUser(user))
			return true;
		else
			return false;
	}

	@Override
	public User getUserByName(String name) {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("deprecation")
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("name", name));
		List<User> listOfUser = new ArrayList<>(0);
		listOfUser = cr.list();
		if(listOfUser.size() == 0){
			return null;
		} else {
			return listOfUser.get(0);
		}
	}

	@Override
	public List<User> getFreeUsers() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("deprecation")
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("status", UserStatus.FREE));
		List<User> listOfUser = new ArrayList<>(0);
		listOfUser = cr.list();
		return listOfUser;
	}
}
