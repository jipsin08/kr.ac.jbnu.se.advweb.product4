<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>부트스트랩을 이용한 로그인 페이지</title>
	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
	</head>
<body>

	<div style="margin: 100px 0px 0px 400px">
		<form name="Login" method="post" action="LoginServlet2.jsp">
		
			<div class="row">
				<div class="col-xs-6 com-md-3">
					<img src="resource/image/logo.png" alt="...">				
				</div>
			</div>
	
			<div class="form-group-row">
				<label for="inputID" class="col-sm-1 col-form-label">ID</label>
				<div class="col-sm-11">
					<input type="text" style="width: 200px" class="form-control" name="ID" placeholder="ID"/>
				</div>
			</div>
	
			<div class="form-group-row">
				<label for="inputID" class="col-sm-1 col-form-label">PW</label>
				<div class="col-sm-11">
					<input type="password" style="width: 200px" class="form-control" name="PW" placeholder="PW"/>
				</div>
			</div>
			
			<div class="form-group-row">
				<input type="checkbox" class="col-sm" value="remember">
				<label class="col-sm">아이디 저장</label>
				<input type="submit" class="btn btn-info" value="로그인"/>
			</div>
			<!--회원가입 url삽입해야함-->
			<input type="button" class="btn btn-info" value="회원가입" onclick="location.href='../회원가입url삽입'"/>
		</form>
	</div>

	<script src="h1ttps://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>