<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>

.wrap{
	text-align:center;
}

</style>

<div class="wrap">

<div>
	<ul>
		<li>
			<c:if test="${trainer.mem_pic == null}">기본 이미지 보여주기</c:if>
			<c:if test="${trainer.mem_pic != null}">${trainer.mem_pic}</c:if>
		</li>
		
		<li>
			<!-- 
			if(로그인 상태가 아니면 로그인 화면으로 이동)
			if(로그인 상태 && 일반회원 일 경우 정상작동)
			if(로그인 상태 && 일반회원 && 다른 트레이너와 매칭관계 일경우 1명만 매칭 가능합니다.)
			if(로그인 상태 && 일반회원 && 현재 트레이너와 매칭신청만한 상태라면 버튼 value를 매칭신청완료로 바꾸기)
			if(로그인 상태 && 일반회원 && 현재 트레이너와 매칭관계 일경우 버튼 value를 매칭완료로 바꾸기)
			if(로그인 상태 && 트레이너 일 경우 일반회원만 매칭 가능합니다.)
			ajax로 처리할 예정
			 -->
			<input type="button" value="매칭신청하기">
		</li>
	</ul>
</div>

<div>
	<ul>
		<li>이름 : ${trainer.mem_name}</li>

		<li>
			<c:if test="${trainer.mem_gender == 1}">남자</c:if> 
			<c:if test="${trainer.mem_gender == 2}">여자</c:if>
		</li>

		<li>
			<c:if test="${trainer.exp == 0}">신입 트레이너</c:if> 
			<c:if test="${trainer.exp > 0 && trainer.exp < 5}">경력 ${trainer.exp}년 </c:if>
			<c:if test="${trainer.exp == 5}">경력 ${trainer.exp}년 이상 </c:if>
		</li>

		<li>이메일 : ${trainer.mem_email}</li>
		
		<li>근무지 : ${trainer.g_addr}</li>

	</ul>
</div>

<div>
	<ul>
		<li>
			<c:if test="${trainer.mem_intro == null}">자기소개: 최선을 다해 몸짱을 만들어 드리겠습니다!!</c:if>
			<c:if test="${trainer.mem_intro != null}">자기소개: ${trainer.mem_intro}</c:if>
		</li>
		
		<li>
			<c:if test="${trainer.career == null}">작성된 이력 정보가 없습니다.</c:if>
			<c:if test="${trainer.career != null}">${trainer.career}</c:if>
		</li>
	</ul>
</div>

<!-- 본인이 로그인 한 상태일 경우에만 보여질 2개의 버튼 -->
<div>
	<ul>
		<li>
			<!-- 경로 수정 필요 -->
			<button type="button" onclick="location.href='prUpdate.do'">프로필,자기소개 수정하기</button>
		</li>
		
		<li>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/myPage.do'">개인정보 수정하기</button>
		</li>
	</ul>
</div>

</div>



