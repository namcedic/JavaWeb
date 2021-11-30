<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="homeheader.jsp"></c:import>

<body>
	<div class="container my-5"  >
		<div class="row" id="userautoscroll">
			<div class="col-sm-12 col-md-9 mx-auto ">
				<h3
					class="py-3 text-dark card-title text-center mb-5 text-uppercase fw-bold">
					Trang Đăng nhập</h3>

				<c:if test="${not empty message}">
					<div class="my-3 form-group ">
						<i class="alert alert-success">${message}</i>
					</div>
				</c:if>
				<form action="login" method="post" >
					<div class="form-group my-2"  >
						<label for="username"><h4>Tên người dùng</h4></label> <input
							type="text" class="form-control" id="username" name="username"
							value="${username}" required placeholder="Nhập tên người dùng">
					</div>
					<div class="form-group mb-2">
						<label for="password"><h4>Mật khẩu</h4></label> <input
							type="password" class="form-control" id="password"
							name="password" value="${password}" required
							placeholder="Nhập mật khẩu">
					</div>
					<div class="form-check">
						<div class= "row ml-2">
							<input class="form-check-input" type="checkbox" id="remember"
								name="remember"> <label class="form-check-label"
								for="remember">
								<h4>Nhớ</h4>
							</label> <a class="ml-3 text-dark"
								href="${pageContext.request.contextPath}/ResetPass.jsp"><h4>Quên
									mật khẩu</h4></a>
						</div>
					</div>

					<div class="form-group">
						<button
							class="form-control  btn btn-success btn-login text-uppercase fw-bold"
							type="submit">Đăng nhập</button>
						<input type="hidden" value="login" name=action />
					</div>
				
				</form>
			</div>
		</div>
	</div>

	<c:import url="homefooter.jsp"></c:import>