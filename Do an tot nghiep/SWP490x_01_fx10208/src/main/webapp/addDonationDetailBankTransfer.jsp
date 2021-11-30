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

		<div class="row">
			<div class="col">

				<c:if test="${not empty message}">
					<div class="alert alert-success">${message }</div>
				</c:if>
				<c:if test="${not empty error}">
					<div class="alert alert-danger">${error }</div>
				</c:if>
			</div>

		</div>

		<div class="row" id="userautoscroll">
			<h5 class="ml-4 text-bold pl-3">Xin chào ${user.fullname }, cám
				ơn bạn đã quyên góp ủng hộ</h5>
		</div>
		<div class="row donation-list m-2" >
			<div class="col-12 col-lg-7 order-2 order-lg-1 donation-list-col">
				<div class=" row my-2">
					<h5 class="col-sm-12">Để hoàn thành việc quyên góp bạn chuyển
						khoản đến tài khoản với nội dung sau</h5>
				</div>

				<div class=" row my-2 mt-5">
					<h5 class="col-sm-12">Thông tin chuyển khoản</h5>
					<h5 class="col-sm-12">Tên tài khoản: Quỹ từ thiện Donation
						Fund</h5>
					<h5 class="col-sm-12">Ngân hàng: Chi nhánh Standard Chartered
						Bank Hà Nội</h5>
					<h5 class="col-sm-12">Số tài khoản: 010.200.368.9558</h5>
					<h5 class="col-sm-12">
						Nội dung: ${donaDetail.donationprogram.iddonation }_${donaDetail.user.iduser }_
						<fmt:formatNumber value="${donaDetail.moneydonate }" type="number" />
					</h5>
				</div>


				
					<c:if test="${not empty user.username }">
						<button class="btn btn-success" type="button">
							<a class="text-white  text-decoration-none"
								href="${pageContext.request.contextPath}/addDonationDetail.jsp">Tiếp
								tục quyên góp</a>
						</button>
					</c:if>
	
		
			</div>

			<div
				class="col-12 col-lg-5 order-1 order-lg-2 sticky-sidebar text-center"
				style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">
				<div class="theiaStickySidebar"
					style="padding-top: 0px; padding-bottom: 1px; position: static; transform: none;">
					<div class="quyengop-sticky">

						<div class="pb-3 d-none d-lg-block">
							<div class="pb-3 d-none d-lg-block">
								<h4 class="mt-5 mb-3">Chương trình đang diễn ra</h4>
								<div class="mb-3">
									<div class="campaign-dn">
										<a
											href="/cong-dong/chung-tay-xay-quy-hoc-bong-duong-den-tri-thuc-tang-tre-em-tai-4-mai-am"
											class="link-absolute"></a>
										<div class="campaign-dn-img">
											<img
												src="https://static.mservice.io/blogscontents/momo-upload-api-210615102425-637593494651930803.jpg"
												alt="Chung tay xây Quỹ Học Bổng “Đường Đến Tri Thức” tặng trẻ em tại 4 mái ấm"
												loading="lazy" class="img-fluid">
										</div>
										<div class="campaign-dn-body">
											<h5 class="campaign-dn-title">Chung tay xây Quỹ Học Bổng
												“Đường Đến Tri Thức” tặng trẻ em tại 4 mái ấm</h5>
											<p class="campaign-dn-summary">Cùng chung tay đóng góp
												cho Quỹ học bổng để giúp các em ở 4 mái ấm: Ánh Sáng, Thảo
												Đàn, Diệu Giác, Bình Lợi có thêm điều kiện học tập vững
												chắc, môi trường phát triển bản thân tốt hơn. Trẻ em là măng
												non của đất nước, hãy hành động ngay hôm nay</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="resize-sensor"
						style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
						<div class="resize-sensor-expand"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
							<div
								style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 485px; height: 2661px;"></div>
						</div>
						<div class="resize-sensor-shrink"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
							<div
								style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Các chương trình đang diễn ra -->

		<section class="bg-white" id="chuongtrinhkhac">
			<div class="container">

				<div class="row align-items-center">
					<div class="col-12 col-md pb-2">
						<h2 class="h4">Các chương trình quyên góp khác</h2>
					</div>
				</div>
				<div class="row sm-gutters">
					<div class="col-12 col-md-6 col-lg-4 mb-3 d-lg-none">
						<div class="campaign-dn">
							<a
								href="/cong-dong/chung-tay-xay-quy-hoc-bong-duong-den-tri-thuc-tang-tre-em-tai-4-mai-am"
								class="link-absolute"></a>
							<div class="campaign-dn-img">
								<img
									src="https://static.mservice.io/blogscontents/momo-upload-api-210615102425-637593494651930803.jpg"
									alt="Chung tay xây Quỹ Học Bổng “Đường Đến Tri Thức” tặng trẻ em tại 4 mái ấm"
									loading="lazy" class="img-fluid">
							</div>
							<div class="campaign-dn-body">
								<h5 class="campaign-dn-title">Chung tay xây Quỹ Học Bổng
									“Đường Đến Tri Thức” tặng trẻ em tại 4 mái ấm</h5>
								<p class="campaign-dn-summary">Cùng chung tay đóng góp cho
									Quỹ học bổng để giúp các em ở 4 mái ấm: Ánh Sáng, Thảo Đàn,
									Diệu Giác, Bình Lợi có thêm điều kiện học tập vững chắc, môi
									trường phát triển bản thân tốt hơn. Trẻ em là măng non của đất
									nước, hãy hành động ngay hôm nay</p>
							</div>
							<div class="campaign-dn-footer">
								<div class="campaign-dn-info">
									<div class="campaign-dn-money">
										<b>81.282.715đ</b> <span>quyên góp</span>
									</div>
									<div class="campaign-dn-percent">40.64%</div>
								</div>

								<div class="campaign-progress">
									<div class="campaign-progress-bar" style="width: 40.64%"></div>
								</div>

								<div class="campaign-dn-time">
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-users ico">
												<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
												<circle cx="9" cy="7" r="4"></circle>
												<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
												<path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
										<span>961 lượt quyên góp</span>
									</div>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-clock ico">
												<circle cx="12" cy="12" r="10"></circle>
												<polyline points="12 6 12 12 16 14"></polyline></svg>
										<span>Thời hạn còn 69 Ngày</span>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6 col-lg-4 mb-3">
						<div class="campaign-dn">
							<a
								href="/cong-dong/gay-quy-phau-thuat-mang-nu-cuoi-cho-20-em-ho-moi"
								class="link-absolute"></a>
							<div class="campaign-dn-img">
								<img
									src="https://static.mservice.io/blogscontents/momo-upload-api-211112141322-637723232029591031.jpg"
									alt="Gây quỹ phẫu thuật mang nụ cười cho 20 em hở môi, hàm ếch"
									loading="lazy" class="img-fluid">
							</div>
							<div class="campaign-dn-body">
								<h5 class="campaign-dn-title">Gây quỹ phẫu thuật mang nụ
									cười cho 20 em hở môi, hàm ếch</h5>
								<p class="campaign-dn-summary">Hở môi, hàm ếch là những dị
									tập bẩm sinh phổ biến nhất với trẻ em hiện nay. Chúng gây ảnh
									hưởng lớn đến sự phát triển về cả thể chất và tinh thần của
									trẻ.</p>
							</div>
							<div class="campaign-dn-footer">
								<div class="campaign-dn-info">
									<div class="campaign-dn-money">
										<b>29.926.981đ</b> <span>quyên góp</span>
									</div>
									<div class="campaign-dn-percent">14.96%</div>
								</div>

								<div class="campaign-progress">
									<div class="campaign-progress-bar" style="width: 14.96%"></div>
								</div>

								<div class="campaign-dn-time">
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-users ico">
												<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
												<circle cx="9" cy="7" r="4"></circle>
												<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
												<path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
										<span>8.206 lượt quyên góp</span>
									</div>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-clock ico">
												<circle cx="12" cy="12" r="10"></circle>
												<polyline points="12 6 12 12 16 14"></polyline></svg>
										<span>Thời hạn còn 32 Ngày</span>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6 col-lg-4 mb-3">
						<div class="campaign-dn">
							<a
								href="/cong-dong/ho-tro-chi-phi-phau-thuat-cho-tre-em-ngheo-mac-benh-tim-bam-sinh"
								class="link-absolute"></a>
							<div class="campaign-dn-img">
								<img
									src="https://static.mservice.io/blogscontents/momo-upload-api-211110164047-637721592478788573.jpg"
									alt="Chung tay gây quỹ hỗ trợ chi phí phẫu thuật cho 8 trẻ em nghèo mắc bệnh tim bẩm sinh"
									loading="lazy" class="img-fluid">
							</div>
							<div class="campaign-dn-body">
								<h5 class="campaign-dn-title">Chung tay gây quỹ hỗ trợ
									chi phí phẫu thuật cho 8 trẻ em nghèo mắc bệnh tim bẩm
									sinh</h5>
								<p class="campaign-dn-summary">Cùng chung tay gây quỹ hỗ
									trợ chi phí phẫu thuật cho trẻ em nghèo mắc bệnh tim
									bẩm sinh để các em có cuộc sống khỏe mạnh.</p>
							</div>
							<div class="campaign-dn-footer">
								<div class="campaign-dn-info">
									<div class="campaign-dn-money">
										<b>77.542.425đ</b> <span>quyên góp</span>
									</div>
									<div class="campaign-dn-percent">34.62%</div>
								</div>

								<div class="campaign-progress">
									<div class="campaign-progress-bar" style="width: 34.62%"></div>
								</div>

								<div class="campaign-dn-time">
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-users ico">
												<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
												<circle cx="9" cy="7" r="4"></circle>
												<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
												<path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
										<span>23.344 lượt quyên góp</span>
									</div>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-clock ico">
												<circle cx="12" cy="12" r="10"></circle>
												<polyline points="12 6 12 12 16 14"></polyline></svg>
										<span>Thời hạn còn 31 Ngày</span>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6 col-lg-4 mb-3">
						<div class="campaign-dn">
							<a
								href="/cong-dong/trao-tang-dia-com-tu-thien-lon-nhat-viet-nam-cho"
								class="link-absolute"></a>
							<div class="campaign-dn-img">
								<img
									src="https://static.mservice.io/blogscontents/momo-upload-api-211109222915-637720937556782138.jpg"
									alt="Trao tặng “Đĩa cơm từ thiện lớn nhất Việt Nam” cho 1.500 người già và trẻ em"
									loading="lazy" class="img-fluid">
							</div>
							<div class="campaign-dn-body">
								<h5 class="campaign-dn-title">Trao tặng “Đĩa cơm từ thiện
									lớn nhất Việt Nam” cho 1.500 người già và trẻ em</h5>
								<p class="campaign-dn-summary">Cùng chung tay đóng góp tạo
									nên “đĩa cơm từ thiện lớn nhất Việt Nam” chúc mừng sinh nhật 1
									tuổi chương trình “Thêm một bữa no, thêm một nụ cười” do Trăng
									Khuyết hỗ trợ.</p>
							</div>
							<div class="campaign-dn-footer">
								<div class="campaign-dn-info">
									<div class="campaign-dn-money">
										<b>2.334.977đ</b> <span>quyên góp</span>
									</div>
									<div class="campaign-dn-percent">4.67%</div>
								</div>

								<div class="campaign-progress">
									<div class="campaign-progress-bar" style="width: 4.67%"></div>
								</div>

								<div class="campaign-dn-time">
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-users ico">
												<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
												<circle cx="9" cy="7" r="4"></circle>
												<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
												<path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
										<span>112 lượt quyên góp</span>
									</div>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-clock ico">
												<circle cx="12" cy="12" r="10"></circle>
												<polyline points="12 6 12 12 16 14"></polyline></svg>
										<span>Thời hạn còn 29 Ngày</span>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

</div>

<!-- reson_area_end  -->

<c:import url="homefooter.jsp"></c:import>