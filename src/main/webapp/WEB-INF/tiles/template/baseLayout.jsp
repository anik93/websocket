<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="titleKey">
	<tiles:insertAttribute name="title" />
</c:set>
<title><spring:message code="${titleKey}" /></title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="header">
		<nav class="navbar navbar-inverse navbar-fixed-top" data-spy="affix"
			data-offset-top="200" style="top: 0; z-index: 1000;">
			<tiles:insertAttribute name="navigation" />
		</nav>
	</div>

	<div class="jumbotron">
		<h1>
			<c:set var="titleKey">
				<tiles:insertAttribute name="heading" />
			</c:set>
			<spring:message code="${titleKey}" />
		</h1>
	</div>

	<div class="container">
		<tiles:insertAttribute name="content" />
	</div>

	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>
