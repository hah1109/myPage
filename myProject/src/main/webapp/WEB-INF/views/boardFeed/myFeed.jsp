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
			url:'myFeedAjax.do',
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
						
						var output = '<tr>';
						output += '<td>'+item.feed_num+'</td>';
						output += '<td>'+item.mem_id+'</td>';
						output += '<td>'+item.feed_type+'</td>';
						output += '<td>'+item.feed_content+'</td>';
						output += '<td>'+item.feed_reg_date+'</td>';
						output += '<td>'+item.feed_file+'</td>';
						output += '<td>'+item.feed_filename+'</td>';
						output += '<td>'+item.feed_ip+'</td>';
						output += '<td>'+item.mem_num+'</td>';
						output += '<td>'+item.feed_auth+'</td>';
						output += '</tr>';
												
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

<style>
table{
	width:80%;
	margin:5px auto;
	border:1px solid #000;
	border-collapse:collapse;
}
table td, table th{
	text-align:center;
	border:1px solid #000;
	padding:5px;
}
</style>



<div>
	<div>
		<input type="button" value="내 피드" onclick="location.href='${pageContext.request.contextPath}/boardFeed/myFeed.do'"/>
	</div>
	<c:if test="${mem_auth == 2}">
	<div>
		<input type="button" value="내 회원의 피드" onclick="location.href='${pageContext.request.contextPath}/boardFeed/myMembersFeed.do'"/>
	</div>
	</c:if>
	<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<div id="feedList">
		<table>
			<tr>
				<th>글번호</th>
				<th>글쓴이 아이디</th>
				<th>글 타입</th>
				<th>내용</th>
				<th>글 등록일</th>
				<th>파일</th>
				<th>파일이름</th>
				<th>아이피</th>
				<th>mem_num</th>
				<th>공개범위</th>
			</tr>
			<tbody id="output"></tbody>
		</table>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음글 보기">
		</div>
		<div id="loading" style="display:none;">
			<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
		</div>
	</div>
	
	

	

</div>