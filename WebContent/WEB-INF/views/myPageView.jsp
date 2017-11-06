
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
					<a href="#" class="btn btn-primary">프로필 설정</a> <a href="#"
						class="btn btn-secondary" data-toggle="modal"
						data-target="#exampleModal">UpLoad</a>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Image
										UpLoad</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form name="form" id="form"
										action="${pageContext.request.contextPath}/UploadBoardPost"
										method="post" enctype="multipart/form-data" autocomplete="off">
										<div class="row">
											<div class="col-sm-6">
												<div class="filebox">
													<input type="file" name="upfile" id="upfile"
														accept="image/*" capture="camera"
														onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br />
													<br />
													<div id="cma_image"
														style="width: 100%; max-width: 100%; display: none;"></div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="input-group">
													<span class="input-group-addon">Tag</span> <select
														name="tag" class="form-control" id="sel1">
														<option value="" disabled selected>Tag 선택</option>
														<option value="Food">Food</option>
														<option value="People">People</option>
														<option value="Fashion">Fashion</option>
														<option value="Background">Background</option>
														<option value="Daily">Daily</option>
													</select>
												</div>


											</div>
										</div>
										<div class="form-group-row">
											<div class="col-lg">
												<textarea style="overflow: scroll x-hidden; width: 400px;"
													name="content" id="context_id"></textarea>
											</div>
										</div>
									</form>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id=save>Save</button>
									<script
										src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
										integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
										crossorigin="anonymous"></script>
									</script>
									<script>
										function getThumbnailPrivew(html,
												$target) {
											if (html.files && html.files[0]) {
												var reader = new FileReader();
												reader.onload = function(e) {
													$target.css('display', '');
													$target
															.html('<img style="height: 500px; width: auto;" src="' + e.target.result + '" border="0" alt="" />');
												}
												reader
														.readAsDataURL(html.files[0]);
											}
										}

										$('#save')
												.click(
														function() {
															var input = document
																	.createElement('input');
															input.type = 'hidden';
															input.name = "flag";
															input.value = "image";

															$('#form').append(
																	input);
															$('#form').submit();
														});
									</script>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>
	<div class="album text-muted">
		<div class="container">
			<div class="row">
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

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>
</body>
</html>