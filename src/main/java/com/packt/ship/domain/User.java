package com.packt.ship.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "USER")
public class User implements Serializable {

	private static final long serialVersionUID = -1572102918105879025L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_u;

	private String userName;

	@Length(min = 8)
	@SuppressWarnings("deprecation")
	@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
	private String password;

	@Transient 
	@SuppressWarnings("deprecation")
	@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
	private String newPassword;

	@Transient 
	@SuppressWarnings("deprecation")
	@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
	private String oldPassword;

	private String email;

	private Boolean login;

	@ManyToOne
	@JoinColumn(name = "id_r", updatable = false, insertable = false)
	private Room rooms;

	@NotNull
	@Enumerated(EnumType.STRING)
	private UserStatus status;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "USER_ROLE", joinColumns = @JoinColumn(name = "id_u"), inverseJoinColumns = @JoinColumn(name = "id_r"))
	protected Set<Role> userRoles = new HashSet<Role>();

	public User() {

	}

	public Integer getId_u() {
		return id_u;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setId_u(Integer id_u) {
		this.id_u = id_u;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public Boolean getLogin() {
		return login;
	}
	
	public Room getRooms() {
		return rooms;
	}

	public void setRooms(Room rooms) {
		this.rooms = rooms;
	}

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}

	public void setLogin(Boolean login) {
		this.login = login;
	}

	public Set<Role> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<Role> userRoles) {
		this.userRoles = userRoles;
	}

}
