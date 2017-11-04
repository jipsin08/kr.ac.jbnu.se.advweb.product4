<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>


<div
	style="width: 100%; height: 70px; display: table; border-bottom: 1px solid #E6E6E6;">
	<div style="display: table-cell; vertical-align: middle;">
		<div class="row">

			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/home"> <img
					src="image/instalogo.png"
					style="width: 40px; height: 40px; margin-left: auto; margin-right: auto; display: block;"></a>
			</div>


			<div class="col-md-4">

				<input type="text" id="search" name="search" size="40"
					placeholder="search" style="margin-top: 5px;">
				<div id="userSearch"
					style="width: 67%; background-color: #F2F2F2; display: none; OVERFLOW-Y: auto; height: 150px; position: absolute; z-index: 2; border-radius: 3%">
				</div>
			</div>





			<div class="col-md-3">



				<c:choose>


					<c:when test="${not empty loginedManager}">

						<a href="${pageContext.request.contextPath}/userManage"> <span
							style="margin: 0 10px;"> <img src="image/userManage.png"
								style="width: 25px; height: 25px; margin-top: 4px">
						</span></a>

						<a
							href="${pageContext.request.contextPath}/userLogout?type=manager">
							<span style="margin: 0 10px;"> <img
								src="image/logoutlogo.png"
								style="width: 30px; height: 25px; margin-top: 4px">
						</span>
						</a>


					</c:when>

					<c:when test="${not empty loginedUser}">

						<a
							href="${pageContext.request.contextPath}/myPage?myId=${loginedUser.id}">
							<span style="margin: 0 10px;"> <img
								src="image/userinfologo.png"
								style="width: 25px; height: 25px; margin-top: 4px">
						</span>
						</a>
						<a href="javascript:void(0);" onclick="javascript:noti();"><span
							style="margin: 0 10px;"> <img src="image/alarmlogo.png"
								style="width: 25px; height: 25px; margin-top: 4px">
						</span></a>

						<a href="${pageContext.request.contextPath}/userLogout?type=user">
							<span style="margin: 0 10px;"> <img
								src="image/logoutlogo.png"
								style="width: 30px; height: 25px; margin-top: 4px">
						</span>
						</a>

					</c:when>
				</c:choose>

				<div id="notificationInfo"
					style="width: 100%; background-color: #F2F2F2; display: none; OVERFLOW-Y: auto; height: 150px; position: absolute; z-index: 2; border-radius: 3%">
				</div>

			</div>
			<c:if test="${not empty loginedUser}">
				<div class="col-md-3">${loginedUser.id}님이로그인했습니다.</div>
			</c:if>


		</div>

	</div>
</div>





<%-- <% out.println(request.getRealPath("/login")); %> --%>


<script>
	document.querySelector('#search').addEventListener('input', function(e) {

		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if (check.test($('#search').val())) {
			// 지현이 view 완성되면 여기 추가
		}

		// 		$.get("${pageContext.request.contextPath}/UserSearchServlet?test="+"${loginedUser.id}", {
		$.get("${pageContext.request.contextPath}/UserSearchServlet", {
			userId : $('#search').val()
		}, function(data) {
			$('#userSearch').html(data);
			$('#userSearch').show();

		});
	});

	$('body').click(function(evt) {
		if (!$(evt.target).is('#userSearch')) {
			$('#userSearch').hide();
		}
	});

	var notiView;

	(function() {

		poll = function() {

		},

		pollInterval = setInterval(function() {

			$.get("${pageContext.request.contextPath}/notification?userId="
					+ "${loginedUser.id}", {

			}, function(data) {

				notiView = data;

			});
		}

		, 2000)
	})();

	function noti() {

		$('#notificationInfo').html(notiView);
        $('#notificationInfo').show();

	}

	$('body').click(function(evt) {
		if (!$(evt.target).is('#notificationInfo')) {
			$('#notificationInfo').hide();
		}
	});
</script>