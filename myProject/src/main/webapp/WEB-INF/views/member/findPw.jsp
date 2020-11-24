<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page-main-style">
	<h2>비밀번호 찾기 결과</h2>
	<form:form action="findExit.do" commandName="memberVO">
		<ul>
			<li>
				<a> 비밀번호 검색 결과: ${findPw.mem_pw}</a>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="확인">
		</div>
	</form:form>
</div>