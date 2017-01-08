<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="row">
	<div class="col-md-5">
		<h3>${user.username}</h3>
		<form:form  modelAttribute="updateUser" class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="quantity"><spring:message code="user.update.password"/></label>
				<div class="col-lg-10">
					<form:input id="password" path="password" type="password" class="form:input-large"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="quantity"><spring:message code="address.street"/></label>
				<div class="col-lg-10">
					<form:input id="street" path="street" class="form:input-large"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="quantity"><spring:message code="address.country"/></label>
				<div class="col-lg-10">
					<form:input id="country" path="country" class="form:input-large"/>
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="btnAdd" class="btn btn-primary" value ="<spring:message code="user.update.update"/>"/>
				</div>
			</div>
		</form:form>
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
	    $("#users").addClass('active');
	    $("#admin").addClass('active');
	    $("#profile").addClass('active');
	    $("#update").addClass('active');
	});
</script>
