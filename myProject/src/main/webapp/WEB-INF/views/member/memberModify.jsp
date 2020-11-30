<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_memberModify.css">
<style>
.detail_modify_btn{
	margin-top:4px;
	background-image: url('../resources/images/btn_detail_modify.png');
	height:40px;
} 
.password_modify_btn{
	margin-top:4px;
	background-image: url('../resources/images/btn_password_modify.png');
	height:40px;
}
.delete_btn{
	margin-top:4px;
	background-image: url('../resources/images/btn_delete_member.png');
	height:26px;
}
.update_btn{
   width:140px;
   height:50px;
   margin-bottom: 5px;
   background-image: url('../resources/images/Btn_modify.png');
}
.Btn_home{
   width:140px;
   height:50px;
   margin-bottom: 5px;
   background-image: url('../resources/images/Btn_modify_home.png');
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
if($('#t_num').val()== ''){
	$('#t_num').val('매칭된 트레이너가 없습니다.');
}else if($('#t_num').val()!= ''){
	$('#t_num').val('${member.t_num}');
}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#member_modify-form').submit(function(){
			var choice = window.confirm('수정하시겠습니까?');
			if(choice){
				alert('수정완료!');
			}else{
				return false;
			}
		});
	});
</script>

<div class="mypage_style">
  <div class="container">
    <div class="left">
    
    <form:form id="member_modify-form" action="update.do" commandName="memberVO" >
    	<ul>
	      	<a><img class="mypage_texts" src="../resources/images/text_name.png"></a>
			<li>
				<form:input path="mem_name" value="${member.mem_name}" readonly="true"/>
			</li>
			
			<a><img class="mypage_texts" src="../resources/images/text_myTrainer.png"></a>
			<li>
				<form:input path="t_num" value="" readonly="true"/>
			</li>
			
			<a><img class="mypage_texts" src="../resources/images/text_cell.png"></a>
			<li>
				<form:input type="text" id="memModify" path="mem_cell" placeholder="${member.mem_cell}"/>
			</li>
			
			<a><img class="mypage_texts" src="../resources/images/text_email.png"></a>
			<li>
				<form:input type="text" id="memModify" path="mem_email" placeholder="${member.mem_email}"/>
			</li>
			
			<a><img class="mypage_texts" src="../resources/images/text_zipcode.png"></a>
			<li>
				<form:input type="text" id="memModify" path="mem_zipcode" placeholder="${member.mem_zipcode}"/>
			</li>
			
			<a><img class="mypage_texts" src="../resources/images/text_addr1.png"></a>
			<li>
				<form:input type="text" id="memModify" path="mem_addr1" placeholder="${member.mem_addr1}"/>
			</li>
			
			<a><img class="mypage_texts" src="../resources/images/text_addr2.png"></a>
			<li>
				<form:input type="text" id="memModify" path="mem_addr2" placeholder="${member.mem_addr2}"/>
			</li>
			
			<a><img class="mypage_texts" src="../resources/images/text_registerDate.png"></a>
			<li>
				<form:input type="text" id="memModify" path="mem_date" value="${member.mem_date}" readonly="true"/>
			</li>
			
			<input type="submit" value="" class="update_btn">
			
		</ul>
		
		
	</form:form>
	
   </div>
    <div class="right">
      <form:form class="re_form" action="login.do" commandName="memberVO">
	      <div class="form">
	        <input type="button"  class="detail_modify_btn" onclick="location.href='update.do'" />
			<input type="button" class="password_modify_btn" onclick="location.href='updatePw.do'">
			<input type="button" class="delete_btn" onclick="location.href='delete.do'">
	      </div>
      </form:form>
    </div>
  </div>
</div>