<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 홍아현  -->
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>   
<script>
	$(document).ready(function(){
		var currentPage;
		var count;
		var rowCount;
		//댓글 목록
		function selectData(pageNum){
			currentPage = pageNum;
			
			if(pageNum == 1){
				//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
				$('#output').empty();
			}
			//로딩 이미지 노출
			$('#loading').show();
			
			$.ajax({
				type:'post',
				data:{pageNum:pageNum},
				url:'myMembersFeedAjax.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					//로딩 이미지 감추기
					$('#loading').hide();
					count = data.count;
					rowCount = data.rowCount;
					var list = data.list;
					
					if(count < 0 || list == null){
						alert('목록 호출 오류 발생!');
					}else{
						$(list).each(function(index,item){
							
							var output = '<div class="content">';
							
							output += '<div class="img">';
							if(item.feed_filename == null){
								output += '<img class="thumbnail" src="../resources/images/blank.jpg">';
							} else {
								output += '<img class="thumbnail" src="imageView.do?feed_num='+item.feed_num+'>';
							}
							
							output += '</div>';
							
							output += '<div class="text">';
							output += '<p class="feedType">[ ';
							
							if(item.feed_type == 1) {
								output += '식단';
							} else if(item.feed_type == 2) {
								output += '운동';
							}
							output += ' ] 기록</p><br>';
							output += '<p class="memId"> by[ ' + item.mem_id + ' ] </p>';
							output += '<p class="date">' +item.feed_reg_date+'</p>';
							output += '</div>';
							output += '</div>';
								
							//문서 객체에 추가
							$('#output').append(output);
						});
						
					}
				},
				error:function(){
					//로딩 이미지 감추기
					$('#loading').hide();
					alert('네트워크 오류');
				}
		});
	}
	
	
	
	//스크롤시 데이터 추가
	$(window).scroll(function(){
		var scrollTop = $(document).scrollTop();
		var docHeight = $(document).height();
		var winHeight = $(window).height();
		
		if(scrollTop == docHeight - winHeight)
			if(currentPage>=Math.ceil(count/rowCount)){
				//다음 페이지가 없음
				return;
			}else{
				//다음 페이지가 존재
				var pageNum = currentPage + 1;
				selectData(pageNum);
			}
		
	});
	
	//1페이지 호출
	selectData(1);
	
});


//다음 댓글 보기 버튼 클릭시 데이터 추가
/* $('.paging-button input').click(function(){
	var pageNum = currentPage + 1;
	selectData(pageNum);
}); */
/* //paging button 처리
if(currentPage>=Math.ceil(count/rowCount)){
	//다음 페이지가 없음
	$('.paging-button').hide();
}else{
	//다음 페이지가 존재
	$('.paging-button').show();
} */


</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedStyle.css">

<div>
	
	<!-- 상단 버튼 -->
	<ul class="topButton">
		<li class="aBox">
			<p style="margin-left:40%;"><a href='${pageContext.request.contextPath}/boardFeed/myFeed.do'>내 피드</a></p>
		</li>
		<li class="aBox">
			<p style="margin-left:30%;"><a href='${pageContext.request.contextPath}/boardFeed/myMembersFeed.do'>내 회원의 피드</a></p>
		</li>
	</ul>
	<!-- 상단 버튼 -->
	
	<!-- 게시물이 없을 시 -->
	<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<!-- 게시물이 없을 시 -->
	
	<!-- LIST -->
	<div id="feedList">
		<div id="output">
			<!-- Ajax 영역 -->
		</div>
		
		<!-- feed로딩시 로딩 이미지 -->
		<div id="loading" style="display:none;">
			<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
		</div>
		<!-- feed로딩시 로딩 이미지 -->
	</div>
	<!-- LIST -->
	
	
</div>