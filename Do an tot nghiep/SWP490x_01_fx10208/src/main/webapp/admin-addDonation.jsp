
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
				<label><h5>ID CHương trình</h5></label>
				<div class="row">
					<div class="col-12">
						<input type="number" id="iddonation" class="form-control"
							name="iddonation" value="${donaPro.iddonation }">
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Tên chương trình</h5></label>
				<div class="row">
					<div class="col-12">
						<input type="text" id="title" class="form-control" name="title"
							value="${donaPro.title }" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Tóm tắt</h5></label>
				<div class="row">
					<div class="col-12">
						<input type="text" id="description" class="form-control"
							name="description" value="${donaPro.description }" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Ảnh</h5></label>
				<div class="row">
					<div class="col-12">
						<input type="text" id="image" class="form-control" name="image"
							value="${donaPro.image }">
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Nội dung</h5></label>
				<div class="row">
					<div class="col-12">
						<textarea id="editor1" name="detail" class="form-control" required>${donaPro.detail }</textarea>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Ngày bắt đầu</h5></label>
				<div class="row">
					<div class="col-12">
						<input type="date" class="form-control" id="createdate"
							name="createdate" value="${donaPro.createdate }" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Ngày kết thúc</h5></label>
				<div class="row">
					<div class="col-12">
						<input type="date" class="form-control" id="finishdate"
							name="finishdate" value="${donaPro.finishdate }" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Trạng thái</h5></label>
				<div class="row">
					<div class="col-12">
						<select class="form-select form-control"
							aria-label="Default select example" id="status" name="status"
							value="${donaPro.status}">
							<option value="Kết thúc"
								<c:if test="${donaPro.status == 'Kết thúc'}">selected="selected"</c:if>>Kết
								thúc</option>
							<option value="Đang diễn ra"
								<c:if test="${donaPro.status == 'Đang diễn ra'}">selected="selected"</c:if>>Đang
								diễn ra</option>
						</select>
					</div>
				</div>
			</div>
	</div>

	<div class="row">
		<div class="col-12 text-center">
			<button
				formaction="${pageContext.request.contextPath}/DonationServlet/update"
				class="btn btn-success">Cập nhật</button>
			<button
				formaction="${pageContext.request.contextPath}/DonationServlet/create"
				class="btn btn-primary">Thêm</button>
			<button
				formaction="${pageContext.request.contextPath}/DonationServlet"
				class="btn btn-danger">Hủy</button>
			<button
				formaction="${pageContext.request.contextPath}/DonationServlet/reset"
				class="btn btn-infor reset" id="configreset">Đặt lại</button>
		</div>
	</div>

	<!-- type="button"
												class="btn btn-infor reset" id="configreset" onclick="myFunctionreset()" -->
	<!-- formaction="${pageContext.request.contextPath}/DonationServlet/reset" -->
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