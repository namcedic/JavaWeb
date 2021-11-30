<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Donation fund</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/gijgo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/slicknav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css1/style.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">



<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->


	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-xl-3 col-lg-3">
							<div class="logo">
								<a class="text-white font-weigth-bold hover"
									href="${pageContext.request.contextPath}/index.jsp">
									<h3 class="text-white">Donation Fund</h3>
								</a>
							</div>
						</div>
						<div class="col-xl-9 col-lg-9">
							<div class="main-menu">
								<nav>
									<ul id="navigation">
										<li><a
											href="${pageContext.request.contextPath}/index.jsp">Trang
												chủ</a></li>
										<li><a
											href="${pageContext.request.contextPath}/aboutpage.jsp">Về
												chúng tôi</a></li>
										<li>
											<form
												action="${pageContext.request.contextPath}/Donation/search"
												method="get">
												<div class="input-group">
													<input type="text" class="form-control"
														placeholder="Tìm kiếm" name="searchKey"
														value="${searchKey}">
													<div class="input-group-append">
														<button type="submit" value="&#x1f50d" class="border-0 bg-white">
															<i class="fa fa-search text-dark" aria-hidden="true"></i>
														</button>
													</div>
												</div>
											</form>
										</li>


										<c:choose>
											<c:when test="${empty user.username }">
												<li><a href="login">Đăng nhập</a></li>

												<%-- <li><a
													href="${pageContext.request.contextPath}/login.jsp">Đăng
														nhập</a></li> --%>
												<li><a
													href="${pageContext.request.contextPath}/register.jsp">Đăng
														ký</a></li>
											</c:when>
											<c:otherwise>
												<c:if test="${user.userrole==1 }">
													<li class="nav-item dropdown"><a class=""
														href="${pageContext.request.contextPath}/UserServlet">Quản lý</a></li>
												</c:if>

												<li class="nav-item dropdown"><a
													class="nav-link dropdown-toggle " data-toggle="dropdown"
													href="#" role="button" aria-haspopup="true"
													aria-expanded="false">Xin chào ${user.username }</a>
													<div class="dropdown-menu">
														<a class="dropdown-item text-dark"
															href="${pageContext.request.contextPath}/profile.jsp">Thông
															tin</a> <a class="dropdown-item text-dark"
															href="${pageContext.request.contextPath}/DonationDetail/history">Lịch
															sử quyên góp</a> <a class="dropdown-item text-dark"
															href="${pageContext.request.contextPath}/changepass.jsp">Thay
															đổi mật khẩu</a> <a class="dropdown-item text-dark"
															href="${pageContext.request.contextPath}/logout">Thoát</a>

													</div></li>
											</c:otherwise>

										</c:choose>


									</ul>
								</nav>

							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>


	<!-- header-end -->

	<!-- slider_area_start -->
	<div class="slider_area">
		<div
			class="single_slider  d-flex align-items-center slider_bg_1 overlay2">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<div class="slider_text ">
							<span>Bắt đầu từ bây giờ...</span>
							<h3>Giúp đỡ những hoàn cảnh khó khăn</h3>
							<p>Xây dựng một tương lai tốt đẹp hơn, từ những điều nhỏ bé.</p>
							<a href="${pageContext.request.contextPath}/aboutpage.jsp"
								class="boxed-btn3">Xem thêm </a> <a
								href="${pageContext.request.contextPath}/addDonationDetail.jsp"
								class="boxed-btn3">Quyên góp ngay</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider_area_end -->