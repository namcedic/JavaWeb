<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="admin-header.jsp"></c:import>


<!-- PAGE CONTENT BEGINS -->


<div class="row">
	<div class="col-xs-12">
		<div class="clearfix">
			<!-- <div class="pull-right tableTools-container"></div> -->
		</div>

		<!-- div.table-responsive -->

		<!-- div.dataTables_borderWrap -->
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

		<form
			action="${pageContext.request.contextPath}/DonationDetail/delete"
			method="post">
			<table id="example"
				class="table table-responsive-sm table-hover table-striped table-bordered table-hover"
				style="width: 100%">
				<thead>
					<tr>
						<th class="center"><label class="pos-rel"> <input
								id="checkAll" type="checkbox" value="${item.iddetail }"
								class="ace" /> <span class="lbl"></span>
						</label></th>
						<!-- name="idcheck" -->


						<th>ID</th>
						<th
							class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">ID
							ngưởi dùng</th>
						<th>Tên ngưởi dùng</th>
						<th
							class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">Số
							điện thoại</th>
						<th
							class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">ID
							chương trình quyên góp</th>
						<th>Tên chương trình quyên góp</th>
						<th>Tiền quyên góp</th>
						<th
							class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">Trạng
							thái chuyển tiền</th>
						<td>
							<button type="button" class="btn-success text-dark">
								<a
									href="${pageContext.request.contextPath}/admin-addDonationDetail.jsp"
									class="text-white ">Thêm</a>
							</button>
							<button class="btn-danger text-white" type="submit"
								onclick="return confirm('Bạn chắc chắn muốn xóa không?'); ">Xóa

							</button>
						</td>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${Donationdetails }">
						<tr>
							<th class="center"><label class="pos-rel"> <input
									type="checkbox" value="${item.iddetail}" name="idcheck"
									class="ace" /> <span class="lbl"></span>
							</label></th>
							<td>${item.iddetail }</td>
							<td
								class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">${item.user.iduser}</td>
							<td>${item.user.username}</td>
							<td
								class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">${item.user.phonenumber}</td>
							<td
								class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">${item.donationprogram.iddonation}</td>
							<td>${item.donationprogram.title}</td>
							<td><fmt:formatNumber value="${item.moneydonate }"
									type="number" /></td>
							<td
								class="d-xs-none d-sm-none d-md-none d-lg-table-cell d-xl-table-cell ">${item.status}</td>
							<td><button type="button" class=" btn-white">
									<a
										href="${pageContext.request.contextPath}/DonationDetail/edit?DonaDetailId=${item.iddetail}"
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