<%@page import="controller.page.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<main class="container-fluid">
		<div class="row login-modal my-5">
			<div class="offset-md-4 col-md-4 login-box">
				<div class="row h-100 align-items-center">
					<div class="col-md-12 text-center py-3">
						<h3>Sign in</h3>
						<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
						</c:if>
						<form action="${pageContext.request.contextPath}/Login" method="POST">
							<input type="hidden" name="action" value="dologin">	
							<input class="form-control mb-2" type="email" name="username" value="<%= CookieUtils.get("loginMail", request) %>">
							<input class="form-control mb-2" type="password" name="password">
							<div class="form-check form-check-inline justify-content-start">
								<input type="checkbox" checked class="form-check-input" name="remember">
								<label class="form-check-label">Remember me</label>
							</div>
							<p><a href="">Forgot your password?</a></p>
							<input type="submit" class="btn btn-danger rounded-pill my-2 px-4" value="login">

						</form>
					</div>
				
				</div>
			</div>
		</div>
	</main>
