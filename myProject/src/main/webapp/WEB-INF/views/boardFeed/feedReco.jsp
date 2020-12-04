<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<style>
.write_Btn{
	width:50px;
	height:50px;
	background-image: url('../resources/images/Btn_write_board.png');
	border:none;
	border-radius: 25px;
} 
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_feedReco.css">
<div class="page-main-style">
	
	<c:if test="${count == 0}">
		<div class="masonry">
			<input type="button" class="write_Btn" value="" onclick="location.href='feedWrite.do'">
			<div class="grid">
				<img src="../resources/images/cameraImage.jpg">
				<div class="grid__body">
					<div class="relative">
						<a class="grid__link" target="_blank" href="/" ></a>
						<h1 class="grid__title">등록된 게시물이 <br>없습니다.</h1>
						<p class="grid__author">게시물을 등록해주세요</p>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${count > 0}">
		<div class="masonry">
		<input type="button" class="write_Btn" value="" onclick="location.href='feedWrite.do'">
		<c:forEach var="feed" items="${list}">
		  <div class="grid">
		  	<c:if test="${empty feed.feed_filename}"><img src="../resources/images/cameraImage.jpg"></c:if>
		    <c:if test="${!empty feed.feed_filename}"><img src="imageView.do?feed_num=${feed.feed_num}"></c:if>
		    <div class="grid__body">
		      <div class="relative">
		      								<!-- @@@@@@@@@@여기에 글상세 링크 넣기  @@@@@@@@@@@@-->
		        <a class="grid__link" target="_blank" href="feedDetail.do" ></a>
		        <h1 class="grid__title">
		        	<c:if test="${feed.feed_type == 1}"> 식단 </c:if>
		        	<c:if test="${feed.feed_type == 2}"> 운동 </c:if>
		        </h1>
		        						<!-- 등록일  -->
		        <p class="grid__author">작성일: ${feed.feed_reg_date}</p>
		        <p class="grid__author">글쓴이: ${feed.mem_id}</p>
		      </div>
		      <div class="mt-auto" >
		      							<!-- 작성 내용  -->
		        <span class="grid__tag">${feed.feed_content}</span>
		      </div>
		    </div>
		  </div>
		  </c:forEach>
		</div>
		<c:if test="${count == 1}"></c:if>
		<c:if test="${count > 1}"><div class="align-center">${pagingHtml}</div></c:if>		
	</c:if>
</div>