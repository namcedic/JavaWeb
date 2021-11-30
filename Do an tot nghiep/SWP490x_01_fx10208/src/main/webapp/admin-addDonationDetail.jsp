<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="admin-header.jsp"></c:import>

<!-- PAGE CONTENT BEGINS -->

<div class="container">
	<div class="row">
		<div class="clearfix"></div>

		<div class="row">
			<c:if test="${not empty message}">
				<div class="alert alert-success">${message }</div>
			</c:if>
			<c:if test="${not empty error}">
				<div class="alert alert-danger">${error }</div>
			</c:if>
		</div>

		<form id="configform" action="DonationServlet" method="post">
			<div class="form-group" hidden>
				<label><h5>ID</h5></label>
				<div class="row">
					<div class="col-md-6">
						<input type="number" id="iddetail" class="form-control"
							name="iddetail" value="${donaDetail.iddetail }">
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>ID Người dùng</h5></label>
				<div class="row">
					<div class="col-md-6">
						<input type="number" id="iduser" class="form-control"
							name="iduser" value="${donaDetail.user.iduser }" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>ID Chương trình quyên góp</h5></label>
				<div class="row">
					<div class="col-md-6">
						<input type="number" id="iddonation" class="form-control"
							name="iddonation"
							value="${donaDetail.donationprogram.iddonation }" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Số tiền quyên góp (VND</h5></label>
				<div class="row">
					<div class="col-md-6">
						<input type="number" id="moneydonate" class="form-control"
							name="moneydonate" value="${donaDetail.moneydonate }" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Trạng thái chuyển tiền</h5></label>
				<div class="row">
					<div class="col-md-6">
						<select class="form-select col-sm-12"
							aria-label="Default select example" id="status"
							name="status" value="${donaDetail.status}">
							<option value="Chưa chuyển tiền"
								<c:if test="${donaDetail.status == 'Chưa chuyển tiền'}">selected="selected"</c:if>>Chưa
								chuyển tiền</option>
							<option value="Đã chuyển tiền"
								<c:if test="${donaDetail.status == 'Đã chuyển tiền'}">selected="selected"</c:if>>Đã
								chuyển tiền</option>
						</select>

					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 text-center">
					<button
						formaction="${pageContext.request.contextPath}/DonationDetail/update"
						class="btn btn-success">Cập nhật</button>

					<button
						formaction="${pageContext.request.contextPath}/DonationDetailServlet"
						class="btn btn-danger">Hủy</button>
				</div>
			</div>
		</form>

	</div>
</div>

<!-- PAGE CONTENT ENDS -->
</div>
<!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.page-content -->
</div>
</div>
<!-- /.main-content -->

<c:import url="admin-footer.jsp"></c:import>