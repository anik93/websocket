<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<spring:message code="address.street"/>
${userData.street}
<br>
<spring:message code="address.country"/>	
${userData.country}
<br>

<security:authorize access="hasRole('ROLE_ADMIN')">
	<p>
		<a href="<spring:url value="/products/add" />" class="btn btndefault">
			<span class="glyphicon-hand-right glyphicon"></span> 
			<spring:message code="profile.add"/> 
		</a>
	</p>
</security:authorize>
<security:authorize access="hasRole('ROLE_ADMIN')">				
	<p>
		<a href="<spring:url value="/users" />" class="btn btndefault">
			<span class="glyphicon-hand-right glyphicon"></span> 
			<spring:message code="profile.users"/> 
		</a>
	</p>
</security:authorize>	
<security:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_CUSTOMER')">						
	<p>
		<a href="<spring:url value="/users/add" />" class="btn btndefault">
			<span class="glyphicon-hand-right glyphicon"></span>
			<spring:message code="profile.add.user"/> 
		</a>
	</p>
</security:authorize>	
<script>
$(document).ready(function(){
    $("#profile").addClass('active');
    $("#infoprofile").addClass('active');
});
</script>
