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

	<div class="container" align="left">
		<div class="row" align="left">
			<div class="col-md-8" align="left">
				<tiles:insertAttribute name="content" />
			</div>
			<c:if test="${not empty session}">
				<div class="col-md-4">
					<tiles:insertAttribute name="chat" />
				</div>
			</c:if>
		</div>
	</div>

	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>

	<c:if test="${not empty session}">
		<script th:inline="javascript">
			var sock = new SockJS('http://localhost:8080/cookbook/inviteGame');
			var stomp = Stomp.over(sock);

			stomp.connect('guest', 'guest', function(frame) {
				console.log('*****  Nawiązano połączenie  *****');
				stomp.subscribe("/user/queue/inviteGame", handleNotification);
			});

			function handleNotification(message) {
				console.log('Powiadomienie: ', message);
				$('#output').append(
						"<b>" + JSON.parse(message.body).user + "</b>("
								+ JSON.parse(message.body).date + "):"
								+ JSON.parse(message.body).message + "<br/>")
				$('#myModal').modal('show');
			}
		</script>
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Invite</h4>
					</div>
					<div class="modal-body">
						<p id="output" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Join</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>
