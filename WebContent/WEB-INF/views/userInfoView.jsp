<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>
<style>
#imagePreview > img {
  height: 200px;
  width: 200px;
}
</style>
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

	<jsp:include page="_menu.jsp"></jsp:include>


	<section class="jumbotron text-center">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<img alt="Responsive image" src="image/mango.jpg"
						class="img-thumbnail">
				</div>
				<div class="col-sm-8">
					<h3>Hello: ${user.userName}</h3>

					User Name: <b>${user.userName}</b> <br /> Gender: ${user.gender }
					<br /> <a href="javascript:void(0);"
						onclick="javascript:showUserInfo();">Show More</a>
					<div id="additioalUserInfo"></div>

					<p>
						<a href="#" class="btn btn-primary">add friend</a> 
						<button class="btn btn-primary" data-toggle="modal" data-target="#userInfoModify" >modify</button> 
						<a href="#"
							class="btn btn-secondary">Report</a>
					</p>

				</div>
			</div>

		</div>
	</section>
	
	<!-- Modal -->
<div class="modal fade" id="userInfoModify" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="userInfoModify">회원 정보 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <form class="form-horizontal" method="POST" id="modifyform"action="${pageContext.request.contextPath}/modifyuserinfo" enctype="multipart/form-data" >
        <div>
            <label  for="name">이름</label>
          <div>
            <input class="form-control" id="name" type="text" name="upname" placeholder="이름">
          </div>
        </div>
        <div>
          <label for="password">비밀번호</label>
        <div>
          <input class="form-control" id="password" type="password" name="uppassword" placeholder="비밀번호">
        <p style="color:gray; font-size: 14px;">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div>
              <label for="passwordCheck">비밀번호 확인</label>
             <div>
              <input class="form-control" id="passwordCheck" type="password"  placeholder="비밀번호 확인">
                <div class="help-block" id=pwmsg></div>
             </div>
             <span>
                 <button type="button" class="btn btn-primary btn-sm " id=passwordChkBtn>비밀번호 확인</button>
             </span>
          </div>
          <div class="form-group">
          <label for="email">이메일</label>
        <div>
          <input class="form-control" id="email" type="email" name="upemail" placeholder="이메일">
        </div>
        </div>
        
        <div >
        	<label for="profileImage">프로필 사진 수정</label>
        	 <div>
  				<input class="form-control" id="profileImage" type="file" accept="image/*" name="upfile" capture="camera" onchange="getPrivew(this,$('#imagePreview'))" ><br/>
  			<br/>
  			  <div id="imagePreview" style="width:100%;max-width:100%;display:none;"></div>
		</div>
		</div>
        </form>
          <hr>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
      </div>
    </div>
  </div>
</div>

<script>

function getPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.html('<img src="' + e.target.result + '" border="0" alt="" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
}

$('#passwordChkBtn').click(function(){
	  if($('#password').val()==0){
		 alert('비밀번호를 입력해주세요.');
		 return false;
	  }
	  else if($('#passwordCheck').val() == 0){
		 alert('비밀번호 확인을 입력해주세요');
	  }
	  else  if($('#password').val() != $('#passwordCheck').val()){
		$('#pwmsg').html('<p style="color:red ;font-size:14px">비밀번호가 일치하지 않습니다.</p>');
	 }else{
		$('#pwmsg').html('<p style="color:blue; font-size:14px">비밀번호가 일치합니다.</p>');
	 }	
});

$('#modifyBtn').click(function(){
	
	var input = document.createElement('input');
    input.type = 'hidden';
    input.name = "flag";
    input.value = "modifyInfo";
    
    
    $('#modifyform').append(input);
    $('#modifyform').submit();
    alert('정상적으로 회원정보 수정이 완료되었습니다.');
	
	
});

</script>
	

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