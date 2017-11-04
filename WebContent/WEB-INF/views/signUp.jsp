<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="bootstrap.min.css" rel="stylesheet">
<link href="bootstrap.min.js" rel="javascript">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>회원 가입</title>

<style>
#imagePreview > img {
  height: 200px;
  width: 200px;
}
</style>
</head>
<body>


 <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입</h1>
        </div>
        <form class="form-horizontal" method="POST" id= "signupform"action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data" >
        <div class="form-group">
            <label class="col-sm-3 control-label" for="name">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="name" type="text" name="upname" placeholder="이름">
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="id">아이디</label>
          <div class="col-sm-6">
            <input class="form-control" id="id" type="text" name="upid" placeholder="아이디">
          </div>
          <span class="input-group-btn">
            <button type="button" class="btn btn-default" id=idChkBtn>중복 확인<i class="fa fa-mail-forward spaceLeft"></i></button>
        </span>
        </div>
       
        <div class="form-group">
          <label class="col-sm-3 control-label" for="password">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="password" type="password" name="uppassword" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="passwordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="passwordCheck" type="password"  placeholder="비밀번호 확인">
                <div class="help-block" id=pwmsg></div>
             </div>
             <span class="input-group-btn">
                    <button type="button" class="btn btn-success" id=passwordChkBtn>비밀번호 확인<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
          </div>
          
        <div class = "form-group"  >
        	<label class="col-sm-3 control-label" for="profileImage">프로필 사진 등록</label>
        	 <div class="col-sm-6">
  				<input class="form-control" id="profileImage" type="file" accept="image/*" name="upfile" capture="camera" onchange="getPrivew(this,$('#imagePreview'))" ><br/>
  			<br/>
  			  <div id="imagePreview" style="width:100%;max-width:100%;display:none;"></div>
		</div>
		</div>
		
        <div class="form-group">
          <label class="col-sm-3 control-label" for="email">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="email" type="email" name="upemail" placeholder="이메일">
        </div>
        </div>
     
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" id ="signUpBtn"type="submit">회원가입<i class="fa fa-check spaceLeft" ></i></button>
            <button class="btn btn-danger" type="submit">돌아가기<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
  
   <script>
   $(document).ready(function(){
	   
	   var idchk,pwchk =false;
	   
   $('#idChkBtn').click(function(){
	   if($('#id').val().length == 0){
		   alert('아이디를 입력해주세요.');
		   return false;
	   }
	   else{
		   var getId = $('#id').val();
       $.ajax({
           type:'GET',
           url: 'idcheck?id='+getId,
           success: function(data){
            	   if(data ==="false"){
                   alert('이미 존재하는 아이디 입니다.');
                   return false;
               }
               	else {
             	  alert(getId+'는 사용가능한 아이디 입니다.');
             	 idchk = true;
               }
           }		
       }); 
	   }
   });
  
   
   $("#signUpBtn").click(function(){ 
       var reg_id = /^[a-z0-9_-]{4,12}$/; 
       var reg_name = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}/;
       var reg_pw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
       var reg_email = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

       if(!reg_name.test($('#name').val())){
          alert('이름은 한글 최소 2글자 이상 입력해주세요.');
          return false;
       }
       else if(!reg_id.test($("#id").val())){ 
           alert("아이디는 4-15자 이여야 하며 \n" 
                   +"., '-', '_'를 제외한 문자는 사용할 수 없습니다.");
           return false;
			} 
	   else if(!reg_pw.test($("#password").val())){ 
  		 alert('비밀번호 형식이 잘못되었습니다.\n' 
  	    	 +'(영문,숫자를 혼합하여 8~20자 이내)'); 
  		return false;
			 } 
	   else if(!reg_email.test($("#email").val())){ 
 		  alert('잘못된 이메일 형식입니다.'); 
 		 return false;
			 } 
	   else if(idchk === false){
		   alert("아이디 중복확인을 해주세요.");
		   return false;
	   }
	   else if(pwchk === false){
		   alert("비밀번호 확인을 해주세요.");
		   return false;
	   }
       
       var input = document.createElement('input');
       input.type = 'hidden';
       input.name = "flag";
       input.value = "signUp";
       
       
       $('#signupform').append(input);
       $('#signupform').submit();
       alert('회원가입이 완료되었습니다.\n' + ('로그인 화면으로 넘어갑니다.'));
		
}); 
	
	  $('#passwordChkBtn').click(function(){
		  if($('#password').val()==0){
			 alert('비밀번호를 입력해주세요.');
			 return false;
		  }
		  else if($('#passwordCheck').val() == 0){
			 alert('비밀번호 확인을 입력해주세요');
		  }
		  else  if($('#password').val() != $('#passwordCheck').val()){
	  		$('#pwmsg').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
	  	 }else{
	  		$('#pwmsg').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
	  		pwchk = true;
	  	 }	
	  });
   });
   
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
   </script>
</body>
</html>