<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 프로필 사진, 프로필 아이디 보이기 (클릭가능)-->
<h2>프로필 사진</h2>
	<ul>
		<li>
			<c:if test="${empty member.mem_pic }">
				<img
					src="${pageContext.request.contextPath }/resources/images/blank.jpg"
					width="100" height="100" class="my-photo">
			</c:if> <c:if test="${!empty member.mem_pic }">
				<img src="${pageContext.request.contextPath }/member/photoView.do"
					width="100" height="100" class="my-photo">
			</c:if>
		</li>
		<li>
			작성자 : ${feed.mem_id}
		</li>
<!-- 타입 보이기 -->
		<li>
			타입 :${feed.feed_type }
		</li>
<!-- 공개범위 보이기 버튼 -->
		<li>
			공개범위 : ${feed.feed_auth }
		</li>
<!-- 사진 미리보기 -->
		<li>
			<c:if test="${empty feed.feed_filename }">
				<p>저장한 사진이 없습니다 </p>
			</c:if> 
			<c:if test="${!empty feed.feed_filename }">
			<!-- photoview 부분은 수정을 해줘야 한다 어떤 controller에서 사용하는지 확인  -->
				<img src="photoView.do?feed_num=${feed.feed_num}" style="max-width:500px;">
			</c:if>
		</li>
	</ul>
<!-- content 보이기 -->
	<p>
		${feed.feed_content}
	</p>
<!-- 취소(목록으로 이동), 수정 버튼 -->
	<div class="align-right">
	    <%--수정 삭제의 경우는 로그인이 되어있고 로그인한 회원번호와 작성자 회원번호가
	               일치해야 함 --%>
		<c:if test="${!empty user && user.mem_num == feed.mem_num}">
		<input type="button" value="수정"
		       onclick="location.href='feedUpdate.do?feed_num=${feed.feed_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script>
			var delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				var choice = window.confirm('삭제하시겠습니까?');
				if(choice){
					location.href='feedDelete.do?feed_num=${feed.feed_num}';
				}
			};
		</script>              
		</c:if>
		<input type="button" value="목록"
		       onclick="location.href='feedList.do'">
	</div>