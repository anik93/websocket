<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
	<div class="col-md-4 col-md-offset-4">
    	<div class="panel panel-default">
		  	<div class="panel-heading">
		    	<h3 class="panel-title">
		    		<spring:message code="login.login"/> 
		    	</h3>
		 	</div>
		  	<div class="panel-body">
		  		<c:if test="${not empty error}">
          			<div class="alert alert-danger">
						<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
					</div>
				</c:if>
			    <form action="<c:url value="/login"></c:url>" method="post">
	                <fieldset>
						<div class="form-group">
				    	    <input class="form-control" placeholder=<spring:message code="login.username"/> name='username' type="text">
				    	</div>
				    	<div class="form-group">
				    		<input class="form-control" placeholder=<spring:message code="login.password"/> name='password'  type="password" value="">
				    	</div>
				    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				    	<div class="form-group">
				    		<spring:message code="login.remember"/> 
				    		<input type="checkbox" name="remember-me" />
				    	</div>
				    	<input class="btn btn-lg btn-success btn-block" type="submit" value="Zaloguj się">
				    </fieldset>
			      </form>
			</div>
		</div>
	</div>
	
<script>
	$(document).ready(function(){
   		$("#login").addClass('active');
	});
</script>
