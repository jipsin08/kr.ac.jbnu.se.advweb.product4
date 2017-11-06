<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="bootstrap.min.css" rel="stylesheet">
<link href="bootstrap.min.js" rel="javascript">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
#imagePreview>img {
	height: 200px;
	width: 200px;
}
</style>

<title>프로필 수정</title>
</head>

<body>
	<div class="col-md-12">
		<div class="page-header">
			<h1>프로필 수정</h1>
		</div>
		<form class="form-horizontal" method="POST" id="modifyform"
			action="${pageContext.request.contextPath}/modifyuserinfo"
			enctype="multipart/form-data">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="name">이름</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" type="text" name="name"
						placeholder="이름">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="password">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="password" type="password"
						name="password" placeholder="비밀번호">
					<p style="color: gray; font-size: 14px;">숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="passwordCheck">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="passwordCheck" type="password"
						placeholder="비밀번호 확인">
					<div class="help-block" id=pwmsg></div>
				</div>
				<span>
					<button type="button" class="btn btn-primary btn-sm "
						id=passwordChkBtn>비밀번호 확인</button>
				</span>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="email">이메일</label>
				<div class="col-sm-6">
					<input class="form-control" id="email" type="email" name="email"
						placeholder="이메일">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="profileImage">프로필
					사진 수정</label>
				<div class="col-sm-6">
					<input class="form-control" id="profileImage" type="file"
						accept="image/*" name="file" capture="camera"
						onchange="getPrivew(this,$('#imagePreview'))"><br /> <br />
					<div id="imagePreview"
						style="width: 100%; max-width: 100%; display: none;"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-info" id="modifyBtn" type="submit">
						수정하기<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="submit">
						돌아가기<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
		<hr>

	</div>

	<script>
		var pwchk = false;

		function getPrivew(html, $target) {
			if (html.files && html.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$target.css('display', '');
					$target
							.html('<img src="' + e.target.result + '" border="0" alt="" />');
				}
				reader.readAsDataURL(html.files[0]);
			}
		}

		$('#passwordChkBtn')
				.click(
						function() {
							if ($('#password').val() == 0) {
								alert('비밀번호를 입력해주세요.');
								return false;
							} else if ($('#passwordCheck').val() == 0) {
								alert('비밀번호 확인을 입력해주세요');
							} else if ($('#password').val() != $(
									'#passwordCheck').val()) {
								$('#pwmsg')
										.html(
												'<p style="color:red ;font-size:14px">비밀번호가 일치하지 않습니다.</p>');
							} else {
								$('#pwmsg')
										.html(
												'<p style="color:blue; font-size:14px">비밀번호가 일치합니다.</p>');
								pwchk = true;
							}
						});

		$('#modifyBtn')
				.click(
						function() {

							var reg_name = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}/;
							var reg_pw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
							var reg_email = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

							if (!reg_name.test($('#name').val())) {
								alert('이름은 한글 최소 2글자 이상 입력해주세요.');
								return false;
							} else if (!reg_pw.test($("#password").val())) {
								alert('비밀번호 형식이 잘못되었습니다.\n'
										+ '(영문,숫자를 혼합하여 8~20자 이내)');
								return false;
							} else if (!reg_email.test($("#email").val())) {
								alert('잘못된 이메일 형식입니다.');
								return false;
							} else if (pwchk === false) {
								alert("비밀번호 확인을 해주세요.");
								return false;
							}

							var input = document.createElement('input');
							input.type = 'hidden';
							input.name = "flag";
							input.value = "modifyInfo";

							$('#modifyform').append(input);
							$('#modifyform').submit();
							alert('정상적으로 프로필 수정이 완료되었습니다.');

						});
	</script>

</body>
</html>