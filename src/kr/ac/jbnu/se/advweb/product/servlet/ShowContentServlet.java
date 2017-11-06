package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.jbnu.se.advweb.product.model.Content;
import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.model.Reply;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet("/showContent")
public class ShowContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowContentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int contentID = Integer.parseInt(request.getParameter("content_id"));
		List<Reply> reply = null;
		Connection conn = MyUtils.getStoredConnection(request);
		Content content = null;

		try {
			reply = DBUtils.findReply(conn, contentID);
			content = DBUtils.findContent(conn, contentID);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("content", content);
		request.setAttribute("replyList", reply);

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/showContent.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int contentID = Integer.parseInt(request.getParameter("content_id"));
		String reply = request.getParameter("reply");

		Connection conn = MyUtils.getStoredConnection(request);

		Reply insert_re = new Reply(contentID, reply);

		try {
			if (reply != null)
				DBUtils.insertReply(conn, insert_re);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
