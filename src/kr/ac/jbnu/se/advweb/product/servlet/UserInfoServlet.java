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
import javax.servlet.http.HttpSession;

import kr.ac.jbnu.se.advweb.product.model.Content;
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);

		List<Content> list = null;
		try {
			list = DBUtils.queryContent(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("content", list);

		String moreInfo = request.getParameter("more");

		HttpSession session = request.getSession();
		String pageUserId = request.getParameter("receiver"); // ?Ç¥Í∞? Í≤??Éâ?ïú ?ïÑ?ù¥?îî(?ÉÅ??Î∞?
		// ?ïÑ?ù¥?îî)
		notificationInfo notificationInfo = null;

		// Check User has logged on
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		try {
			notificationInfo = DBUtils.friendRequestCheck(conn, request.getParameter("sender"),
					request.getParameter("receiver")); // ?ëò?ùò ÏπúÍµ¨?ÉÅ?Éú ?ó¨Î∂?Î•? ?ôï?ù∏?ïòÍ∏? ?úÑ?ï®
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

		if (moreInfo == null) {
			// If the user has logged in, then forward to the page
			// /WEB-INF/views/userInfoView.jsp
			dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/userInfoView.jsp");
			dispatcher.forward(request, response);
		} else {
			dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/additionalUserInfoView.jsp");
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}