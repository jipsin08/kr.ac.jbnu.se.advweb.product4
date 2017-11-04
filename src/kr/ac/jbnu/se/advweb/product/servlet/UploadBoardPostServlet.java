package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class UploadBoardPostServlet
 */
@WebServlet("/UploadBoardPost")
public class UploadBoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadBoardPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * Servlet implementation class UploadServlet
		 **/
		
		   boolean sizeError = false;
		    
		   
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
		      
		      Connection conn = (Connection) MyUtils.getStoredConnection(request);
		      
		      if(flag.equals("image")) {
		      	 HttpSession session = request.getSession();
		      	 
		         String userId = MyUtils.getLoginedUser(session).getUserName(); //Merge 하고 난뒤에 getUserId로 바꿀듯 (민중이가바꾼것으로)
		         String content = multi.getParameter("content");
		         String category = multi.getParameter("tag");
		         
		         File file = multi.getFile("upfile"); //input name으로 첨부파일 받아옴
		         
		         if(file == null) {
		            System.out.println("파일이 존재하지 않습니다.");
		         }
		         else {
		         String fileName = multi.getFilesystemName("upfile");
		         String fileOriName = multi.getOriginalFileName("upfile");
		         String filePath = "image/"+fileName;
		         
		         try {
		           DBUtils.insertContent(conn, userId, content,category,filePath );
		            
		         } catch (SQLException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		         }
		            }
		      }
		      
		      
		      RequestDispatcher dispatcher = request.getRequestDispatcher("/userInfo");
		      dispatcher.forward(request, response);
		      
		      doGet(request, response);
		   }


	}


