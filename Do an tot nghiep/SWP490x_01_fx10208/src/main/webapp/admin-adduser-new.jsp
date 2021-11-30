
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
			<br>

		</div>

		<form class="" id="configform" action="UserServlet" method="post">
			<div class="form-group" hidden>
				<label>
					<h5>ID người dùng</h5>
				</label>
				<div class="col-md-12">
					<input type="text" class="form-control" id="iduser" name="iduser"
						value="">
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Tên người dùng</h5></label>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<input type="text" id="username" class="form-control"
							name="username" value="" required>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label><h5>Họ và tên</h5></label>
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="text" class="form-control" id="fullname"
							name="fullname" value="" required>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><h5>Email</h5></label>
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="email" class="form-control" id="email" name="email"
							value="" required>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><h5>Mật khẩu</h5></label>
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="password" class="form-control" id="password"
							name="password" value="" required>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><h5>Số điện thoại</h5></label>
				<div class="row">
					<div class="col-xs-12  col-md-6">
						<input type="number" class="form-control" id="phonenumber"
							name="phonenumber" value="" required>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><h5>UserRole</h5></label>
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<select class="form-select form-control"
							aria-label="Default select example" id="userrole" name="userrole"
							value="">
							<option value="0"
								<c:if test="${user.userrole == '0'}">selected="selected"</c:if>>user</option>
							<option value="1"
								<c:if test="${user.userrole == '1'}">selected="selected"</c:if>>admin</option>
						</select>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><h5>Trạng thái</h5></label>
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<select class="form-select form-control"
							aria-label="Default select example" id="status" name="status"
							value="">
							<option value="unactived"
								<c:if test="${user.status == 'unactived'}">selected="selected"</c:if>>unactived</option>
							<option value="actived"
								<c:if test="${user.status == 'actived'}">selected="selected"</c:if>>actived</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-6 text-center">
					<button
						formaction="${pageContext.request.contextPath}/UserServlet/update"
						class="btn btn-success">Cập nhật</button>
					<button
						formaction="${pageContext.request.contextPath}/UserServlet/create"
						class="btn btn-primary">Thêm</button>
					<button formaction="${pageContext.request.contextPath}/UserServlet"
						class="btn btn-danger">Hủy</button>
					<button type="button" class="btn btn-infor reset" id="configreset"
						onclick="myFunctionreset()" class="btn btn-danger">Đặt
						lại</button>

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