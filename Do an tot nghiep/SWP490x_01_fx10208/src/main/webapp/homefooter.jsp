<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- footer_start  -->
<footer class="footer">
	<div class="footer_top">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="footer_widget">
						<div class="footer_logo">
							<a class="text-white text-decoration-none" href="#">
								<h3>Donation Fund</h3>
							</a>
						</div>
						<p class="address_text">
							Chung sức cho cộng đồng, <br> cống hiến những gì tốt đẹp,
							nhất <br> chia sẻ yêu thương
						</p>
						<div class="socail_links">
							<ul>
								<li><a href="#"> <i class="fab fa-facebook-square"></i>
								</a></li>
								<li><a href="#"> <i class="fab fa-twitter"></i>
								</a></li>
								<li><a href="#"> <i class="fab fa-youtube"></i>
								</a></li>
								<li><a href="#"> <i class="fab fa-instagram"></i>
								</a></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="footer_widget">
						<h3 class="footer_title">Liên hệ</h3>
						<div class="contacts">
							<p>
								68 Phố Huế, Hai Bà Trưng, Hà Nội <br> +2(305) 587-3407 <br>
								donationfundpro@gmail.com

							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<div class="footer_widget">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3777528285577!2d105.84929031476308!3d21.017565986004385!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab8d47441381%3A0xc9291ad1e6297a44!2zNjggUGjhu5EgSHXhur8sIELDuWkgVGjhu4sgWHXDom4sIEhhaSBCw6AgVHLGsG5nLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1636638660915!5m2!1svi!2s"
							width="600" height="250" style="border: 0;" allowfullscreen=""
							loading="lazy"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copy-right_text">
		<div class="container">
			<div class="row">
				<div class="bordered_1px "></div>
				<div class="col-xl-12 text-center">
					<p class="copy_right text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Bản quyền thuộc về &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						Donation Fund
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- footer_end  -->


<!-- JS here -->
<script
	src="${pageContext.request.contextPath}/assets/js1/vendor/modernizr-3.5.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/vendor/jquery-1.12.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js1/ajax-form.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/jquery.counterup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js1/scrollIt.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/jquery.scrollUp.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js1/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/nice-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/jquery.slicknav.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js1/plugins.js"></script>
<script src="${pageContext.request.contextPath}/assets/js1/gijgo.min.js"></script>
<!--contact js-->
<%-- <script src="${pageContext.request.contextPath}/assets/js1/contact.js"></script>
<script --%>
	src="${pageContext.request.contextPath}/assets/js1/jquery.ajaxchimp.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/jquery.form.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js1/mail-script.js"></script>

<script src="${pageContext.request.contextPath}/assets/js1/main.js"></script>


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
	

	$(document).delegate('.ui-page', 'pageshow', function () {
	     var offset = $(this).find('#logindiv').offset().top;
	     setTimeout(function () {
	        $.mobile.silentScroll(offset);
	        }, 0);
	     });
	
	document.getElementById("userautoscroll").scrollIntoView(false);

	
</script>
</body>
</html>