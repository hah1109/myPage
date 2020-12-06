<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
table{
	width:50%;
	margin:5px auto;
	border:1px solid #000;
	border-collapse:collapse;
	text-align:center;
}
table td, table th{
	border:1px solid #000;
	padding:5px;
}
</style>

	<c:if test="${count == 0}">
		<div>요청받은 트레이너 매칭 신청내역이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table>
			<tr>
				<th>신청인</th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><a href="#">${list.mat_from}</a></td>
					<td><a href="#">수락</a></td>
					<td><a href="#">거절</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
		
<div>
	<div id="paging" class="align-center">${pagingHtml}</div>
</div>