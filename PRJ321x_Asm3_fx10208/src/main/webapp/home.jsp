<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<c:choose>
					<c:when test="${empty products}">
						<h3>Không có dữ liệu</h3>
					</c:when>
					<c:otherwise>
						<div class="row row-cols-1 row-cols-md-2 row-cols-lg-5">
							<c:forEach var="product" items="${products}">
								<div class="col bg-light p-3">
									<a href='<c:url value="/ProductInfo?id=${product.id}"></c:url>'>
										<div class="card hoverable">
											<img class="w-75 mx-auto mt-3" src="${product.src}" alt="">
											<div class="card-body">
												<h6 class="card-title text-uppercase text-muted">${product.type}</h6>
												<h6 class="card-subtitle text-info">${product.name}</h6>
												<p class="card-text text-danger font-weight-bold">${product.price}</p>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>