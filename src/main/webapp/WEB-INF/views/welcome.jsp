<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<h1>Welcome</h1>

<c:if test="${not empty session}">
	<a href=" <spring:url value="/rooms/createPrivate" />"
		class="btn btn-success"> <i class="fa fa-cart-plus"></i> Stwórz nowy pokój Prywatny
	</a>
	
	<a href=" <spring:url value="/rooms/createPublic" />"
		class="btn btn-success"> <i class="fa fa-cart-plus"></i> Stwórz nowy pokój Publiczny
	</a>
</c:if>