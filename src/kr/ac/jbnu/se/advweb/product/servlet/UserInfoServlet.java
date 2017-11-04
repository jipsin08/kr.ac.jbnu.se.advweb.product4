package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.model.notificationInfo;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet(urlPatterns = { "/userInfo" })
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserInfoServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		String pageUserId = request.getParameter("receiver"); // 내가 검색한 아이디(상대방
																// 아이디)
		notificationInfo notificationInfo = null;

		// Check User has logged on
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		try {
			notificationInfo = DBUtils.friendRequestCheck(conn, request.getParameter("sender"),
					request.getParameter("receiver")); // 둘의 친구상태 여부를 확인하기 위함
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Not logged in
		if (loginedUser == null) {
			// Redirect to login page.
			response.sendRedirect(request.getContextPath() + "/login2");
			return;
		}

		// Store info to the request attribute before forwarding.
		request.setAttribute("loginedUser", loginedUser);
		request.setAttribute("pageUserId", pageUserId);
		request.setAttribute("notificationInfo", notificationInfo);

		// If the user has logged in, then forward to the page
		// /WEB-INF/views/userInfoView.jsp
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/userInfoView.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}