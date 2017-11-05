<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
               <img alt="Responsive image" src="image/signin.png"
                  class="img-thumbnail">
            </div>
            <div class="col-sm-8">
               <h3></h3>

              <br/> 
               <br/>
               <div>${loginedUser.id}</div> 
              <div>${loginedUser.name}</div>
             

               <p>
                  <a href="#" class="btn btn-primary">프로필 설정</a>
               </p>

            </div>
         </div>

      </div>
   </section>


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