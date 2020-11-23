<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div id="main_header"> 

	<!-- 우측 상단 메뉴 -->
		<div style="float:right">
			<!-- 로그인 상태 : 회원등급아이콘,id,알림아이콘,mypage,로그아웃,QnA 활성화 -->
			<c:if test="${!empty user}">
			[<span>${user.mem_auth}</span>]
			[<span>${user.mem_id}</span>]
			<a href="${pageContext.request.contextPath}">알림</a>
			<a href="${pageContext.request.contextPath}/member/myPage.do">MyPage</a>
			<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
			<a href="${pageContext.request.contextPath}/board/qna_sys.do">QnA</a>
			</c:if>
			
			<!-- 비로그인 상태 : 회원가입,로그인 화성화 -->
			<c:if test="${empty user}">
			<a href="${pageContext.request.contextPath}/member/userType.do">회원가입</a>
			<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>	
			</c:if>
		</div>
		<!-- 우측 상단 메뉴 -->


		<!-- 헤더 메인 메뉴 링크 임시로 main으로 통일 해 둠 -->
		<div class="align-center">
			<a href="${pageContext.request.contextPath}/main/main.do">메인로고</a>
			<a href="${pageContext.request.contextPath}/main/main.do">홈트레이닝</a>
			<a href="${pageContext.request.contextPath}/main/main.do">식단</a>
			<a href="${pageContext.request.contextPath}/main/main.do">트레이닝 다이어리</a>
			<a href="${pageContext.request.contextPath}/main/main.do">게시판</a>
			<a href="${pageContext.request.contextPath}/main/main.do">트레이너</a>
		</div>
	
</div>










