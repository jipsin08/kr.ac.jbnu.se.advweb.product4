<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="_header.jsp"></jsp:include>
<html>
<head>
<script
	src="h1ttps://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="source/css/show.css" type="showContent/css">
<script>
	$(document).ready(function() {
		$("insert_reply").on('submit', function() {
			$.post('${pageContext.request.contextPath}/showContent', {
				reply : $("#insertReply").val()
			});
		});
	})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div>
				<h1>${content.user_id}</h1>
			</div>
			<div>
				<div class=container>
					<div class="col-lg-7">
						<img align="middle" alt="hi" src="${content.path}">
					</div>
					<div style="margin-top: 180px" class="panel">
						<label style="font-size: 1.5em">${content.content}</label>
					</div>
				</div>
			</div>
			<div>
				<div class="panel panel-default widget">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-comment"></span>
						<h3 class="panel-title">Reply</h3>
					</div>
					<div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item" style="overflow: x-hidden">
								<div class="row">
									<div class="col-xs col-md">
										<div>
											<table>
												<c:forEach items="${replyList}" var="replies">
													<tr>
														<td>~ ${replies.reply}</td>
													</tr>
												</c:forEach>
											</table>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="col">
						<div class="panel-body">
							<form method="POST">
								<fieldset>
									<div class="form-group">
										<input type="text" id="insertReply" name="reply"
											value="${reply}">
									</div>
									<a href=""> <img align="right" alt="like"
										style="width: 25px; height: 25px" src="image/like.jpg">
									</a>
									<button type="submit" class="[ btn btn-success ]"
										data-loading-text="Loading...">Post reply</button>
									<a href="${pageContext.request.contextPath}/home" class="btn">Close</a>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>