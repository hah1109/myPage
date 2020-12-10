<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hwView.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	var vid = $('#vid').val();
	var duration;
	$.get("https://www.googleapis.com/youtube/v3/videos", {
		part : 'contentDetails',
		maxResults : 50,
		id : vid,
		key : 'AIzaSyBHl4ghzq0VGQFdS-bv52wuwUS3vcQrRsA',
	}, function(data) {
		$.each(data.items, function(i, item) {
			duration = item.contentDetails.duration;
			
			var hourRegex = new RegExp("[0-9]{1,2}H", "gi");
			var minRegex = new RegExp("[0-9]{1,2}M", "gi");
			var secRegex = new RegExp("[0-9]{1,2}S", "gi");

			var hour = hourRegex.exec(duration);
			var min = minRegex.exec(duration);
			var sec = secRegex.exec(duration);

			if(hour!= null){
			    hour = hour.toString().split("H")[0] + ":";
			}else{
			    hour = "";
			}
			if(min != null){
			    min = min.toString().split("M")[0];
			    if(min.length<2){
					min = "0"+min;
				}
			}else{
			    min = "00";
			}
			if(sec != null){
			    sec = sec.toString().split("S")[0];
			    if(sec.length<2){
					sec = "0"+sec;
				}
			}else{
			    sec = "00";
			}
			duration = hour+min+":"+sec;
			$('#duration').append(duration);
		})

	});
	
});
	
		
	
</script>
<div class="page-main-style">

	<input id="vid" style="display:none" value="${hwBoardVO.hw_link}"/>
	<h2>${hwBoardVO.hw_title}</h2>
	<hr size="1" width="100%">
	<div class="align-center">
		<iframe width="800" height="500"
			src="https://www.youtube.com/embed/${hwBoardVO.hw_link}"
			frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	</div>
	<div class="vod_icos_wrap">
		<ul class="vod_icos">
			<li><em id="duration">소요 시간 :</em></li>
			<li><em>운동부위 : ${hwBoardVO.hw_part}</em></li>
			<li><em>소모 칼로리 : ${hwBoardVO.hw_kcal}</em></li>
		</ul>
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







