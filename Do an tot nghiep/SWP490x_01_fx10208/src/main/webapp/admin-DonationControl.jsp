<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="admin-header.jsp"></c:import>

<!-- PAGE CONTENT BEGINS -->

<div class="row">
	<div class="col-xs-12">
		<div class="clearfix"></div>

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
		<form id=""
			action="${pageContext.request.contextPath}/DonationServlet/delete"
			method="post">
			<table id="example"
				class="table table-responsive-sm table-hover table-striped table-bordered table-hover"
				style="width: 100%">
				<thead>
					<tr>
						<th class="center"><label class="pos-rel"> <input
								id="checkAll" type="checkbox" value="${item.iddonation }"
								class="ace" /> <span class="lbl"></span>
						</label></th>
						<!-- name="idcheck" -->
						<th>ID</th>
						<th>Tên chương trình</th>
						<th hidden>Tóm tắt</th>
						<th hidden>Ảnh</th>
						<th hidden>Nội dung</th>
						<th
							class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">Ngày
							bắt đầu</th>
						<th
							class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">Ngày
							kết thúc</th>
						<th
							class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">Trạng
							thái</th>
						<td>
							<button type="button" class="btn-success text-dark">
								<a
									href="${pageContext.request.contextPath}/admin-addDonation.jsp"
									class="text-white ">Thêm</a>
							</button>
							<button class="btn-danger text-white" type="submit"
								onclick="return confirm('Bạn chắc chắn muốn xóa không?'); ">Xóa

							</button>
						</td>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${donationprograms }">
						<tr>
							<th class="center"><label class="pos-rel"> <input
									type="checkbox" value="${item.iddonation}" name="idcheck"
									class="ace" /> <span class="lbl"></span>
							</label></th>
							<td>${item.iddonation }</td>
							<td>${item.title}</td>
							<td hidden>${item.description }</td>
							<td hidden>${item.image }</td>
							<td hidden>${item.detail }</td>
							<td
								class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">${item.createdate }</td>
							<td
								class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">${item.finishdate }</td>
							<td
								class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">${item.status }</td>
							<td><button type="button" class=" btn-white">
									<a
										href="${pageContext.request.contextPath}/DonationServlet/edit?DoProgramId=${item.iddonation}"
										class="text-dark"><i class="fa fa-pencil"
										aria-hidden="true"></i></a>
								</button></td>

						</tr>

					</c:forEach>


				</tbody>

			</table>
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

<script type="text/javascript">
	var checkbox = $('table tbody input[type=checkbox]');
	$('#checkAll').click(function(event) {
		checkbox.each(function() {
			this.checked = false;
		});
		if (this.checked) {
			checkbox.each(function() {
				this.checked = true;
				var a = checkbox.val();
				console.log(a);
			});
		} else {
			checkbox.each(function() {
				this.checked = false;
			});
		}
		checkbox.click(function() {
			if (this.checked) {
				$('#checkAll').prop("checked", false);
			}
		});
	})
</script>