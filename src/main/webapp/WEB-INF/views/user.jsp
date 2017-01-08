<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div class="row">
	<div class="col-md-5">
		<h3>${user.username}</h3>
		<c:forEach items="${user.userRole}" var="roles">
			<p>
				${roles.role}
			</p>
		</c:forEach>
		<security:authorize access="hasRole('ROLE_ADMIN')">			
			<p>
				<a href="<spring:url value="/users" />" class="btn btndefault">
					<span class="glyphicon-hand-left glyphicon"></span> 
					<spring:message code="user.return"/>
				</a>
			</p>
		</security:authorize>	
		<security:authorize access="hasRole('ROLE_CUSTOMER')">			
			<p>
				<a href="<spring:url value="/profile" />" class="btn btndefault">
					<span class="glyphicon-hand-left glyphicon"></span> 
					<spring:message code="user.return"/>
				</a>
			</p>
		</security:authorize>	
	</div>
</div>

<script>
	$(document).ready(function(){
	    $("#profile").addClass('active');
	    $("#info").addClass('active');
	});
</script>
