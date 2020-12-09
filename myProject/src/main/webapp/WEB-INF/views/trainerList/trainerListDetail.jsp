<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>

.wrap{
	text-align:center;
	margin-left:35%;
	margin-right:35%;
	background-color:#CEF6EC;
	margin-bottom:1%;
	border-radius:40px;
	box-shadow: 10px 10px #D8D8D8;
}
.info{
	width:100%;
	height:220px;
	flex-wrap:wrap;
}

.profile_matching{
margin-top:2%;
width:50%;
height:200px;
float:left;
}

.trainer_info{

width:35%;
float:left;
height:130px;
margin-top:10%;
margin-left:5%;
}

.btns{
background-color: white;
  border: 1px solid @gray-light;
  border-radius: 1rem;
  color: @gray-dark;
  padding: 0.5rem;
  text-transform: lowercase;
  margin-top:2%;
  margin-bottom:1%;
}

.btns:hover{
	color:red;
	cursor:pointer;
}

</style>

<div class="wrap">
	<div class="info">
		<div class="profile_matching">
			<ul style="text-align:right;">
				<li>
					<c:if test="${empty trainer.mem_picName}">
						<img src="../resources/images/cameraImage.jpg" style="max-width:200px; max-height:200px;">
					</c:if>
					<c:if test="${!empty trainer.mem_picName}">
			        <img src="${pageContext.request.contextPath}/trainerList/trainerImage.do?mem_num=${trainer.mem_num}" 
							width="250" height="200">
			        </c:if>
				</li>	
			</ul>
		</div>
		
		<div class="trainer_info">
			<ul style="text-align:left;">
				<li>이름 : ${trainer.mem_name}</li>
		
				<li>
					<c:if test="${trainer.mem_gender == 1}">성별: 남자</c:if> 
					<c:if test="${trainer.mem_gender == 2}">성별: 여자</c:if>
				</li>
		
				<li>
					<c:if test="${trainer.exp == 0}">신입 트레이너</c:if> 
					<c:if test="${trainer.exp > 0 && trainer.exp < 5}">경력 : ${trainer.exp}년 </c:if>
					<c:if test="${trainer.exp == 5}">경력 : ${trainer.exp}년 이상 </c:if>
				</li>
		
				<li>이메일 : ${trainer.mem_email}</li>
				
				<li>근무지 : ${trainer.g_addr}</li>
		
			</ul>
		</div>
	</div>
	<hr style="height:4px; background-color:black;">
	<div class="trainer_info2">
		<ul>
			<li style="margin-top:1%; margin-bottom:1%; color:red;"> 
					<!-- 일반회원일 경우 && 매칭한 사람이 없을 경우 -->
					<c:if test="${user.mem_auth == 1 && user.t_num == 0 && empty matching.mat_from}">
						<button id="tButton" class="btns" type="button">
			        	트레이닝 신청하기
			        	</button>
			        	<script>
							var tButton = document.getElementById('tButton');
							tButton.onclick=function(){
								var choice = window.confirm('신청하시겠습니까?');
								if(choice){
									location.href='matching.do?mem_num=${trainer.mem_num}';
								}
							};
						</script>
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
		        	<!-- 일반회원일경우 && 해당 트레이너에게 이미 매칭신청을 했을 경우 -->
		        	<c:if test="${user.mem_auth ==1 && matching.mat_to == trainer.mem_num}">
		        	트레이너의 수락을 기다리는 중입니다.
		        	</c:if>
		        	<br>		
			</li>
			
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
						<button class="btns" type="button" onclick="location.href='prUpdate.do'">프로필사진 변경</button>
						<button class="btns" type="button" onclick="location.href='introUpdate.do'">자기소개 수정</button>
						<button class="btns" type="button" onclick="location.href='${pageContext.request.contextPath}/member/myPage.do'">마이페이지</button>
					</li>
				</ul>
			</div>
		</c:if>
	</div>
	<div class="goback">
		<ul>
			<li>
				<button class="btns" type="button" onclick="location.href='trainerList.do'">돌아가기</button>
			</li>
		</ul>
	</div>

</div>



