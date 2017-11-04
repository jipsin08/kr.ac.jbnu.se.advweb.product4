<%@ page language="java" contentType="text/html; charset=UTF-8"
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

	<c:choose>

		<c:when test="${list.type=='friend'}">
			<div style="font-size: 5px">
				${list.sender}님이 친구신청을 하였습니다

				<c:if test="${list.friend_check==1}">
					<a
						href="${pageContext.request.contextPath}/FriendRequestConfirm?sender=${list.sender}&receiver=${loginedUser.id}">수락하기</a>
				</c:if>


			</div>
		</c:when>


		<c:when test="${list.type=='like'}">
			<div>${list.sender}님이${list.content_id}번쨰게시물을좋아합니다.</div>
		</c:when>


		<c:when test="${list.type=='newcontent'}">
			<div>${list.sender}님이새로운글을올렸습니다.</div>
		</c:when>
	</c:choose>

</c:forEach>