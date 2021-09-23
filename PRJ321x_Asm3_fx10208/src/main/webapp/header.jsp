<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="container-fluid bg-warning ">
	<div class="row bg-warning">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-3">
					<h3 class="text-center text-white">Mv Studio</h3>
				</div>
				<div class="col-md-9">
					<div class="search-form">
						<form action="/PRJ321x_Asm3_fx10208/index.jsp" method="post">
							<div class="input-group">

								<input type="text" class="form-control"
									placeholder="Search here" name="searchKey"
									value="${txtSearchKey }">
								<div class="input-group-append">
									<button type="submit" value="&#x1f50d"
										class="border-0 text-warning ">
										<i class="fas fa-search "></i>
									</button>
									<!-- 	<input type="submit"
											class="fa-regular fa-magnifying-glass btn btn-warning"
											value=""> -->
								</div>
							</div>
						</form>
					</div>
				</div>
				<c:if test="${not empty sessionScope.user.name}">
					<div class="col text-white text-right">Welcome,
						${sessionScope.user.name}</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row bottom-navbar mt-2 bg-warning">
		<div class="container">
			<div class="row align-items-center">
				<div class="offset-lg-3 col-6">
					<nav class="navbar navbar-expand-lg navbar-dark px-0">
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarText"
							aria-controls="navbarText" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarText">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item active"><a class="nav-link"
									href="${pageContext.request.contextPath}/index.jsp">Home <span
										class="sr-only">(current)</span></a></li>
								<li class="nav-item"><a class="nav-link text-white"
									href="${pageContext.request.contextPath}/index.jsp">Products</a>
								</li>
								<li class="nav-item"><a class="nav-link text-white"
									href="#">About Us</a></li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="col-6 col-lg-3 text-right">
					<nav class="nav justify-content-end">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-white"
							data-toggle="dropdown" href="#" role="button"
							aria-haspopup="true" aria-expanded="false">Account</a>
							<div class="dropdown-menu bg-warning">
								<c:choose>
									<c:when test="${empty sessionScope.user.name }">
										<a class="dropdown-item text-white "
											href="${pageContext.request.contextPath}/Login">Login</a>
										<a class="dropdown-item text-white"
											href="${pageContext.request.contextPath}/SignUp">Sign Up</a>
									</c:when>
									<c:otherwise>
										<a class="dropdown-item"
											href="${pageContext.request.contextPath}/Logout">Logout</a>
									</c:otherwise>
								</c:choose>
								<c:if test="${sessionScope.role eq 'isAdmin'}">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/user">Management</a>
								</c:if>
							</div></li>
						<c:set scope="session" var="cart" value="${sessionScope.cart}"></c:set>
						<li class="nav-item mt-2 text-white"><a
							href="${pageContext.request.contextPath}/CartDetail"> <i
								class="fa text-white" style="font-size: 18px">&#xf07a;</i> <span
								class='badge badge-warning' id='lblCartCount'>${cart.totalItems}</span></a>
						</li>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>
<!--  Slide -->
<div id="carouselExampleIndicators" class="carousel slide"
	data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleIndicators" data-slide-to="0"
			class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img class="d-block w-100" src="${pageContext.request.contextPath}/imagines/1slide-1.jpg" alt="First slide">
		</div>
		<div class="carousel-item">
			<img class="d-block w-100" src="${pageContext.request.contextPath}/imagines/1slide-2.jpg" alt="Second slide">
		</div>
		<div class="carousel-item">
			<img class="d-block w-100" src="${pageContext.request.contextPath}/imagines/1slide-3.jpg" alt="Third slide">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleIndicators"
		role="button" data-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
