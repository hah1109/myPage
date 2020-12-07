<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_hwList.css">

<div class="page-main-style">
	<h2>게시판 목록</h2>
	
	<form action="hwList.do" id="search_form" method="get">
		<ul class="search">
			<li><select name="keyfield" id="keyfield">
					<option value="title">제목</option>
					<option value="part">부위</option>
					<option value="all">전체</option>
			</select>
			<input type="text" name="keyword" id="keyword">
			<input type="submit" value="찾기"> 
			<input type="button" value="전체 목록 보기" onclick="location.href='hwList.do'">
			</li>
		</ul>
	</form>
	
	<div class="align-right">
		<c:if test="${user.mem_auth == 1}"> <!-- 관리자 모드로 들어왔을 경우에 버튼 노출 mem_auth == 0(관리자) -->
		<input type="button" value="글쓰기" 
		       onclick="location.href='hwBoardWrite.do'">
		</c:if>
	</div>

	<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}"> 
		<c:forEach var="hwBoard" items="${list}">
				<div class="gallery-box-container">
					<a href="hwDetail.do?hw_num=${hwBoard.hw_num}" class="gallery-box">
						<span class="gallery-box__img-container">
							<img width="460" height="300" src="https://img.youtube.com/vi/${hwBoard.hw_link}/0.jpg">
						</span>
						<span class="gallery-box__text-wrapper">
							<span class="gallery-box__text">
								${hwBoard.hw_title}
							</span>
						</span>
					</a>
				</div>
		</c:forEach>
		<c:if test="${count == 1}"></c:if>
		<c:if test="${count > 1}"><div class="align-center">${pagingHtml}</div></c:if>
	</c:if>
	<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/c_5ENJWekbQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
</div>
