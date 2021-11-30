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

/**
 * Servlet implementation class ActiveAccount
 */
@WebServlet("/ActiveAccount")
public class ActiveAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDao dao = new UserDao();
			dao.active(user.getEmail(), user.getPassword(), "unactivated");
			if (dao.active(user.getEmail(), user.getPassword(), "unactivated") == null) {
				request.setAttribute("message", "Incorrect email or password");
				request.getRequestDispatcher("/active.jsp").forward(request, response);
			} else {
				user.setStatus("active");
				dao.update(user);
				request.setAttribute("message", "Active success");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

	}
}
