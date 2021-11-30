$(document).ready(function() {
	$('#example').DataTable({
		columnDefs: [{
	      "targets": [ 0, 9 ],
	      "orderable": false
	   }],
		order: [
			[3, 'desc']
		],
		pagingType: 'full_numbers',
		lengthMenu: [
			[5, 10, 20, 50, -1],
			[5, 10, 20, 50, "Tất cả"]
		],
		createRow: function(row, data, index) {
			if (data[5].replace(/[\$,]/g, '') * 1 > 15000) {
				$('td', row).ep(5).addClass('text-success')
			}
		},
		language: {
			search: "Tìm kiếm",
			lengthMenu: "Hiển thị _MENU_ dòng",
			info: "Hiển thị từ _START_ đến _END_ tổng cộng _TOTAL_ dòng",
			infoEmpty: "Hiển thị 0 bản ghi trong 0 tổng cộng 0 ",
			zeroRecords: "Không có dữ liệu đã tìm",
		},
		"footerCallback": function(row, data, start, end, display) {
			var api = this.api(),
				data;

			// Remove the formatting to get integer data for summation
			var intVal = function(i) {
				return typeof i === 'string' ?
					i.replace(/[\$,]/g, '') * 1 :
					typeof i === 'number' ?
						i : 0;
			};

			// Total over all pages
			total = api
				.column(4)
				.data()
				.reduce(function(a, b) {
					return intVal(a) + intVal(b);
				}, 0);

			// Total over this page
			pageTotal = api
				.column(4, {
					page: 'current'
				})
				.data()
				.reduce(function(a, b) {
					return intVal(a) + intVal(b);
				}, 0);

			// Update footer
			$(api.column(4).footer()).html(
				'$' + pageTotal + ' ( $' + total + ' total)'
			);
		}
	});
}); 