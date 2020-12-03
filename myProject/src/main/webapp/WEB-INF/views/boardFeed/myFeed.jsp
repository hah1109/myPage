<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 홍아현  -->
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>   
<script>
</script>

<style>
table{
	width:80%;
	margin:5px auto;
	border:1px solid #000;
	border-collapse:collapse;
}
table td, table th{
	text-align:center;
	border:1px solid #000;
	padding:5px;
}
</style>



<div>
	<div>
		<input type="button" value="내 피드" onclick="location.href='${pageContext.request.contextPath}/boardFeed/myFeed.do'"/>
	</div>
	<c:if test="${mem_auth == 2}">
	<div>
		<input type="button" value="내 회원의 피드" onclick="location.href='${pageContext.request.contextPath}/boardFeed/myMembersFeed.do'"/>
	</div>
	</c:if>
	<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	
	
	<c:if test="${count > 0}">
	<div id="feedList">
		<table>
			<tr>
				<th>글번호</th>
				<th>글쓴이 아이디</th>
				<th>글 타입</th>
				<th>내용</th>
				<th>글 등록일</th>
				<th>파일</th>
				<th>파일이름</th>
				<th>아이피</th>
				<th>mem_num</th>
				<th>공개범위</th>
			</tr>
			<c:forEach var="feedVO" items="${list}">
				<tr>
					<td>${feedVO.feed_num}</td>
					<td>${feedVO.mem_id}</td>
					<td>${feedVO.feed_type}</td>
					<td>${feedVO.feed_content}</td>
					<td>${feedVO.feed_reg_date}</td>
					<td>${feedVO.feed_file}</td>
					<td>${feedVO.feed_filename}</td>
					<td>${feedVO.feed_ip}</td>
					<td>${feedVO.mem_num}</td>
					<td>${feedVO.feed_auth}</td>
				</tr>
			</c:forEach>
		</table>
		<div id="paging" style="text-align:center; margin:30px;">${pagingHtml}</div>
	</div>
	</c:if>
	
	

	

</div>