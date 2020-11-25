<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<!-----------------------------트레이너 상세정보 페이지--------------------------------->
<div class="page-main-style">
	<h2>회원 상세정보</h2>
	<form:form>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>이름 : ${trainer.mem_name}</li>
			<li>전화번호 : ${trainer.mem_cell}</li>
			<li>이메일 : ${trainer.mem_email}</li>
			<li>근무지 주소 : ${trainer.g_addr}</li>
			<li>경력 : ${trainer.exp}</li>
			<li>이력 : ${trainer.career}</li>
			<li>우편번호 : ${trainer.mem_zipcode}</li>
			<li>주소 : ${trainer.mem_addr1}</li>
			<li>상세주소 : ${trainer.mem_addr2}</li>
			<li>가입날짜 : ${trainer.mem_date}</li>
		</ul>	
	</form:form>
	<div class="align-center">
		<input type="button" value="상세정보 수정" onclick="location.href='update.do'">
		<input type="button" value="비밀번호 변경" onclick="location.href='updatePw.do'">
		<input type="button" value="회원 탈퇴" onclick="location.href='delete.do'">
	</div>
</div>