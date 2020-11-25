<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<!-----------------------------일반 회원 상세정보 페이지--------------------------------->
<div class="page-main-style">
	<h2>회원 상세정보</h2>
	<form:form>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>이름 : ${member.mem_name}</li>
			<c:if test="${member.t_num==0}"><li>나의 트레이너 : 매칭된 트레이너가 없습니다.</li></c:if>
			<c:if test="${member.t_num!=0}"><li>나의 트레이너 번호 : ${member.t_num}</li></c:if>
			<li>전화번호 : ${member.mem_cell}</li>
			<li>이메일 : ${member.mem_email}</li>
			<li>우편번호 : ${member.mem_zipcode}</li>
			<li>주소 : ${member.mem_addr1}</li>
			<li>상세주소 : ${member.mem_addr2}</li>
			<li>가입날짜 : ${member.mem_date}</li>
		</ul>	
	</form:form>
	<div class="align-center">
		<input type="button" value="상세정보 수정" onclick="location.href='update.do'">
		<input type="button" value="비밀번호 변경" onclick="location.href='updatePw.do'">
		<input type="button" value="회원 탈퇴" onclick="location.href='delete.do'">
	</div>
</div>