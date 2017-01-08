<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<c:forEach items="${users}" var="user">
	<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
		<div class="thumbnail">
			<div class="caption">
				<h3>${user.username}</h3>							
			</div>
			<security:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">				
				<a href=" <spring:url value="/users/update/${user.username}" />" class="btn btn-success">
					<i class="fa fa-pencil"></i>
					<spring:message code="user.update"/>
				</a>
				<br>
				<a href=" <spring:url value="/users/remove/${user.username}" />" class="btn btn-danger">
					<i class="fa fa-user-times"></i>
					<spring:message code="user.remove"/>
				</a>
			</security:authorize>
			<a href=" <spring:url value="/users/${user.username}" />" class="btn btn-primary">
				<span class="glyphicon-info-sign glyphicon"/></span> 
				<spring:message code="user.info"/>
			</a>
		</div>
	</div>
</c:forEach>

<script>
	$(document).ready(function(){
	    $("#users").addClass('active');
	    $("#admin").addClass('active');
	});
</script>
