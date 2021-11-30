<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="homeheader.jsp"></c:import>

<body>
	<section class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center" id="userautoscroll">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Trang
										Đăng kí</p>

									<c:if test="${not empty message}">
										<div class="alert alert-success">${message }</div>
									</c:if>
									
									<form class="mx-auto" action="Register" method="post">

										<div class="align-items-center mb-4" hidden>
											<h5 class="col-sm-12">ID người dùng</h5>
											<input type="text" class="col-sm-12" id="iduser"
												name="iduser">
										</div>

										<div class="align-items-center mb-4">

											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example1c">Tên
													người dùng</label> <input type="text" id="form3Example1c"
													class="form-control" name="username" required />

											</div>
										</div>

										<div class="align-items-center mb-4">

											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example1c">Họ và
													tên</label> <input type="text" id="form3Example1c"
													class="form-control" name="fullname" required />
											</div>
										</div>

										<div class="align-items-center mb-4">

											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example3c">Email</label>
												<input type="email" id="form3Example3c" class="form-control"
													name="email" required />

											</div>
										</div>

										<div class=" align-items-center mb-4">

											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example1c">Số
													điện thoại</label> <input type="number" id="form3Example1c"
													class="form-control" name="phonenumber" required />
											</div>
										</div>

										<div class="align-items-center mb-4 pl-4">
												<input class="form-check-input me-2" type="checkbox"
													value="" id="form2Example3c" /> <label
													class="form-check-label" for="form2Example3"> Tôi
													đồng ý với điều khoản dịch và dịch vụ <a href="#!">Điều
														khoản và dịch vụ</a>
												</label>
										
										</div>

										<div class="text-center">
											<button class="btn btn-success btn-lg">Đăng kí</button>
										</div>

									</form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-registration/draw1.png"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="homefooter.jsp"></c:import>