<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>



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


					<section class="jumbotron text-center">
						<div class="container">
							<div class="row">
								<div class="col-sm-4">
									<img alt="Responsive image" src="image/signin.png"
										class="img-thumbnail">
								</div>
								<div class="col-sm-8">
									<h3></h3>

									User Name: <b></b> <br /> <br />
									${notificationInfo.friend_check}
									<c:choose>

										<c:when test="${notificationInfo.friend_check == null}">
											<a
												href="${pageContext.request.contextPath}/FriendRequest?me=${loginedUser.id}&you=${pageUserId}"
												class="btn btn-primary">친구맺기</a>
										</c:when>

										<c:when test="${notificationInfo.friend_check == 1}">
											<a
												href="${pageContext.request.contextPath}/FriendRequest?me=${loginedUser.id}&you=${pageUserId}"
												class="btn btn-primary">친구요청보냄</a>
										</c:when>


										

									</c:choose>

									<a href="#" class="btn btn-secondary">Report</a> <a href="#"
										class="btn btn-secondary">test 친구맺기 승인</a>


								</div>
							</div>

						</div>
					</section>



					<jsp:include page="_gallery.jsp"></jsp:include>
					<jsp:include page="_footer.jsp"></jsp:include>

					<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
						integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
						crossorigin="anonymous"></script>
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
						integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
						crossorigin="anonymous"></script>
					<script
						src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
						integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
						crossorigin="anonymous"></script>
</body>
</html>