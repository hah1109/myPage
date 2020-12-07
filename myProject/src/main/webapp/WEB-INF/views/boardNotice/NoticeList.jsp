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
	
function updateCheck_date(board_num,writer_memnum){
	$.ajax({
		url:'update_checkdate.do',
		type:'post',
		data:{'board_num':board_num,
		      'writer_memnum':writer_memnum},
		cache:false,
		timeout:30000,
		success:function(data){
			$('#confirmcheck' + notice_num).addClass('confirmed');
		},
		error:function(){
			alert('알림 확인 오류');
		}		
	});
}
</script>
<div class="page-main-style">
	<h2>알림 목록</h2>

	<c:if test="${count == 0}">
		<div class="align-center">등록된 알림 없습니다.</div>
	</c:if>
	
	<c:if test="${count > 0}">
		<table class="table_notice">
			<tr>
				<th width="370">알림</th>
				<th width="270">내용</th>
				<th>알림일</th>
				<th>확인</th>
			</tr>
			<c:forEach var="Notice" items="${list}">
				<tr>
					<td style="text-align:left;">
						${Notice.mem_id}님이
						${Notice.notice_comment}
					</td>
					<td>
						${Notice.board_comment}
					</td>
					<td>${Notice.reg_date}</td>
					<td>
						<a onclick="updateCheck_date(${Notice.board_num},${Notice.writer_memnum});" id="confirmcheck + ${Notice.notice_num}">[확인]</a>
						<br>
						<c:if test="${Notice.return_url != '0'}">
							<a href="${pageContext.request.contextPath}/${Notice.return_url}"
								onclick="updateCheck_date(${Notice.board_num},${Notice.writer_memnum})">[이동]</a>
						</c:if>
					</td>
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
