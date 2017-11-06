<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>

<script>
	$(document).ready(function() {
	});

	function showUserInfo() {
		$.get("${pageContext.request.contextPath}/userInfo", {
			more : "Yes"
		}, function(data) {
			$('#additioalUserInfo').html(data);
		});
	}
</script>

</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>

	<section class="jumbotron text-center">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<img alt="Responsive image" src="image/mango.jpg"
						class="img-thumbnail">
				</div>
				<div class="col-sm-8">
					<h3>Hello: ${UserAccount.id}</h3>

					User Name: <b>${UserAccount.name}</b> <br /> <br /> <a
						href="javascript:void(0);" onclick="javascript:showUserInfo();">Show
						More</a>
					<div id="additioalUserInfo"></div>
					<c:choose>

						<c:when test="${notificationInfo.friend_check == null}">
							<a
								href="${pageContext.request.contextPath}/FriendRequest?me=${loginedUser.id}&you=${UserAccount.id}"
								class="btn btn-primary">친구맺기</a>
						</c:when>

						<c:when test="${notificationInfo.friend_check == 1}">
							<a
								href="${pageContext.request.contextPath}/FriendRequest?me=${loginedUser.id}&you=${UserAccount.id}"
								class="btn btn-primary">친구요청보냄</a>
						</c:when>

					</c:choose>

					<a
						href="${pageContext.request.contextPath}/UserReport?userId=${UserAccount.id}"
						class="btn btn-secondary">신고하기</a>  >

				</div>
			</div>

		</div>
	</section>


	<jsp:include page="_gallery.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js""></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</body>
</html>