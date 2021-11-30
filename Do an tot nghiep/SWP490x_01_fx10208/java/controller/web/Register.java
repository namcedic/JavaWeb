package controller.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import hibernate.model.User;
import jpa.dao.UserDao;
import page.utils.Email;
import page.utils.EmailUtils;
import page.utils.HashPassUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/register.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			try {
				User user = new User();
				BeanUtils.populate(user, request.getParameterMap());
				UserDao dao =new UserDao();
				String pass = new page.utils.RandomPass().randomString(10);
		
				user.setPassword(HashPassUtils.hashMd5(pass));
				user.setStatus("actived");
				dao.insert(user);
						
				Email email = new Email();
				email.setFrom("donationfundproject@gmail.com");
				email.setFromPassword("admin@1a2b3c");
				email.setTo(user.getEmail());
				email.setSubject("Kích hoạt tài khoản");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear, ").append(user.getFullname()).append("<br>");
				sb.append("Username của bạn là: ").append(user.getUsername()).append("<br>");
				sb.append("Mật khẩu của bạn là: ").append(pass + ".<br>");
				sb.append("Click vào link để đăng nhập và kích hoạt tài khoản: http://localhost:8080/SWP490x_01_fx10208/login.jsp");
				sb.append("<br>");
				sb.append("From Administrator of DonationFund");
				email.setContent(sb.toString());
				EmailUtils.send(email);
				request.setAttribute("message", "đăng kí thành công");		
			} catch (IllegalAccessException e) {
				request.setAttribute("error",e.getMessage());
			} catch (InvocationTargetException e) {	
				request.setAttribute("error",e.getMessage());
			} catch (Exception e) {
				request.setAttribute("error",e.getMessage());
				request.setAttribute("message","đăng kí thất bại, vui lòng thử lại");
			}
			request.getRequestDispatcher("/register.jsp").forward(request, response);
	}
}