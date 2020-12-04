<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.wrap{
	text-align:center;
}
</style>

<div class="wrap">

<c:if test="${count == 0}">
	<div>등록된 트레이너가 없습니다.</div>
</c:if>

<c:if test="${count != 0}">
	<c:forEach var="trainer" items="${list}">
	
		<div>
			<ul>
				<li>
					<c:if test="${trainer.mem_pic == null}">
						<a href="trainerListDetail.do?mem_num=${trainer.mem_num}">기본 이미지 보여주기</a>
					</c:if>
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
				
				<li>근무지 : ${trainer.g_addr}</li>
				
				<li>
					<c:if test="${trainer.exp == 0}">신입 트레이너</c:if>
					<c:if test="${trainer.exp > 0 && trainer.exp < 5}">경력 ${trainer.exp}년 </c:if>
					<c:if test="${trainer.exp == 5}">경력 ${trainer.exp}년 이상 </c:if>			
				</li>
				
				<li>
					<c:if test="${trainer.mem_intro == null}">최선을 다해 몸짱을 만들어 드리겠습니다!!</c:if>
					<c:if test="${trainer.mem_intro != null}">${trainer.mem_intro}</c:if>
				</li>
			</ul>
			<br>
		</div>
	</c:forEach>
	<div>${pagingHtml}</div>
</c:if>

</div>



