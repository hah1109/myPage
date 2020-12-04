<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("div.boardPaging-selectbox > ul").on("click", ".init", function() {
		    $(this).closest("div.boardPaging-selectbox > ul").children('li:not(.init)').slideToggle();
		    if($('.selectbox-option').hasClass('opened')){
		    	$('.selectbox-options').removeClass('opened');
		    }else{
		    	$('.selectbox-options').addClass('opened');
		    }
		});
		
		var allOptions = $("div.boardPaging-selectbox > ul").children('li:not(.init)');
		$("div.boardPaging-selectbox > ul").on("click", "li:not(.init)", function() {
		    allOptions.removeClass('selected');
		    $(this).addClass('selected');
		    $("div.boardPaging-selectbox > ul").children('.init').html($(this).html());
		    allOptions.slideUp();
		});

	});
</script>
<div class="page-main-style">
	<h2>자유 게시판 목록</h2>
	<form action="list.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
						<option value="title">제목</option>
						<option value="id">ID</option>
						<option value="content">내용</option>
						<option value="all">전체</option>
				</select>
			</li>
			<li><input type="text" name="keyword" id="keyword"></li>
			<li><input type="submit" value="찾기" style="width:60px;"> 
			<input type="button" value="목록" onclick="location.href='list.do'" style="width:60px;">
			</li>
		</ul>
	</form>
	<div class="align-right">
		<c:if test="${empty user}">
			<input type="button" value="글쓰기" onclick="location.href='write.do'" disabled="disabled">
		</c:if>
		<c:if test="${!empty user}">
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
		</c:if>
	</div>

	<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table class="table_freeboard">
			<tr>
				<th></th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>최근수정일</th>
				
				<th>조회수</th>
			</tr>
			<c:forEach var="boardFree" items="${list}">
				<tr>
					<td><img src="${pageContext.request.contextPath}/resources/images/board/dot.png" style="width:5px; position:relative; left:6px;"></td>
					
					<td style="text-align:left;">
					
						<c:if test="${boardFree.commentNum>0}">
							<c:if test="${empty boardFree.free_filename}">	
								<a href="detail.do?free_num=${boardFree.free_num}">${boardFree.free_title} <b>[${boardFree.commentNum}]</b></a>
							</c:if>
							<c:if test="${!empty boardFree.free_filename}">
								<a href="detail.do?free_num=${boardFree.free_num}">
									${boardFree.free_title} 
									<img src="${pageContext.request.contextPath}/resources/images/board/clip.png" style="width:12px;">
									<b>[${boardFree.commentNum}]</b>
								</a>
							</c:if>
						</c:if>
						
						<c:if test="${boardFree.commentNum==0}">
							<c:if test="${empty boardFree.free_filename}">	
								<a href="detail.do?free_num=${boardFree.free_num}">${boardFree.free_title}</a>
							</c:if>
							<c:if test="${!empty boardFree.free_filename}">
								<a href="detail.do?free_num=${boardFree.free_num}">
									${boardFree.free_title}
									<img src="${pageContext.request.contextPath}/resources/images/board/clip.png" style="width:12px;">
								</a>
							</c:if>
						</c:if>
						
					</td>
					
					<td>${boardFree.mem_id}</td>
					<td>${boardFree.free_modify_date}</td>
					<td>${boardFree.free_hit}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="boardListBelowPart">
			<div class="align-center">${pagingHtml}</div>
			<div class="boardPaging-selectbox">
				<ul class="selectbox-options">
				    <li class="init">${rowCount}개씩 보기</li>
				    <li><a href="list.do?keyfield=${keyfield}&keyword=${keyword}&pageNum=${pageNum}&rowCount=10">10개씩 보기</a></li>
				    <li><a href="list.do?keyfield=${keyfield}&keyword=${keyword}&pageNum=${pageNum}&rowCount=20">20개씩 보기</a></li>
				    <li><a href="list.do?keyfield=${keyfield}&keyword=${keyword}&pageNum=${pageNum}&rowCount=30">30개씩 보기</a></li>
				    <li><a href="list.do?keyfield=${keyfield}&keyword=${keyword}&pageNum=${pageNum}&rowCount=50">50개씩 보기</a></li>
				</ul>
			</div>
		</div>
	</c:if>
</div>

<!-- https://jsfiddle.net/amitabhaghosh197/f69o462r/ -->