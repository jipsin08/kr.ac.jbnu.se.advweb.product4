<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

<div style="width: 100%; display: table; border-bottom: 1px solid #aaa;">
	<div style="width: 80%; margin: 0 auto;">
		<c:forEach items="${User}" var="user">
			<div style="float: left; width: 80%">
				<img src="image/instalogo.png"
					style="width: 40px; height: 40px; vertical-align: middle; margin-right: 10%; margin-left: 30%; margin-bottom: 2%; margin-top: 2%;">${user.id}
				

				<c:if test="${user.flag == 1}">
					<a
						href="${pageContext.request.contextPath}/userBlockConfirm?userId=${user.id}"><img
						src="image/userblock.png"
						style="width: 40px; height: 40px; margin-bottom: 2%; margin-top: 2%;"></a>
				</c:if>

			</div>
		</c:forEach>


	</div>

</div>