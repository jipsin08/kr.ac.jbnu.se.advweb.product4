package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.File;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class ModifyUserInfoServlet
 */
@WebServlet("/modifyuserinfo")
public class ModifyUserInfoServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/modifyUserInfoView.jsp");
      dispatcher.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
      Connection conn = MyUtils.getStoredConnection(request);
      
      if(flag.equals("modifyInfo")) {
         
         String name = multi.getParameter("name");
         String pw = multi.getParameter("password");
         String email = multi.getParameter("email");
         
         File file = multi.getFile("file"); //input name으로 첨부파일 받아옴
         
         if(file == null) {
            System.out.println("파일이 존재하지 않습니다.");
         }
         else {
            
            
            String fileName = multi.getFilesystemName("file");
            String fileOriName = multi.getOriginalFileName("file");
            String filePath = "image/"+fileName;
         
            System.out.println(filePath);
      
         try {
            HttpSession session = request.getSession();
            String userId = MyUtils.getLoginedUser(session).getId();
            
            
            
            DBUtils.UpdateUserInfo(conn, userId, pw, filePath, email, name );
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
         }
      }
      RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
      dispatcher.forward(request, response);
      
      
   
   }
   }
