package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.jbnu.se.advweb.product.model.Content;
import kr.ac.jbnu.se.advweb.product.model.ContentInfo;
import kr.ac.jbnu.se.advweb.product.model.Reply;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.model.UserManageInfo;
import kr.ac.jbnu.se.advweb.product.model.UserSearch;
import kr.ac.jbnu.se.advweb.product.model.notificationInfo;

public class DBUtils {

	public static List<Content> queryContent(Connection conn) throws SQLException {
		String sql = "Select * From content";
		List<Content> list = new ArrayList<Content>();

		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			Content contents = new Content();
			int content_id = rs.getInt("content_id");
			String user_id = rs.getString("user_id");
			String content = rs.getString("content");
			int likes = rs.getInt("likes");
			String category = rs.getString("category");
			String path = rs.getString("url");

			contents.setContent_id(content_id);
			contents.setUser_id(user_id);
			contents.setContent(content);
			contents.setlikes(likes);
			contents.setCategory(category);
			contents.setPath(path);

			list.add(contents);
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

	public static void userReport(Connection conn, String userId) throws SQLException {

		String sql = "update user set black_check=1 where id='" + userId + "'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.executeUpdate();

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

	public static boolean idCheck(Connection conn, String id) throws SQLException {

		String sql = "select * from user where id='" + id + "'";

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

	public static void insertForm(Connection conn, String id, String pw, String imageurl, String email, String name)
			throws SQLException {

		String sql = "Insert into user (id,pw,imageurl,email,name) values(?,?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, id);
		pstm.setString(2, pw);
		pstm.setString(3, imageurl);
		pstm.setString(4, email);
		pstm.setString(5, name);

		pstm.executeUpdate();

	}

	public static void UpdateUserInfo(Connection conn, String id, String pw, String imageurl, String email, String name)
			throws SQLException {

		String sql = "Update user set pw =?, imageurl=? ,email=?, name =? where id='" + id + "'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		System.out.println("$$$$$$$$$$$$$$$");
		pstm.setString(1, pw);
		pstm.setString(2, imageurl);
		pstm.setString(3, email);
		pstm.setString(4, name);

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

	public static int notificationCheck(Connection conn, String userId) throws SQLException {

		String sql = "select count(*) as count from noti where receiver='" + userId + "'";
		int count = 0;
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {

			count = rs.getInt("count");

		}

		return count;

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

	public static void insertContent(Connection conn, String userId, String content, String category, String path)
			throws SQLException {
		String sql = "Insert into content (user_id,content,category, url) values (?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, userId);
		pstm.setString(2, content);
		pstm.setString(3, category);
		pstm.setString(4, path);

		pstm.executeUpdate();
	}

	public static UserAccount getPageUser(Connection conn, String pageUserId) throws SQLException {
		// ?";
		String sql = "select * from user where id='" + pageUserId + "'";

		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {

			UserAccount user = new UserAccount();

			user.setId(rs.getString("id"));
			user.setPassword(rs.getString("pw"));
			user.setBlack_check(rs.getInt("black_check"));
			user.setEmail(rs.getString("email"));
			user.setImageUrl(rs.getString("imageUrl"));
			user.setName(rs.getString("name"));

			return user;
		}

		return null;

	}

	public static List<ContentInfo> getPageInfo(Connection conn, String userId) throws SQLException {

		String sql = "select u.imageUrl, u.name, u.id, c.url from user u, content c where u.id=c.user_id and u.id='"
				+ userId + "'";
		List<ContentInfo> list = new ArrayList<ContentInfo>();

		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {

			ContentInfo ContentInfo = new ContentInfo();

			ContentInfo.setContentImage(rs.getString("url"));
			ContentInfo.setName(rs.getString("name"));
			ContentInfo.setProfileImage(rs.getString("imageUrl"));
			ContentInfo.setUser_id(rs.getString("id"));

			list.add(ContentInfo);

		}

		return list;
	}

	public static List<Reply> findReply(Connection conn, int contentID) throws SQLException {
		String sql = "select reply from reply where content_id= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, contentID);
		ResultSet rs = pstm.executeQuery();
		List<Reply> list = new ArrayList<Reply>();

		while (rs.next()) {
			Reply reply = new Reply();
			String replies = rs.getString("reply");
			reply.setReply(replies);
			list.add(reply);
		}
		return list;
	}

	public static Content findContent(Connection conn, int contentID) throws SQLException {
		String sql = "select * from content where content_id= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, contentID);
		ResultSet rs = pstm.executeQuery();
		Content contents = new Content();

		if (rs.next()) {
			int content_id = rs.getInt("content_id");
			String user_id = rs.getString("user_id");
			String content = rs.getString("content");
			int likes = rs.getInt("likes");
			String category = rs.getString("category");
			String path = rs.getString("url");

			contents.setContent_id(content_id);
			contents.setUser_id(user_id);
			contents.setContent(content);
			contents.setlikes(likes);
			contents.setCategory(category);
			contents.setPath(path);
		}
		return contents;
	}

	public static void insertReply(Connection conn, Reply reply) throws SQLException {
		String sql = "Insert into reply(content_id, reply) values(?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setInt(1, reply.getContentID());
		pstm.setString(2, reply.getReply());
		pstm.executeUpdate();
	}

}