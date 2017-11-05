<%@ page language="java" contentType="text/html; charset = UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<c:forEach items="${result}" var="list">
	<div style="margin-left: 10px">
		<span> <img src="image/userinfologo.png" class="rounded"
			style="width: 25px; height: 25px; margin-top: 4px"></span> 
			<a href="${pageContext.request.contextPath}/userInfo?sender=${loginedUser.id}&receiver=${list.id}"><span>${list.id}</span></a>
	</div>

</c:forEach>