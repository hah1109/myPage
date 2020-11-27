<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-main-style">
	<h2>${hwBoardVO.hw_title}</h2>
	<ul>
		<li>번호 : ${hwBoardVO.hw_num}</li>
		<li>제목 : ${hwBoardVO.hw_title}</li>
		<li>소모 칼로리 : ${hwBoardVO.hw_kcal}</li>
	</ul>
	<hr size="1" width="100%">
	<div class="align-center">
		<iframe width="800" height="500"
			src="https://www.youtube.com/embed/${hwBoardVO.hw_link}" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		<%--수정 삭제의 경우는 로그인이 되어있고 로그인한 회원번호와 작성자 회원번호가
	               일치해야 함 --%>
		<c:if test="${user.mem_auth == 1}">
			<input type="button" value="수정"
				onclick="location.href='hwBoardUpdate.do?hw_num=${hwBoardVO.hw_num}'">
			<input type="button" value="삭제" id="delete_btn">
			<script>
			var delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				var choice = window.confirm('삭제하시겠습니까?');
				if(choice){
					location.href='hwBoardDelete.do?hw_num=${hwBoardVO.hw_num}';
				}
			};
		</script>
		</c:if> 
		<input type="button" value="목록" onclick="location.href='hwList.do'">
	</div>
</div>







