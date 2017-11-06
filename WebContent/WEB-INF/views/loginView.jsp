<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link href="signin.css" rel="stylesheet">

<script>
	$(document).ready(function() {

		$("#login_form_id").on('submit', function(e) {

			$.post('${pageContext.request.contextPath}/login', {
				userName : $("#name_id").val(),
				password : $("#pw_id").val(),
				rememberMe : $("#remember_id").val()
			}, function(data) {

				// move another page
				var win = window.open();
				win.document.write(data);
			});
		});
	})
</script>

</head>

<body>

	<div>

		<div class="container">
			<div class="row">
				<div class="col-xs-12 com-md-3">
					<img src="source/image/logo.png" alt="...">
				</div>
			</div>

			<form class="form-signin" name="Login" method="post">
				<p style="color: red;">${errorString}</p>
				<label for="inputID" class="col-sm-1 col-form-label">ID</label> <input
					type="text" name="ID" id="name_id" class="form-control"
					value="${user.userName}"> <label for="inputID"
					class="col-sm-1 col-form-label">PW</label> <input type="password"
					name="PW" id="pw_id" class="form-control" value="${user.password}">

				<div class="checkbox">
					<div clas="row">
						<input type="checkbox" class="col-sm" id="remember_id"
							name="remember" value="Y"> <label for="inputID"
							class="col-sm">아이디 저장</label>
					</div>
				</div>

				<button class="btn btn-lg btn-primary btn-block" type="submit"
					value="로그인">로그인</button>
				<button class="btn btn-lg btn-primary btn-block" type="submit"
					value="회원가입" onclick="location.href='../회원가입url삽입'">회원가입</button>

			</form>

		</div>

	</div>

	<script
		src="h1ttps://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script src="js/bootstrap.min.js"></script>
	<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

</body>
</html>
