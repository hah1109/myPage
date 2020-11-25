<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
	<div>
		<c:if test="${request.type.value} == 'fast'">
			<img alt="" src="${pageContext.request.contextPath}/images/ajax-loader.gif">
		</c:if> 
		<c:if test="${request.type.value} == 'normal'">
			<img alt="" src="${pageContext.request.contextPath}/images/ajax-loader.gif">
		</c:if> 
		<c:if test="${request.type.value} == 'healthy'">
			<img alt="" src="${pageContext.request.contextPath}/images/ajax-loader.gif">
		</c:if> 
		<c:if test="${request.type.value} == 'low'">
			<img alt="" src="${pageContext.request.contextPath}/images/ajax-loader.gif">
		</c:if> 
		<c:if test="${request.type.value} == 'high'">
			<img alt="" src="${pageContext.request.contextPath}/images/ajax-loader.gif">
		</c:if>
	</div>
	
	<div>
		<p> 내 키와 몸무게에 따른 기초 대사량 : <label id="bmr">${bmr}</label> <br>
		내 기초 대사량에 따른 일일 권장 섭취량 : <label id="bmr">${dayCal}</label> <br>
		기초 대사량과 설정 목표에 따른 회원님의 일일 권장 탄단지는 <br>
		탄수화물 <label id="carb">${carb}</label>g / 단백질 <label id="prot">${protein}</label>g / 지방 <label id="fat">${fat}</label>_g 입니다.</p>
		<p> 본 수치는 추정치 이며, 권장 사항일 뿐, 자세한 사항은 전문가와 상담하기를 권장합니다.</p>

	</div> 
</div>