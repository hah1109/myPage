<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<div class="page-main-style">
	<h3>자유 게시판</h3>
	<h2>${boardFree.free_title}</h2>
	<ul>
		<li>
			<b><font size="4">${boardFree.mem_id}</font></b>
			<c:if test="${boardFree.mem_auth==0}">
				관리자
			</c:if>
			<c:if test="${boardFree.mem_auth==1}">
				일반회원
			</c:if>
			<c:if test="${boardFree.mem_auth==2}">
				트레이너
			</c:if>
		</li>
		<li>
			최근수정일: ${boardFree.free_modify_date}
		</li>
		<li>
			조회수 : ${boardFree.free_hit}
		</li>		
	</ul>
	<hr size="1" width="100%">
	<c:if test="${!empty boardFree.free_filename}">
		<img src="imageView.do?free_num=${boardFree.free_num}"  style="max-width:500px; max-height:500px;">
	</c:if>
	<p>
		${boardFree.free_content}
	</p>
	
	<hr size="1" width="100%">
	
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num == boardFree.mem_num}">
			<input type="button" value="수정" onclick="location.href='modify.do?free_num=${boardFree.free_num}'">
			<input type="button" value="삭제" id="btn_delete">
		</c:if>
		<script>
			var btn_delete = document.getElementById('btn_delete');
			btn_delete.onclick=function(){
				var choice = window.confirm('삭제하시겠습니까?');
				if(choice){
					location.href='delete.do?free_num=${boardFree.free_num}';
				}
			};
		</script>
		<input type="button" value="목록으로" onclick="location.href='list.do'">	
	</div>
</div>