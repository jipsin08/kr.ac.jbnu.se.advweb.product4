package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.jbnu.se.advweb.product.model.UserManageInfo;
import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.model.UserSearch;

public class DBUtils {

	public static UserAccount findUser(Connection conn, //
			String userName, String password) throws SQLException {

		String sql = "Select a.id, a.pw from user a " //
				+ " where a.id= ? and a.pw= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			UserAccount user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);
			return user;
		}
		return null;
	}

	public static UserAccount findUser(Connection conn, String userName) throws SQLException {

		String sql = "Select a.id, a.pw from user a "//
				+ " where a.id = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String password = rs.getString("Password");
			UserAccount user = new UserAccount();
			user.setUserName(userName);
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

	public static List userSearch(Connection conn, String userId) throws SQLException {
		String sql = "select * from user where id like'%" + userId + "%'";

	 String a = "select * from user where id='"+userId+"'";
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

	public static List getReportedUser(Connection conn) throws SQLException {

		String sql = "select * from user where black_check='1'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<UserManageInfo> list = new ArrayList<UserManageInfo>();

		while (rs.next()) {

			String id = rs.getString("id");
			String imageUrl = rs.getString("imageUrl");
			int flag = rs.getInt("black_check");
			UserManageInfo blockedUser = new UserManageInfo(id, imageUrl,flag);

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
			UserManageInfo blockedUser = new UserManageInfo(id, imageUrl,flag);

			list.add(blockedUser);

		}
		return list;
	}

	public static void userBlockedConfirm(Connection conn, String userId) throws SQLException {

		String sql = "update user set black_check=2 where id='" + userId+"'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.executeUpdate();

	}

}