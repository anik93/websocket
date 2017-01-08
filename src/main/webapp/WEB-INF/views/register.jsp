<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form:form modelAttribute="newUser" class="form-horizontal"
	method="post">
	<fieldset>
		<legend>
			<spring:message code="addUser.form.add.legend" />
		</legend>

		<form:errors path="*" cssClass="alert alert-danger" element="div" />
		<div class="form-group">
			<label class="control-label col-lg-2 col-lg-2" for="username">
				<spring:message code="addUser.form.name.label" />
			</label>
			<div class="col-lg-10">
				<form:input id="userName" path="userName" type="text"
					class="form:input-large" />
				<form:errors path="userName" cssClass="text-danger" />
			</div>
		</div>

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<div class="form-group">
			<label class="control-label col-lg-2" for="password"> <spring:message
					code="addUser.form.password.label" />
			</label>
			<div class="col-lg-10">
				<form:input id="password" path="password" type="password"
					class="form:input-large" />
				<form:errors path="password" cssClass="text-danger" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-2" for="email"> E-mail </label>
			<div class="col-lg-10">
				<form:input id="email" path="email" type="email"
					class="form:input-large" />
				<form:errors path="email" cssClass="text-danger" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<input type="submit" id="btnAdd" class="btn btn-primary"
					value="<spring:message code="addUser.form.register"/>" />
			</div>
		</div>

	</fieldset>
</form:form>
<script>
	$(document).ready(function() {
		$("#admin").addClass('active');
		$("#register").addClass('active');
		$("#userAdd").addClass('active');
	});
</script>
