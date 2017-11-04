<%@ page language="java" contentType="text/html; charset = UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>jQuery Event</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div class="container">
		<header class="header clearfix">
			<nav>
				<ul class="nav nav-pills float-right">
					<li class="nav-item"><a class="nav-link active" id=save>Save
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Reset</a></li>
				</ul>
			</nav>

		</header>

		<main role="main">

		<div class="jumbotron">

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
			<script>
				function getThumbnailPrivew(html, $target) {
					if (html.files && html.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$target.css('display', '');

							$target
									.html('<img style="height: 500px; width: auto;" src="' + e.target.result + '" border="0" alt="" />');
						}
						reader.readAsDataURL(html.files[0]);
					}
				}

				$('#save').click(function() {

					var input = document.createElement('input');
					input.type = 'hidden';
					input.name = "flag";
					input.value = "image";

					$('#form').append(input);
					$('#form').submit();

				});
			</script>


			<form name="form" id="form"
				action="${pageContext.request.contextPath}/UploadBoardPost"
				method="post" enctype="multipart/form-data" autocomplete="off">
				<div class="row">
					<div class="col-sm-4">
						<div class="filebox">
							<!-- 					<label for="cma_file">upload</label>  -->
							<input type="file" name="upfile" id="upfile" accept="image/*"
								capture="camera"
								onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br />
							<br />
							<div id="cma_image"
								style="width: 100%; max-width: 100%; display: none;"></div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="input-group">
							<span class="input-group-addon">Tag</span> <select name="tag"
								class="form-control" id="sel1">
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
						<textarea
							style="overflow: scroll x-hidden; width: 600px; height: 100px"
							name="content" id="context_id"></textarea>
					</div>
				</div>
			</form>
		</div>



		</main>


		<footer class="footer">
			<p>&copy; Company 2017</p>
		</footer>

	</div>
	<jsp:include page="_footer.jsp"></jsp:include>

<script>

</script>
</body>
</html>