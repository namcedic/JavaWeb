package controller.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.model.User;
import jpa.dao.UserDao;
import page.utils.Email;
import page.utils.EmailUtils;
import page.utils.HashPassUtils;


/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/ResetPass.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String emailAddress = request.getParameter("email");
			UserDao dao = new UserDao();
			User user = dao.findByEmail(emailAddress);

			if (user == null) {
				request.setAttribute("message", "Email are incorrect");

			} else {
				String password = new page.utils.RandomPass().randomString(10);
				Email email = new page.utils.Email();
				email.setFrom("donationfundproject@gmail.com");
				email.setFromPassword("admin@1a2b3c");
				email.setTo(emailAddress);
				email.setSubject("Thay đổi mật khẩu");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear, ").append(user.getFullname()).append("<br>");
				sb.append("Mật khẩu mới của bạn là: ").append(password + ".<br>");
				sb.append("Đăng nhập và thay đổi mật khẩu. <br>");
				sb.append("Click vào link để đăng nhập: http://localhost:8080/SWP490x_01_fx10208/login.jsp");
				sb.append("<br>");
				sb.append("From Administrator of DonationFund");
				email.setContent(sb.toString());
				EmailUtils.send(email);

				user.setPassword(HashPassUtils.hashMd5(password));
				dao.update(user);
				request.setAttribute("message", "Kiểm tra email để thay đỏi mật khẩu của bạn");
			}

		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}

		request.getRequestDispatcher("/ResetPass.jsp").forward(request, response);
	}
}