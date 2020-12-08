<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>

.wrap{
	text-align:center;
	margin-left:20%;
	margin-right:20%;
	
}
.info{
	border:1px solid black;
	width:100%;
	height:250px;
	flex-wrap:wrap;
}

.profile_matching{
border:1px solid black;
width:50%;
float:left;
height:250px;
}

.trainer_info{
border:1px solid black;
width:49%;
float:left;
height:250px;
}

.trainer_info2{
border:1px solid black;
}

.modify_btns{
border:1px solid black;
}

.goback{
border:1px solid black;
}

</style>

<div class="wrap">
	<div class="info">
		<div class="profile_matching">
			<ul>
				<li>
					<c:if test="${empty trainer.mem_picName}">
						<img src="../resources/images/cameraImage.jpg" style="max-width:200px; max-height:200px;">
					</c:if>
					<c:if test="${!empty trainer.mem_picName}">
			        <img src="${pageContext.request.contextPath}/trainerList/trainerImage.do?mem_num=${trainer.mem_num}" 
							width="250" height="200">
			        </c:if>
				</li>	
				
				<li>
					 
					<!-- 일반회원일 경우 && 매칭한 사람이 없을 경우 -->
					<c:if test="${user.mem_auth == 1 && user.t_num == 0}">
						<button type="button" onclick="location.href='matching.do?mem_num=${trainer.mem_num}'">
			        	트레이닝 신청하기
			        	</button>
			        </c:if>
			        <!-- 일반회원일 경우  && 현재 트레이너가 아닌 다른사람과 매칭관계인 경우 -->	
		        	<c:if test="${user.mem_auth == 1 && user.t_num != trainer.mem_num && user.t_num != 0}">
		        	현재 다른 트레이너와 트레이닝중입니다.
		        	</c:if>
		        	<!-- 트레이너일 경우 -->
		        	<c:if test="${user.mem_auth == 2}">
		        	일반회원만 트레이닝 신청이 가능합니다.
		        	</c:if>
		        	<!-- 일반회원일경우 && 해당 트레이너와 이미 매칭관계일 경우 -->
		        	<c:if test="${user.mem_auth ==1 && user.t_num == trainer.mem_num}">
					현재 ${trainer.mem_name}에게 트레이닝 받는 중입니다.        	
		        	</c:if>
		        		
				</li>
			</ul>
		</div>
		
		<div class="trainer_info">
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
	</div>
	<div class="trainer_info2">
		<ul>
			<li>
				<c:if test="${trainer.mem_intro == null}">자기소개: 최선을 다해 몸짱을 만들어 드리겠습니다!!</c:if>
				<c:if test="${trainer.mem_intro != null}">자기소개: ${trainer.mem_intro}</c:if>
			</li>
			
			<li>
				<c:if test="${trainer.career == null}">작성된 이력 정보가 없습니다.</c:if>
				<c:if test="${trainer.career != null}">이력: ${trainer.career}</c:if>
			</li>
		</ul>
	</div>
	
	<!-- 본인이 로그인 한 상태일 경우에만 보여질 3개의 버튼 -->
	<div class="buttons">
		<c:if test="${user.mem_num == trainer.mem_num}">
			<div class="modify_btns">
				<ul>
					<li>
						<button type="button" onclick="location.href='prUpdate.do'">프로필사진 변경하기</button>
						<button type="button" onclick="location.href='introUpdate.do'">자기소개 수정하기</button>
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/myPage.do'">마이페이지</button>
					</li>
				</ul>
			</div>
		</c:if>
	</div>
	<div class="goback">
		<ul>
			<li>
				<button type="button" onclick="location.href='trainerList.do'">돌아가기</button>
			</li>
		</ul>
	</div>

</div>



