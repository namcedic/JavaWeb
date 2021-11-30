package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hibernate.model.User;

/**
 * Servlet Filter implementation class AuthorFilter
 */
@WebFilter(filterName = "AuthorFilter", urlPatterns = { "/*" })
public class AuthorFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		ServletContext context = fConfig.getServletContext();

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String url = req.getRequestURI();

		if (url.contains("/admin")|| url.contains("Servlet")) {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			if (user == null) {
				req.setAttribute("message", "Bạn không có quyền truy cập");
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
			} else {
				if (user.getUserrole() == 1) {
					chain.doFilter(request, response);
				} else {
					req.setAttribute("message", "Bạn không có quyền truy cập");
					req.getRequestDispatcher("/login.jsp").forward(req, resp);
				}
			}
		} else {
			chain.doFilter(req, resp);
		}
	}

	public void destroy() {

	}

}
