<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div class="container-fluid">
	<div>
		<ul class="nav navbar-nav navbar-left">
			<li id="languageDrop" class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="fa fa-language"></i>
					<spring:message code="menu.navigate.language"/>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li id="PL">
						<a href="?language=pl">
							<spring:message code="menu.navigate.language.pl"/>
						</a>
					</li>
					<li id="EN">
						<a href="?language=en">
							<spring:message code="menu.navigate.language.en"/>
						</a>
					</li>
				</ul>
               </li>
			<li id="home" >
				<a href="<c:url value="/" />">
					<i class="fa fa-home"></i>
					<spring:message code="menu.navigate.home"/>
				</a>
			</li>
			<c:if test="${not empty session}">
				<li id="rooms">
					<a href="<c:url value="/rooms/get" />">
						<spring:message code="menu.navigate.roomsGame"/>
					</a>
				</li>
			</c:if>
			<li id="contact">
				<a href="<c:url value="/contact" />">
					<spring:message code="menu.navigate.contact"/>
				</a>
			</li>
		</ul>
		<c:if test="${empty session}">
			<ul class="nav navbar-nav navbar-right">
				<li id="register">
					<a href="<c:url value="/user/register" />">
						<i class="fa fa-user-plus"></i>
						<spring:message code="menu.navigate.register"/>
					</a>
				</li>
				<li id="login">
					<a href="<c:url value="/login" />">
						<span class="glyphicon glyphicon-log-in"></span>
						<spring:message code="menu.navigate.login"/>
					</a>
				</li>
			</ul>
		</c:if>	
		<c:if test="${not empty session}">
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li id="admin" class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<spring:message code="menu.navigate.admin"/>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li id="register">
								<a href="<c:url value="/user/register" />">
									<i class="fa fa-user-plus"></i>
									<spring:message code="menu.navigate.user.add"/>
								</a>
							</li>
							<li id="users">
								<a href="<c:url value="/users" />">
									<i class="fa fa-users"></i>
									<spring:message code="menu.navigate.users"/>
								</a>
							</li>							
						</ul>
					</li>
					<li id="logs" class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<spring:message code="menu.navigate.logs"/>
							<span class="caret"></span>
						</a>					
						<ul class="dropdown-menu">
							<li id="userlog">
								<a href="<c:url value="/logs/user" />">
									<i class="fa fa-user-secret"></i>
									<spring:message code="menu.navigate.logs.user"/>
								</a>
							</li>
						</ul>
					</li>
				</security:authorize>			
				<li id="profile" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<spring:message code="menu.navigate.profile"/>
						<span class="caret"></span>
					</a>	
					<ul class="dropdown-menu">	
						<li id="infoprofile">
							<a href="<c:url value="/profile" />" style="padding-right: 0 auto">
								<span class="glyphicon glyphicon-user"></span>
								<spring:message code="menu.navigate.profile"/>
							</a>
						</li>
						<li id="info">
							<a href="<c:url value="/users/${session}" />" style="padding-right: 0 auto">
								<span class="glyphicon glyphicon-user"></span>
								<spring:message code="menu.navigate.user.info"/>
							</a>
						</li>
						<li id="update">
							<a href="<c:url value="/users/update/${session}" />" style="padding-right: 0 auto">
								<span class="glyphicon glyphicon-user"></span>
								<spring:message code="menu.navigate.user.update"/>
							</a>
						</li>
					</ul>
				</li>
				
				<li id="logout">
					<a href="<c:url value="/logout" />" style="padding-right: 0%">
						<span class="glyphicon glyphicon-log-out"></span>
						<spring:message code="menu.navigate.logout"/>
					</a>
				</li>				
			</ul>
		</c:if>
	</div>
</div>