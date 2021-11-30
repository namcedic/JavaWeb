package controller.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import hibernate.model.Donationdetail;
import hibernate.model.Donationprogram;
import hibernate.model.User;
import jpa.dao.DonationDao;
import jpa.dao.DonationDetailDao;
import jpa.dao.UserDao;
import page.utils.BankList;
import page.utils.ReadExcelFile;

@WebServlet({ "/DonationDetailServlet", "/DonationDetail/create", "/DonationDetail/edit", "/DonationDetail/update",
		"/DonationDetail/delete", "/DonationDetail/view", "/DonationDetail/make","/DonationDetail/history","/DonationDetail/donate" })
public class DonationDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String url = request.getRequestURL().toString();
		Donationdetail donaDetail = null;
		if (url.contains("delete")) {
			delete(request, response);
			donaDetail = new Donationdetail();
			request.setAttribute("donaDetail", donaDetail);
		} else if (url.contains("edit")) {
			edit(request, response);
			request.getRequestDispatcher("/admin-addDonationDetail.jsp").forward(request, response);
			return;
		} else if (url.contains("create")) {
			request.getRequestDispatcher("/admin-addDonationDetail.jsp").forward(request, response);
			return;
		} else if (url.contains("reset")) {
			request.getRequestDispatcher("/admin-addDonationDetail.jsp").forward(request, response);
			return;

		} else if (url.contains("make")) {
			request.getRequestDispatcher("/addDonationDetail.jsp").forward(request, response);
		} else if (url.contains("view")) {
			String id = request.getParameter("id");
			DonationDao dao = new DonationDao();
			DonationDetailDao detailDao = new DonationDetailDao();
			Donationprogram donaPro = dao.findById(id);
			int timeDonate = detailDao.countDonate(Integer.parseInt(id));
			long totalMoney = detailDao.getTotalMoney(Integer.parseInt(id));
			request.setAttribute("timeDonate", timeDonate);
			request.setAttribute("donaPro", donaPro);
			request.setAttribute("totalMoney", totalMoney);
			request.getRequestDispatcher("/detailpage.jsp").forward(request, response);
			return;
		} else if (url.contains("donate")) {
			String id = request.getParameter("id");
			DonationDao dao = new DonationDao();
			Donationprogram donaPro = dao.findById(id);
			request.setAttribute("donaPro", donaPro);
			request.getRequestDispatcher("/addDonationDetail.jsp").forward(request, response);
			return;
		}else if (url.contains("history")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			String iduser = String.valueOf(user.getIduser()) ;
			DonationDetailDao detailDao = new DonationDetailDao();
			List<Donationdetail> donaDetailList = detailDao.findByUserId(iduser);
			request.setAttribute("donaDetail", donaDetailList);
			request.getRequestDispatcher("/history.jsp").forward(request, response);
			return;
		}
		String excelFilePath = "E:/banktransfer.xls";
		ReadExcelFile readfile = new ReadExcelFile();
		List<BankList> bankList = new ArrayList<>();
		bankList = readfile.readExcel(excelFilePath);
		for (int i = 0; i < bankList.size(); i++) {
			BankList b = bankList.get(i);
			int iduser= b.getIduser();
			int iddonation = b.getIddonation();
			BigDecimal moneydonate = b.getMoneydonate();		 			
			Donationdetail donaDetail1 = new Donationdetail();
			DonationDetailDao detailDao = new DonationDetailDao();
			List<Donationdetail> ls = detailDao.findByUserIdAndIDDonation(iduser, iddonation, moneydonate);
			for (Donationdetail d : ls) {
				if (d!=null) {
					d.setStatus("Đã chuyển tiền");
					detailDao.update(d);
				}
			}
		}	
			
		findAll(request, response);
		request.getRequestDispatcher("/admin-DonationDetailControl.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = request.getRequestURL().toString();
		if (url.contains("update")) {
			update(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
			request.setAttribute("donaDetail", new Donationdetail());
		} else if (url.contains("create")) {
			insert(request, response);
		} else if (url.contains("make")) {
			make(request, response);
			request.getRequestDispatcher("/addDonationDetailBankTransfer.jsp").forward(request, response);
			return;
		}
		
		findAll(request, response);
		request.getRequestDispatcher("/admin-DonationDetailControl.jsp").forward(request, response);

	}

	private void make(HttpServletRequest request, HttpServletResponse response) {
		try {
			String iduser = request.getParameter("iduser");
			String iddonation = request.getParameter("iddonation");
			Donationdetail donaDetail = new Donationdetail();
			BeanUtils.populate(donaDetail, request.getParameterMap());
			DonationDao donaDao = new DonationDao();
			UserDao userDao = new UserDao();
			User user = userDao.findById(iduser);
			Donationprogram donaProgram = donaDao.findById(iddonation);
			donaDetail.setUser(user);
			donaDetail.setDonationprogram(donaProgram);
			DonationDetailDao detailDao = new DonationDetailDao();
			detailDao.update(donaDetail);
			request.setAttribute("donaDetail", donaDetail);
			request.setAttribute("message", "Quyên góp thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Quyên góp không thành công");
		}
	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Donationdetail donaDetail = new Donationdetail();
			BeanUtils.populate(donaDetail, request.getParameterMap());
			DonationDetailDao dao = new DonationDetailDao();
			dao.insert(donaDetail);
			request.setAttribute("donaDetail", donaDetail);
			request.setAttribute("message", "Thêm thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			DonationDetailDao dao = new DonationDetailDao();
			List<Donationdetail> list = dao.findAll();
			request.setAttribute("Donationdetails", list);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String DonaDetailId = request.getParameter("DonaDetailId");
			DonationDetailDao dao = new DonationDetailDao();

			Donationdetail donaDetail = dao.findById(DonaDetailId);
			request.setAttribute("donaDetail", donaDetail);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String iduser = request.getParameter("iduser");
			String iddonation = request.getParameter("iddonation");
			Donationdetail donaDetail = new Donationdetail();
			BeanUtils.populate(donaDetail, request.getParameterMap());
			DonationDao donaDao = new DonationDao();
			UserDao userDao = new UserDao();
			User user = userDao.findById(iduser);
			Donationprogram donaProgram = donaDao.findById(iddonation);
			donaDetail.setUser(user);
			donaDetail.setDonationprogram(donaProgram);
			DonationDetailDao detailDao = new DonationDetailDao();
			detailDao.update(donaDetail);
			request.setAttribute("donaDetail", donaDetail);
			request.setAttribute("message", "Cập nhật thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Cập nhật không thành công");
		}

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String[] idList = request.getParameterValues("idcheck");
			for (String ids : idList) {
				DonationDetailDao dao = new DonationDetailDao();
				int DonaDetailId = Integer.parseInt(ids);
				dao.delete(DonaDetailId);
			}
			request.setAttribute("message", "Xóa thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}
}