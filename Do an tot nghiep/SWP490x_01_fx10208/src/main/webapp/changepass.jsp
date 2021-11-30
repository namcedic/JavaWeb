<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="homeheader.jsp"></c:import>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-bold fw-upper fs-5 font-weight-bold ">THAY ĐỔI MẬT KHẨU</h5>
						<c:if test="${not empty message}">
							<div class="form-floating">
								<i class="alert alert-success">${message}</i>
							</div>
						</c:if>
						<c:if test="${not empty error}">
							<div class="form-floating">
								<i class="alert alert-success">${error}</i>
							</div>
						</c:if>
						<form action="ResetPassword" method="post" id="userautoscroll">

							<div class="form-group mb-3">
								<label for="oldpass"></label> <input type="oldpass"
									class="form-control" id="oldpass" name="oldpass"
									placeholder="Nhập mật khẩu">
							</div>
							
							<div class="form-group mb-3">
								<label for="newpass"></label> <input type="newpass"
									class="form-control" id="newpass" name="newpass"
									placeholder="Nhập mật khẩu mới">
							</div>
							
							<div class="form-group mb-3">
								<label for="renewpass"></label> <input type="renewpass"
									class="form-control" id="renewpass" name="renewpass"
									placeholder="Nhập lại mật khẩu mới">
							</div>
														
							<div class="d-grid text-center">
								<button class="btn btn-success btn-login fw-bold"
									type="submit">Thay đổi</button>
							</div>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<c:import url="homefooter.jsp"></c:import>