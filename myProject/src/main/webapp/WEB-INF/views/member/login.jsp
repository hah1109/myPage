<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_login.css">

<style>
.login_btn{
   width:125px;
   height:30px;
   margin-left: 50px;
   margin-top: 15px;
   margin-bottom: 5px;
   background-image: url('../resources/images/Btn_login.png');
}
</style>

<div class="page-main-style">
  <div class="container">
  
    <div class="left">
      <div class="login">Login</div>
      <div class="eula">@여기에 페이지에 대한 짧은 설명 글 넣기</div>
    </div>
    
    <div class="right">
      <form:form id="re_form" action="login.do" commandName="memberVO">
      
         <div class="form">
         
         	<!-- id/pw 입력란 -->
         	<label for="mem_id">ID</label>
         	<form:input class="input_id_pw" path="mem_id"/>
           	<label for="mem_pw" >Password</label>
           	<form:input type="password" class="input_id_pw" path="mem_pw"/><br>
         	
         	<!-- 일반회원/트레이너 선택란 -->    
         	<img class="texts_img" src="../resources/images/text_Member.png">
         	<input type="radio" class="radio_btn"name="mem_auth" value="1" checked="checked">
         	<img class="texts_img" src="../resources/images/text_Trainer.png">
         	<input type="radio" class="radio_btn" name="mem_auth" value="2">
         	
         	<!-- 로그인 버튼 -->
         	<input type="submit" id="submit" value="" class="login_btn">
         	
         	<!-- 회원가입 + id/pw찾기 -->
           	<button type="button" class="r_f_btn" onclick="location.href='${pageContext.request.contextPath}/member/userType.do'">
           	<img src="../resources/images/Btn_Register.png">
           	</button>
           	<button type="button" class="r_f_btn" onclick="location.href='${pageContext.request.contextPath}/member/findIdPw.do'">
           	<img src="../resources/images/Btn_ID_PW.png">
           	</button>
           	
         </div>
      </form:form>
    </div>
    
  </div>
</div>