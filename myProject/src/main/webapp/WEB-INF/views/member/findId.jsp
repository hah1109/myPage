<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page-main-style">
	<h2>아이디 찾기 결과</h2>
	<form:form action="findExit.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<a> 아이디 검색 결과 : ${findId.mem_id}</a>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="확인">
		</div>
	</form:form>
</div>