<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
	
</script>


<div
	style="width: 100%; height: 70px; display: table; border-bottom: 1px solid #E6E6E6;">
	<div style="display: table-cell; vertical-align: middle;">


		<div style="width: 20%; float: left">
			<a href="${pageContext.request.contextPath}/"> <img
				src="images/instalogo.png"
				style="width: 40px; height: 40px; margin-left: auto; margin-right: auto; display: block;"></a>
		</div>


		<div style="float: left; width: 45%; padding-right: 15%">
			<div style="vertical-align: center;">
				<input type="text" class="form-control" id="search" name="search" d>
			</div>
			<div id="userSearch"
				style="width: 409px; background-color: #F2F2F2; display: none; OVERFLOW-Y: auto; height: 150px; position: absolute; z-index: 2; border-radius: 3%"></div>
		</div>



		<div style="width: 17.5%; float: left;">
			<a href="#"> <span style="margin: 0 10px;"> <img
					src="images/userinfologo.png"
					style="width: 25px; height: 25px; margin-top: 4px">
			</span></a> <a href="#"><span style="margin: 0 10px;"> <img
					src="images/alarmlogo.png"
					style="width: 25px; height: 25px; margin-top: 4px">
			</span></a>

			<c:choose>
				<c:when test="${empty loginedUser}">
					<a href="#"> <span style="margin: 0 10px;"> <img
							src="images/signin.png"
							style="width: 30px; height: 25px; margin-top: 4px">
					</span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="#"> <span style="margin: 0 10px;"> <img
							src="images/logoutlogo.png"
							style="width: 30px; height: 25px; margin-top: 4px">
					</span>
					</a>

				</c:otherwise>
			</c:choose>
		</div>

		<div style="width: 17.5%; float: left; background: red;">이름과
			사진얼굴이 들어 갈 부분</div>

	</div>
</div>

<%-- <% out.println(request.getRealPath("/login")); %> --%>


<script>
	document.querySelector('#search').addEventListener('input', function(e) {

		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if (check.test($('#search').val())) {
			// 지현이 view 완성되면 여기 추가
		}

		$.get("${pageContext.request.contextPath}/UserSearchServlet", {
			userId : $('#search').val()
		}, function(data) {
			$('#userSearch').html(data);
			$('#userSearch').show();

		});
	});

	// 	$('#userSearch').blur(function() {
	// 		$('#userSearch').hide();
	// 	});

	$('body').click(function(evt) {
		if (!$(evt.target).is('#userSearch')) {
			$('#userSearch').hide();
		}
	});
</script>
