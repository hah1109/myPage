<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page-main-style">
	<h2>회원 로그인</h2>
	<form:form action="login.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="mem_id">아이디</label>
				<form:input path="mem_id"/>
				<form:errors path="mem_id" cssClass="error-color"/>        
			</li>
			<li>
				<label for="mem_pw">비밀번호</label>
				<form:password path="mem_pw"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_auth">회원종류 선택</label>
				<input type="radio" name="mem_auth" value="1" checked="checked">일반 회원
				<input type="radio" name="mem_auth" value="2">트레이너
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/userType.do'">
			<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/member/findIdPw.do'">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>