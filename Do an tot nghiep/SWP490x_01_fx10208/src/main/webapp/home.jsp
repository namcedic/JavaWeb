<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="homeheader.jsp"></c:import>

<!-- reson_area_start  -->
<div class="reson_area section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb-55">
					<h3>
						<span>Chiến dịch quyên góp</span>
					</h3>
				</div>
			</div>
		</div>

		<div class="row  donation-list m-5">
			<c:forEach var="item" items="${donationprograms}">
				<div class="col-12 col-sm-6 d-flex donation-list-col">
					<div class="campaign-dn w-100">
						<a
							href='${pageContext.request.contextPath}/DonationDetail/view?id=${item.iddonation}'>
							<div class="campaign-dn-img">
								<img src="${item.image}" class="img-fluid" loading="lazy" />
							</div>
							<div class="campaign-dn-body my-3">
								<h5 class="campaign-dn-title pt-3">${item.title}</h5>
								<p class="campaign-dn-summary pt-1">${item.description}</p>
								<p
									class="campaign-dn-summary pt-1 mb-3 font-weight-light font-italic">${item.status}</p>

								<button type="submit" class="btn btn-success">
									<a class="text-white text-decoration-none"
										href='${pageContext.request.contextPath}/DonationDetail/view?id=${item.iddonation}'>Chi tiết</a>
								</button>

							</div>
						</a>
					</div>
				</div>

			</c:forEach>
		</div>

	</div>
</div>
<!-- reson_area_end  -->
<c:import url="homefooter.jsp"></c:import>