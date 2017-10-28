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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>


	<div
		style="width: 60%; margin-top: 10px; height: 80%; margin: 60px auto 0;">

		<div
			style="width: 100%; text-align: center; height: 60px; border: 1px solid #dbdbdb; display: table;">
			<div style="display: table-cell; vertical-align: middle;">

				<a href="javascript:void(0);" onclick="javascript:userReport();"><span
					style="margin-right: 10%; text-decoration: none;">신고된 사용자</span></a> <a
					href="javascript:void(0);" onclick="javascript:userBlock();"><span
					style="margin-right: 10%; text-decoration: none;">차단된 사용자</span></a>
			</div>
		</div>

		<div id="block_check"
			style="padding-top: 7%; border: 1px solid #dbdbdb;"></div>
	</div>
</body>
</html>


<script>
	$(document).ready(function() {
		$.get("${pageContext.request.contextPath}/userReport", {

		}, function(data) {

			$('#block_check').html(data);

		});
	});

	function userReport() {

		$.get("${pageContext.request.contextPath}/userReport", {

		}, function(data) {

			$('#block_check').html(data);

		});
	}

	function userBlock() {

		$.get("${pageContext.request.contextPath}/userBlock", {

		}, function(data) {

			$('#block_check').html(data);

		});
	}
</script>






