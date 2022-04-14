package control.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import controller.page.HashPassUtils;
import hibernate.model.User;
import jpa.dao.UserDao;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({ "/UserServlet", "/UserServlet/create", "/UserServlet/update", "/UserServlet/edit", "/UserServlet/delete",
		"/UserServlet/reset"})
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
			request.getRequestDispatcher("/adduser.jsp").forward(request, response);
			return;
		} else if (url.contains("create")) {
			request.getRequestDispatcher("/adduser.jsp").forward(request, response);
			return;
		} else if (url.contains("reset")) {
			user = new User();
			request.setAttribute("user", user);
			request.getRequestDispatcher("/adduser.jsp").forward(request, response);
			return;
		}

		findAll(request, response);
		request.getRequestDispatcher("/usercontrol.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("update")) {
			update(request, response);
			/*
			 * request.getRequestDispatcher("/adduser.jsp").forward(request, response);
			 * return;
			 */
		} else if (url.contains("delete")) {
			delete(request, response);
			request.setAttribute("user", new User());
		} else if (url.contains("create")) {
			insert(request, response);
			//request.getRequestDispatcher("/usercontrol.jsp").forward(request, response);
		} else if (url.contains("reset")) {
			request.setAttribute("user", new User());
			request.getRequestDispatcher("/adduser.jsp").forward(request, response);
			return;
		}
		findAll(request, response);
		request.getRequestDispatcher("/usercontrol.jsp").forward(request, response);

	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
//			UserModel userModel =  FormUtil.toModel(UserModel.class, request);
//			String pass = HashPassUtil.hashMd5(userModel.getPassword());
//			userModel.setPassword(pass);
			
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			String pass = HashPassUtils.hashMd5(user.getPassword());
			user.setPassword(pass);
			UserDao dao = new UserDao();
			dao.insert(user);
			request.setAttribute("user", user);
			request.setAttribute("message", "User inserted");

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
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDao dao = new UserDao();
			dao.update(user);
			request.setAttribute("user", user);
			request.setAttribute("message", "User updated");

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
	
			request.setAttribute("message", "User deleted");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}
}