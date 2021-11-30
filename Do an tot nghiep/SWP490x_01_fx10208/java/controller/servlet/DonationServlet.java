package controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import hibernate.model.Donationprogram;
import jpa.dao.DonationDao;

/**
 * Servlet implementation class DonationServlet
 */
@WebServlet({ "/DonationServlet", "/DonationServlet/create", "/DonationServlet/update", "/DonationServlet/edit",
		"/DonationServlet/delete", "/DonationServlet/reset", "/Donation/search" })
public class DonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String url = request.getRequestURL().toString();
		Donationprogram donaPro = null;
		if (url.contains("delete")) {
			delete(request, response);
			donaPro = new Donationprogram();
			request.setAttribute("donaPro", donaPro);
		} else if (url.contains("edit")) {
			edit(request, response);
			request.getRequestDispatcher("/admin-addDonation.jsp").forward(request, response);
			return;
		} else if (url.contains("create")) {
			request.getRequestDispatcher("/admin-addDonation.jsp").forward(request, response);
			return;
		} else if (url.contains("reset")) {
			donaPro = new Donationprogram();
			request.setAttribute("donaPro", donaPro);
			return;
		} else if (url.contains("search")) {
			String searchKey = request.getParameter("searchKey");
			DonationDao dao = new DonationDao();
			List<Donationprogram> ls = dao.findByKey(searchKey);
			request.setAttribute("searchKey", searchKey);
			if (ls != null) {
				request.setAttribute("listSearch", ls);
			} else {
				request.setAttribute("message", "Không tìm thấy kết quả");
			}
			request.getRequestDispatcher("/searchResault.jsp").forward(request, response);
			return;
		}

		findAll(request, response);
		request.getRequestDispatcher("/admin-DonationControl.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = request.getRequestURL().toString();
		if (url.contains("update")) {
			update(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
			request.setAttribute("donaPro", new Donationprogram());
		} else if (url.contains("create")) {
			insert(request, response);
		} else if (url.contains("reset")) {
			request.setAttribute("donaPro", new Donationprogram());
			request.getRequestDispatcher("/admin-addDonation.jsp").forward(request, response);
			return;
		}
		findAll(request, response);
		request.getRequestDispatcher("/admin-DonationControl.jsp").forward(request, response);
	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Donationprogram donaPro = new Donationprogram();
			BeanUtils.populate(donaPro, request.getParameterMap());
			DonationDao dao = new DonationDao();
			dao.insert(donaPro);
			request.setAttribute("donaPro", donaPro);
			request.setAttribute("message", "Thêm thành công");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			DonationDao dao = new DonationDao();
			List<Donationprogram> list = dao.findAll();
			request.setAttribute("donationprograms", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String DoProgramId = request.getParameter("DoProgramId");
			DonationDao dao = new DonationDao();
			Donationprogram donaPro = dao.findById(DoProgramId);
			request.setAttribute("donaPro", donaPro);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Donationprogram donaPro = new Donationprogram();
			BeanUtils.populate(donaPro, request.getParameterMap());
			DonationDao dao = new DonationDao();
			dao.update(donaPro);
			request.setAttribute("donaPro", donaPro);
			request.setAttribute("message", "Cập nhật thành công");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String[] idList = request.getParameterValues("idcheck");
			for (String ids : idList) {
				DonationDao dao = new DonationDao();
				int DoProgramId = Integer.parseInt(ids);
				dao.delete(DoProgramId);
			}
			request.setAttribute("message", "Xóa thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
}