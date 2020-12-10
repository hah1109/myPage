<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/a6055a8b9e.js" crossorigin="anonymous" ></script>

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
		
		// 알림리스트에서 이동 누를 시
		$('.check_move').click(function(){
			var notice_num = $(this).attr('notice_num');
			var board_num = $(this).attr('board_num');
			var writer_memnum = $(this).attr('writer_memnum');
			var return_url = $(this).attr('return_url');
			$.ajax({
				url:'update_checkdate.do',
				type:'post',
				data:{'board_num':board_num,
				      'writer_memnum':writer_memnum},
				cache:false,
				timeout:30000,
				success:function(data){
					location.href = '${pageContext.request.contextPath}/'+return_url;
				},
				error:function(){
					alert('알림 이동 오류');
				}		
			});
		});
		
		//알림리스트에서 확인 버튼 누를 시
		$('.confirmOneNotice').click(function(){
			var notice_num = $(this).attr('notice_num');
			$.ajax({
				url:'confirmOneNotice.do',
				type:'post',
				data:{'notice_num':notice_num},
				cache:false,
				timeout:30000,
				success:function(data){
					$('#confirmcheck' + notice_num).css('font-weight','normal').css('color','grey');
				},
				error:function(data){
					alert('알림 확인 오류 발생!');
				}
			});
		});
		
		//알림 전체 확인 버튼 누를 시
		$('#confirmAllNotice').click(function(){
			var writer_memnum = $(this).attr('writer_memnum');
			$.ajax({
				url:'confirmAll.do',
				type:'post',
				data:{'writer_memnum':writer_memnum},
				cache:false,
				timeout:30000,
				success:function(data){
					location.href='list.do';
				},
				error:function(){
					alert("알림 전체 확인 오류!");
				}
			});
		});
		
});

</script>

<div class="page-main-style">
	<h2>알림 목록</h2>

	<c:if test="${count == 0}">
		<div class="align-center">등록된 알림 없습니다.</div>
	</c:if>
	
	<div class="align-right">
		<input type="button" value="알림 전체 확인" id="confirmAllNotice" writer_memnum="${user.mem_num}" style="width:98px">
	</div>
	
	<c:if test="${count > 0}">
		<table class="table_notice">
			<tr>
				<th width="300">알림</th>
				<th width="280">내가 쓴 글</th>
				<th>내용</th>
				<th width="70px;">확인</th>
			</tr>
			<c:forEach var="notice" items="${list}">
				<input type="hidden" >
				<tr>
					<td style="text-align:left;">
						${notice.mem_id}님이
						${notice.notice_comment}
					</td>
					<td>
						<p class="text_overflow">
						${notice.writer_board}
						</p>
						<c:if test="${notice.writer_board.length() > 97}">
							<a class="moreContent" id="writer"><i class="fas fa-angle-right">더보기</i></a>
						</c:if>
					</td>
					<td>
						<p class="text_overflow">
						${notice.board_comment}
						<span style="color:grey; font-size:11px;">[${notice.reg_date}]</span>
						</p>
						<c:if test="${notice.board_comment.length() > 97}">
							<a class="moreContent"><i class="fas fa-angle-right amore">더보기</i></a>
						</c:if>
					</td>
					<td>
						<a class="confirmOneNotice" notice_num="${notice.notice_num}" id="confirmcheck${notice.notice_num}">
							[확인]
						</a>
						<br>
						<c:if test="${notice.return_url != '0'}">
							<a class="check_move"  
								notice_num="${notice.notice_num}" 
								board_num="${notice.board_num}" 
								writer_memnum="${notice.writer_memnum}" 
								return_url="${notice.return_url}">
								[이동]
							</a> 
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
