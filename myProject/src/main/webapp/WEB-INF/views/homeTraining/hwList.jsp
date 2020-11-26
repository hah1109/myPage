<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-main-style">
	<h2>게시판 목록</h2>
	<form action="hwList.do" id="search_form" method="get">
		<ul class="search">
			<li><select name="keyfield" id="keyfield">
					<option value="title">제목</option>
					<option value="part">부위</option>
					<option value="all">전체</option>
			</select></li>
			<li><input type="text" name="keyword" id="keyword"></li>
			<li><input type="submit" value="찾기"> <input
				type="button" value="목록" onclick="location.href='hwList.do'">
			</li>
		</ul>
	</form>
	
	<div class="align-right">
		<c:if test="${!empty user}">
		<input type="button" value="글쓰기" 
		       onclick="location.href='hwBoardWrite.do'">
		</c:if>
	</div>

	<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<div style="width:50%;float:left;">
			<table>
				<tr>
					<th width="400">제목</th>
					<th>영상</th>
				</tr>
				<c:forEach var="hwBoard" items="${list}">
					<c:if test="${hwBoard.hw_num % 2 == 0}"><!-- 짝수 번호 -->
						<tr>
							<td>${hwBoard.hw_title}</td>
							<td><a href="detail.do?hw_num=${hwBoard.hw_num}">${hwBoard.hw_link}</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<div style="width:50%;float:left;">
			<table>
				<tr>
					<th width="400">제목</th>
					<th>영상</th>
				</tr>
				<c:forEach var="hwBoard" items="${list}">
					<c:if test="${hwBoard.hw_num % 2 == 1}">
						<tr>
							<td>${hwBoard.hw_title}</td>
							<td>${hwBoard.hw_link}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
	<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/c_5ENJWekbQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
	<img width="560" height="315"
		src="https://img.youtube.com/vi/c_5ENJWekbQ/0.jpg" frameborder="0"
		allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
		allowfullscreen></img>
</div>