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
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher 
				= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("ID");
		String password = request.getParameter("PW");
		String rememberMeStr = request.getParameter("remember");
		boolean remember = "Y".equals(rememberMeStr);
		
		UserAccount user = null;
		boolean hasError = false;
		String errorString = null;

		if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
			hasError = true;
			errorString = "�븘�씠�뵒�� 鍮꾨�踰덊샇瑜� �솗�씤�븯�꽭�슂";
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			try {
				// Find the user in the DB.
				user = DBUtils.findUser(conn, userName, password);

				if (user == null) {
					hasError = true;
					errorString = "�뾾�뒗 �븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇 �엯�땲�떎.";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}
		// If error, forward to /WEB-INF/views/login.jsp
		if (hasError) {
			user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);

			// Store information in request attribute, before forward.
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);

			// Forward to /WEB-INF/views/login.jsp
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView2.jsp");

			dispatcher.forward(request, response);
		}
		// If no error
		// Store user information in Session
		// And redirect to userInfo page.
		else {
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, user);

			// If user checked "Remember me".
			if (remember) {
				MyUtils.storeUserCookie(response, user);
			}
			// Else delete cookie.
			else {
				MyUtils.deleteUserCookie(response);
			}

			// Redirect to userInfo page.
			response.sendRedirect(request.getContextPath() + "/userInfo");
		}

	}

}
