package controller.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hibernate.model.User;
import jpa.dao.UserDao;
import page.utils.HashPassUtils;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/changepass.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String oldpass = HashPassUtils.hashMd5(request.getParameter("oldpass"));
		String newpass = request.getParameter("newpass");
		String renewpass = request.getParameter("renewpass");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		UserDao dao = new UserDao();
		User user1 = dao.checkLogin(user.getUsername(), oldpass, user.getStatus());
		if (user1 != null) {
			if (newpass.equals(renewpass)) {
				if (newpass.length() > 8) {
					user.setPassword(HashPassUtils.hashMd5(newpass));
					dao.update(user);
					request.setAttribute("message", "Đổi mật khẩu thành công");
					session.invalidate();
					request.getRequestDispatcher("/login.jsp").forward(request, response);
					return;
				} else {
					request.setAttribute("message", "Mật khẩu phải lớn hơn 8 kí tự và không có khoảng trắng");
				}
			} else {
				request.setAttribute("message", "Mật khẩu mới không khớp");
			}
			
		} else {
			request.setAttribute("message", "Mật khẩu không khớp");
		}
		request.getRequestDispatcher("/changepass.jsp").forward(request, response);
	}

}
