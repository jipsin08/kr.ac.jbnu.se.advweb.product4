package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.jbnu.se.advweb.product.model.UserManageInfo;
import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.model.Reply;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.model.UserSearch;
import kr.ac.jbnu.se.advweb.product.model.notificationInfo;

public class DBUtils {

	public static List<Reply> findReply(Connection conn, String contentID) throws SQLException{
		String sql = "select reply from reply where content_id= ?";
	
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, contentID);
		ResultSet rs = pstm.executeQuery();
		List<Reply> list = new ArrayList<Reply>();
		
		while(rs.next()) {
			Reply reply = new Reply();
			String replies = rs.getString("reply");
			reply.setReply(replies);
			list.add(reply);
		}
		
		return list;
	}
	
	public static UserAccount findUser(Connection conn, String id, String password) throws SQLException {

		// String sql = "Select a.id, a.pw from user a where a.id= ? and a.pw=
		// ?";
		String sql = "select * from user where id=? and pw=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, id);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {

			UserAccount user = new UserAccount();

			user.setId(id);
			user.setPassword(password);


			user.setImageUrl(rs.getString("imageUrl"));
			user.setEmail(rs.getString("email"));
			user.setName(rs.getString("name"));
			user.setBlack_check(rs.getInt("black_check"));

			return user;
		}

		return null;
	}

	public static UserAccount findUser(Connection conn, String id) throws SQLException {

		String sql = "Select a.id, a.pw from user a " + " where a.id = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, id);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String password = rs.getString("Password");
			UserAccount user = new UserAccount();
			user.setId(id);
			user.setPassword(password);

			return user;
		}
		return null;
	}

	public static List<Product> queryProduct(Connection conn) throws SQLException {
		String sql = "Select a.Code, a.Name, a.Price from Product a ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			float price = rs.getFloat("Price");
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			list.add(product);
		}
		return list;
	}

	public static Product findProduct(Connection conn, String code) throws SQLException {
		String sql = "Select a.Code, a.Name, a.Price from Product a where a.Code=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, code);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			String name = rs.getString("Name");
			float price = rs.getFloat("Price");
			Product product = new Product(code, name, price);
			return product;
		}
		return null;
	}

	public static void updateProduct(Connection conn, Product product) throws SQLException {
		String sql = "Update Product set Name =?, Price=? where Code=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getName());
		pstm.setFloat(2, product.getPrice());
		pstm.setString(3, product.getCode());
		pstm.executeUpdate();
	}

	public static void insertProduct(Connection conn, Product product) throws SQLException {
		String sql = "Insert into Product(Code, Name,Price) values (?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getCode());
		pstm.setString(2, product.getName());
		pstm.setFloat(3, product.getPrice());

		pstm.executeUpdate();
	}

	public static void deleteProduct(Connection conn, String code) throws SQLException {
		String sql = "Delete From Product where Code= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, code);

		pstm.executeUpdate();
	}
	

	public static boolean idCheck(Connection conn,String id) throws SQLException {
	
		String sql = "select * from user where id='"+id+"'";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		
		rs.last();      
		int size = rs.getRow();
		rs.beforeFirst();

		if (size > 0) 
			return false;
		else 
			return true;
	}


	public static void insertForm(Connection conn, String id, String pw, String imageurl,
			String email,String name) throws SQLException {
		
		String sql = "Insert into user (id,pw,imageurl,email,name) values(?,?,?,?,?)";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		
		pstm.setString(1, id);
		pstm.setString(2, pw);
		pstm.setString(3, imageurl);
		pstm.setString(4, email);
		pstm.setString(5, name);

		
		pstm.executeUpdate();
	
		
	}
	
	public static void UpdateUserInfo(Connection conn, String id, String pw, String imageurl,
			String email,String name) throws SQLException {
		
		String sql = "Update user set pw =?, imageurl=? ,email=?, name =? where id='"+id+"'";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		
		pstm.executeUpdate();
	
		
	}

	public static List userSearch(Connection conn, String userId) throws SQLException {
		String sql = "select * from user where id like'%" + userId + "%'";

		String a = "select * from user where id='" + userId + "'";
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<UserSearch> list = new ArrayList<UserSearch>();

		while (rs.next()) {
			String id = rs.getString("id");
			String imageUrl = rs.getString("imageurl");

			UserSearch userSearch = new UserSearch(id, imageUrl);

			list.add(userSearch);

		}
		return list;
	}

	public static List getNotification(Connection conn, String userId) throws SQLException {

		String sql = "select * from noti where receiver='" + userId + "'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<notificationInfo> list = new ArrayList<notificationInfo>();

		while (rs.next()) {

			notificationInfo notificationInfo = new notificationInfo();

			notificationInfo.setContent_id(rs.getInt("content_id"));
			notificationInfo.setFriend_check(rs.getInt("friend_check"));
			notificationInfo.setReceiver(rs.getString("receiver"));
			notificationInfo.setSender(rs.getString("sender"));
			notificationInfo.setType(rs.getString("type"));

			list.add(notificationInfo);

		}
		return list;
	}

	public static List getReportedUser(Connection conn) throws SQLException {

		String sql = "select * from user where black_check='1'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<UserManageInfo> list = new ArrayList<UserManageInfo>();

		while (rs.next()) {

			String id = rs.getString("id");
			String imageUrl = rs.getString("imageUrl");
			int flag = rs.getInt("black_check");
			UserManageInfo blockedUser = new UserManageInfo(id, imageUrl, flag);

			list.add(blockedUser);

		}
		return list;
	}

	public static List getBlockeduser(Connection conn) throws SQLException {

		String sql = "select * from user where black_check='2'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<UserManageInfo> list = new ArrayList<UserManageInfo>();

		while (rs.next()) {

			String id = rs.getString("id");
			String imageUrl = rs.getString("imageUrl");
			int flag = rs.getInt("black_check");
			UserManageInfo blockedUser = new UserManageInfo(id, imageUrl, flag);

			list.add(blockedUser);

		}
		return list;
	}

	public static void userBlockedConfirm(Connection conn, String userId) throws SQLException {

		String sql = "update user set black_check=2 where id='" + userId + "'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.executeUpdate();

	}

	public static void friendRequest(Connection conn, String sender, String receiver) throws SQLException {

		String sql = "Insert into noti(sender,receiver,type,friend_check) values (?,?,?,1)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, sender);
		pstm.setString(2, receiver);
		pstm.setString(3, "friend");

		pstm.executeUpdate();

	}

	public static notificationInfo friendRequestCheck(Connection conn, String sender, String receiver)
			throws SQLException {

		String sql = "select sender,receiver,friend_check from noti where sender=? and receiver=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, sender);
		pstm.setString(2, receiver);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {

			notificationInfo notificationInfo = new notificationInfo();

			notificationInfo.setFriend_check(rs.getInt("friend_check"));
			notificationInfo.setSender(rs.getString("sender"));
			notificationInfo.setReceiver(rs.getString("receiver"));

			return notificationInfo;
		}

		return null;
	}

	public static void friendRequestConfirm(Connection conn, String sender, String receiver) throws SQLException {
		String sql = "Update noti set friend_check=2 where sender=? and receiver=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, sender);
		pstm.setString(2, receiver);
		pstm.executeUpdate();
	}


}