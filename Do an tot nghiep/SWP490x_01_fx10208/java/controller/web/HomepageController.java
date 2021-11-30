package controller.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.beanutils.BeanUtils;

import hibernate.model.Donationprogram;
import hibernate.model.User;
import jpa.dao.DonationDao;
import jpa.dao.UserDao;
import page.utils.CookieUtils;
import page.utils.HashPassUtils;

/**
 * Servlet implementation class HomepageController
 */
@WebServlet(urlPatterns = { "/index.jsp", "/login", "/logout" })
public class HomepageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("login")) {
			String username = CookieUtils.get("username", request);
			String password = CookieUtils.get("password", request);
			if (username != null && password != null) {
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return;
			}
		} else if (url.contains("logout")) {
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if (url.contains("profile")) {			
			request.getRequestDispatcher("/profile.jsp").forward(request, response);
			return;
		} else {
			Donationprogram donaPro = new Donationprogram();
			DonationDao dao = new DonationDao();
			List<Donationprogram> list = dao.findAll();
			request.setAttribute("donationprograms", list);
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String remember = request.getParameter("remember");
		String password = request.getParameter("password");

		if (action != null && action.equalsIgnoreCase("login")) {
			User usr = new User();
			try {
				BeanUtils.populate(usr, request.getParameterMap());
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			UserDao dao = new UserDao();
			User user = dao.checkLogin(usr.getUsername(), HashPassUtils.hashMd5(usr.getPassword()), "actived");
			if (user != null) {
				if (!(remember == null)) {
					CookieUtils.add("username", user.getUsername(), 60, response);
					CookieUtils.add("password", password, 60, response);
				} else {
					CookieUtils.add("username", user.getUsername(), 0, response);
					CookieUtils.add("password", user.getPassword(), 0, response);
				}
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				if (user.getUserrole() == 1) {
					response.sendRedirect(request.getContextPath() + "/UserServlet");
				} else if (user.getUserrole() == 0) {
					response.sendRedirect(request.getContextPath() + "/index.jsp");
				}
			} else {
				request.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}
	}
}