<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<div class="page-main-style">
	<h2>회원 타입 선택</h2>
		<div class="align-center">
			<input type="button" value="일반회원"
			    onclick="location.href='${pageContext.request.contextPath}/member/memberRegister.do'">
			<input type="button" value="트레이너"
			    onclick="location.href='${pageContext.request.contextPath}/member/trainerRegister.do'">
		</div>
</div>