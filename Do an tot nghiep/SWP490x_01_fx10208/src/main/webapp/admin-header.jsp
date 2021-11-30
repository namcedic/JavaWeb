<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Donation Fund</title>

<meta name="description" content="Static &amp; Dynamic Tables" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/font-awesome/4.2.0/css/font-awesome.min.css" />


<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/fonts/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="" class="ace-main-stylesheet"
	id="main-ace-style" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/custom.css" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" class="ace-main-stylesheet" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script
	src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js">
	
</script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/fonts/fonts.googleapis.com.css" />

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="${pageContext.request.contextPath}/assets/js/html5shiv.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
		<![endif]-->
</head>

<body class="no-skin">
	<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand"> Donation Fund </a>
			</div>

			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">

					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <span class="user-info"> <small>Xin
									chào</small> ${user.username}
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>
						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

							<li><a href="${pageContext.request.contextPath}/profile.jsp"><i
									class="fa fa-user" aria-hidden="true"></i>Thông tin</a></li>

							<li><a
								href="${pageContext.request.contextPath}/changepass.jsp"><i
									class="fa fa-key" aria-hidden="true"></i>Đổi Mật khẩu</a></li>
							<li><a href="${pageContext.request.contextPath}/logout"><i
									class="fa fa-sign-out" aria-hidden="true"></i>Thoát</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div id="sidebar" class="sidebar                  responsive">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list">
				<li class=""><a
					href="${pageContext.request.contextPath}/DonationServlet"> <i
						class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
							Bảng điều khiển </span>
				</a> <b class="arrow"></b></li>


				<li class="active open"><a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-list"></i> <span class="menu-text">
							Quản lý chương trìn</span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class="active"><a
							href="${pageContext.request.contextPath}/DonationServlet">
								Chương trình quyên góp </a> <b class="arrow"></b></li>

						<li class=""><a
							href="${pageContext.request.contextPath}/DonationDetailServlet">Chi
								tiết quyên góp </a> <b class="arrow"></b></li>
					</ul></li>


				<li class="active open"><a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-list"></i> <span class="menu-text">
							Người dùng</span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class="active"><a
							href="${pageContext.request.contextPath}/UserServlet"> Quản
								lý </a> <b class="arrow"></b></li>
					</ul> <!-- /.nav-list -->

					<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
						<i class="ace-icon fa fa-angle-double-left"
							data-icon1="ace-icon fa fa-angle-double-left"
							data-icon2="ace-icon fa fa-angle-double-right"></i>
					</div> <script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'collapsed')
						} catch (e) {
						}
					</script>
		</div>

		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">

					</ul>
					<!-- /.breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
				</div>

				<div class="page-content">


					<div class="page-header">
						<h1>Quản lý</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">