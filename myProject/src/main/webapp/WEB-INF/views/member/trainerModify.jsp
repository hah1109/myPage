<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page-main-style">
	<h2>트레이너 정보 수정</h2>
	<form:form action="update.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label>             이름                  ${user.mem_name}</label><br>
			</li>
			<li>
				<label for="mem_cell">전화번호</label>
				<form:input path="mem_cell"/>
				<form:errors path="mem_cell" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_email">이메일</label>
				<form:input path="mem_email"/>
				<form:errors path="mem_email" cssClass="error-color"/>
			</li>
			<li>
				<label for="g_addr">근무지 주소</label>
				<form:input path="g_addr"/>
				<form:errors path="g_addr" cssClass="error-color"/>
			</li>
			<li>
				<label for="exp">경력</label>
				<form:input path="exp"/>년
				<form:errors path="exp" cssClass="error-color"/>
			</li>
			<li>
				<label for="career">이력</label>
				<form:input path="career"/>
				<form:errors path="career" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_zipcode">우편번호</label>
				<form:input path="mem_zipcode"/>
				<form:errors path="mem_zipcode" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_addr1">주소</label>
				<form:input path="mem_addr1"/>
				<form:errors path="mem_addr1" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_addr2">상세주소</label>
				<form:input path="mem_addr2"/>
				<form:errors path="mem_addr2" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="홈으로"
			    onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>