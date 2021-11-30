package controller.servlet;

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

import hibernate.model.User;
import jpa.dao.UserDao;
import page.utils.HashPassUtils;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({ "/UserServlet", "/UserServlet/create", "/UserServlet/update", "/UserServlet/edit", "/UserServlet/delete",
		"/UserServlet/reset", "/UserRoll/change" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		User user = null;
		if (url.contains("delete")) {
			delete(request, response);
			user = new User();
			request.setAttribute("user", user);
		} else if (url.contains("edit")) {
			edit(request, response);
			request.getRequestDispatcher("/admin-adduser.jsp").forward(request, response);
			return;
		} else if (url.contains("create")) {
			request.getRequestDispatcher("/admin-adduser-new.jsp").forward(request, response);
			return;
		} else if (url.contains("reset")) {
			user = new User();
			request.setAttribute("user", user);
			request.getRequestDispatcher("/admin-adduser.jsp").forward(request, response);
			return;
		}

		findAll(request, response);
		request.getRequestDispatcher("/admin-usercontrol.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("update")) {
			update(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
			request.setAttribute("user", new User());
		} else if (url.contains("create")) {
			insert(request, response);

		} else if (url.contains("reset")) {
			request.setAttribute("user", new User());
			request.getRequestDispatcher("/admin-adduser.jsp").forward(request, response);
			return;
		} else if (url.contains("change")) {
			change(request, response);
			request.getRequestDispatcher("/profile.jsp").forward(request, response);
			return;
		}
		findAll(request, response);
		request.getRequestDispatcher("/admin-usercontrol.jsp").forward(request, response);

	}

	private void change(HttpServletRequest request, HttpServletResponse response) {
		try {
			User user = new User();
			UserDao dao = new UserDao();
			BeanUtils.populate(user, request.getParameterMap());
			dao.update(user);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			request.setAttribute("message", "Cập nhật thành công");
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (Exception e) {
			request.setAttribute("message", "Cập nhật thất bại");
		}

	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			String pass = HashPassUtils.hashMd5(user.getPassword());
			user.setPassword(pass);
			UserDao dao = new UserDao();
			dao.insert(user);
			request.setAttribute("user", user);
			request.setAttribute("message", "Thêm thành công");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			UserDao dao = new UserDao();
			List<User> list = dao.findAll();
			request.setAttribute("users", list);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String userid = request.getParameter("userid");
			UserDao dao = new UserDao();
			User user = dao.findById(userid);
			request.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			User user = new User();
			UserDao dao = new UserDao();
			User userdb = dao.findByEmail(email);
			BeanUtils.populate(user, request.getParameterMap());
			User userus = dao.checkUpdateUser(user.getUsername(), user.getPassword());

			if (user.getUserrole() == userdb.getUserrole()) {
				if (userus == null) {
					request.setAttribute("message", "Không được đổi tên và mật khẩu");
					return;
				} else {
					dao.update(user);
					request.setAttribute("user", user);
					request.setAttribute("message", "Cập nhật thành công");
				}
			} else {
				if (userdb.getUserrole() == 1) {
					request.setAttribute("message", "Không được cập nhật admin thành user");
					return;
				} else {
					if (userus == null) {
						request.setAttribute("message", "Không được đổi tên và mật khẩu");
						return;
					} else {
						dao.update(user);
						request.setAttribute("user", user);
						request.setAttribute("message", "Cập nhật thành công");
					}
				}
			}
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
				UserDao dao = new UserDao();
				int userid = Integer.parseInt(ids);
				dao.delete(userid);
			}
			request.setAttribute("message", "Xóa thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}
}