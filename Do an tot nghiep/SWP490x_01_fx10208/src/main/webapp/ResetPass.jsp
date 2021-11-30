<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="homeheader.jsp"></c:import>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5" id="userautoscroll">
						<h3
							class="card-title text-center mb-5 fw-bold fw-upper fs-5 font-weight-bold ">QUÊN
							MẬT KHẨU</h3>
						<c:if test="${not empty message}">
							<div class="form-floating">
								<i class="alert alert-success">${message}</i>
							</div>
						</c:if>
						<c:if test="${not empty error}">
							<div class="form-floating">
								<i class="alert alert-danger">${error}</i>
								<!-- Doc loi tu request ra, bien error  -->
							</div>
						</c:if>
						<form action="ForgotPassword" method="post">
							<div class="m-2">
								<div class="form-group mb-3">
									<label for="email" class=""><h5>Email</h5></label>
									<input type="email" class="form-control col-sm-12 " id="email"
										name="email" placeholder="Nhập email của bạn">
								</div>
								<div class="d-grid mx-auto my-2">
									<button
										class="btn btn-success btn-login text-uppercase fw-bold form-control"
										type="submit">Nhận mật khẩu mới</button>
								</div>
							</div>
							<br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="homefooter.jsp"></c:import>