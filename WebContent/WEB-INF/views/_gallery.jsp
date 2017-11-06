<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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



				<c:forEach items="${content}" var="content">
					<div class=" col-sm-4">
						<div class="card">
							<span style="font-weight: bold; color: black;">${content.user_id}</span>
							<img alt="Responsive image" src="${content.path}"
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