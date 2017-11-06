
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
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
					<h3>Hello: ${loginedUser.id}</h3>

					User Name: <b>${loginedUser.name}</b> <br /> <br /> <a
						href="javascript:void(0);" onclick="javascript:showUserInfo();">Show
						More</a>
					<div id="additioalUserInfo"></div>
					<a href="${pageContext.request.contextPath}/modifyuserinfo"class="btn btn-primary"  >프로필 수정</a> 
					<a href="${pageContext.request.contextPath}/upLoadContents" class="btn btn-secondary">UpLoad</a>
					

				</div>
			</div>

		</div>
	</section>


	<div class="album text-muted">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> VideoURL_ex
						</span>
						<iframe width="auto" height="280"
							src="https://www.youtube.com/embed/r5e_Kfis508" frameborder="0"
							allowfullscreen></iframe>

					</div>
					<p></p>
				</div>

				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> URL_ex </span> <img
							alt="Responsive image"
							src="https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-1/p160x160/16830719_997583997040323_2984424931716727767_n.jpg?oh=b34872f25dfa3d2f123becc64eaae59b&oe=5AA2B350" />
						<!-- 						<span style="font-weight: bold; color: black;"> URL_ex </span> <img -->
						<!-- 							alt="Responsive image" -->
						<!-- 							src="https://img.wikinut.com/img/gycf69_-6rv_5fol/jpeg/0/Best-Friends-Img-Src%3AImage%3A-FreeDigitalPhotos.net.jpeg" -->
						<!-- 							style="height: 280px; width: auto;" class="img-thumbnail"> -->
					</div>
					<p></p>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> Video_ex </span>
						<video controls height="280" src="video/bandicam.mp4" width="auto"
							controls="controls"></video>

					</div>
					<p></p>
				</div>



				<c:forEach items="${ContentInfo}" var="content">
					<div class=" col-sm-4">
						<div class="card">
							<span style="font-weight: bold; color: black;">${content.name}</span>
							<img alt="Responsive image" src="${content.contentImage}"
								style="height: 280px; width: auto;" class="img-thumbnail">
						</div>
						<p></p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
</body>
</html>