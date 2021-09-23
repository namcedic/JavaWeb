package controllerSearch;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.page.PageInfo;
import controller.page.PageType;
import dao.ListProductDAO;
import model.Product;

/**
 * Servlet implementation class ListSearch
 */
@WebServlet("/index.jsp")
public class ListSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListSearch() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String searchKey = null;
		/*
		 * Tìm trong database, nếu không có kết quả trả về trang chủ
		 */
		try {
			searchKey = request.getParameter("searchKey");
			if (searchKey == null) {
				searchKey = "";
			} 
			List<Product> ls = new ListProductDAO().search(searchKey);
			request.setAttribute("products", ls);
			request.setAttribute("txtSearchKey", searchKey);
			PageInfo.prepareAndForward(request, response, PageType.HOME_PAGE);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			request.setAttribute("error", "Error: " + e.getMessage());
			PageInfo.prepareAndForward(request, response, PageType.HOME_PAGE);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
