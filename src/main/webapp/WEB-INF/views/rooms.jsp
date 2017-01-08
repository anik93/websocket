<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<style>
.style_featured {
	padding: 20px 0;
	text-align: center;
}

.style_featured>div>div {
	padding: 10px;
	border: 1px solid transparent;
	border-radius: 4px;
	transition: 0.5s;
}

.style_featured>div:hover>div {
	margin-top: +19px;
	border: 1px solid rgb(153, 200, 250);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 9px 9px 9px;
	background: rgba(153, 200, 250, 0.1);
	transition: 0.99s;
}
</style>
<div class="row" align="left">
	<div class="col-md-6">
		<div class="row style_featured" style="">
			<c:forEach items="${rooms}" var="entry">
				<c:forEach items="${entry.value}" var="value">
					<c:if test="${value.status == 'PRIVATE'}">
						<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
							<div class="thumbnail">
								<div class="caption">
									<h3>${value.id_r}</h3>
									<p>${value.status}</p>
									</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-6">
		<div class="row style_featured" style="">
			<c:forEach items="${rooms}" var="entry">
				<c:forEach items="${entry.value}" var="value">
					<c:if test="${value.status == 'PUBLIC'}">
						<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
							<div class="thumbnail">
								<div class="caption">
									<h3>${value.id_r}</h3>
									<p>${value.status}</p>
									<c:if test="${not empty session}">
										<a
											href=" <spring:url value="/rooms/joinPlayer/${value.id_r}" />"
											class="btn btn-success"> <i class="fa fa-cart-plus"></i>
											dołącz jako gracz
										</a>
									</c:if>
									<a
										href=" <spring:url value="/rooms/joinObservator/${value.id_r}" />"
										class="btn btn-primary"> <span
										class="glyphicon-info-sign glyphicon" /></span> dołącz jako
										obserwator
									</a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$("#products").addClass('active');
	});
</script>


<c:forEach items="${rooms}" var="entry">
    Key = ${entry.key}, 
    values = 
    <c:forEach items="${entry.value}" var="item" varStatus="loop">
        ${item.id_r} ${item.status} ${!loop.last ? ', ' : ''}
    </c:forEach>
	<br>
	<br>
</c:forEach>