package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	boolean sizeError = false;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MultipartRequest multi = null;
		
		int fileMaxSize = 10*1024*1024;
		
		String savePath = request.getRealPath("/image").replace("\\\\", "/");
		
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8",new DefaultFileRenamePolicy());
		}catch(Exception e) {
			
			if(e.getMessage().indexOf("exceeds limit")> -1) { //파일사이즈 초과된 경우
				sizeError = true;
			}
		}
		if(sizeError) {
			response.setContentType("text/html; charset=UTF=8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("<script>alert(''); location.href=''; </script>");
			return ;
		}
		
		String flag = multi.getParameter("flag");
		
		Connection conn = MyUtils.getStoredConnection(request);
		
		if(flag.equals("signUp")) {
			
			String id = multi.getParameter("upid");
			String pw = multi.getParameter("uppassword");
			String email = multi.getParameter("upemail");
			String name = multi.getParameter("upname");
			
			File file = multi.getFile("upfile"); //input name으로 첨부파일 받아옴
			
			UserAccount userAccount = new UserAccount();
			userAccount.setId(id);
			userAccount.setPassword(pw);
			userAccount.setEmail(email);
			userAccount.setName(name);
		
		
			if(file == null) {
				System.out.println("파일이 존재하지 않습니다.");
			}
			else {
			String fileName = multi.getFilesystemName("upfile");
			String fileOriName = multi.getOriginalFileName("upfile");
			String filePath = "image/"+fileName;
			
			System.out.println(filePath);
			try {
				DBUtils.insertForm(conn, id, pw, filePath, email, name);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				}
		}
		
		response.sendRedirect(request.getContextPath() + "/login2");
		
		doGet(request, response);
	}

}
