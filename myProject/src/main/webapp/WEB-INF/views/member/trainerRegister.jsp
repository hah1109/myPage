<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
/*----------------------------일반 회원 가입 페이지----------------------------------*/

  	$(document).ready(function(){
		var checkId = 0;
		
		//아이디 중복 체크
		$('#confirmTrainerId').click(function(){
			if($('#mem_id').val()==''){
				$('#message_id').css('color','red').text('아이디를 입력하세요!');
				$('#mem_id').focus();
				return;
			}
			//var regMsg = new RegExp('^[A-Za-z0-9+]{4,10}$');
			var regMsg = /^[A-Za-z0-9+]{4,10}$/
			if(!regMsg.test($('#mem_id').val())){
				$('#message_id').css('color','red').text('아이디는 영문,숫자 4자이상 10자이하 입력');
				$('#mem_id').focus();
				return;
			}
			
			$('#message_id').text();//메시지 초기화
			$('#loading').show();//로딩 이미지 노출
			
			$.ajax({
				url:'confirmTrainerId.do',
				type:'post',
				data:{id:$('#mem_id').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					$('#loading').hide();//로딩 이미지 감추기
					$('#mem_id.errors').hide();//서버에서 유효성 체크 결과 오류 메시지 숨기기
					if(data.result == 'idNotFound'){
						$('#message_id').css('color','#000').text('등록가능ID');
						checkId = 1;
					}else if(data.result == 'idDuplicated'){
						$('#message_id').css('color','red').text('중복된 ID');
						$('#mem_id').val('').focus();
						checkId=0;
					}else{
						checkId=0;
						alert('ID중복체크 오류');
					}
				},
				/* error:function(){
					checkId = 0;
					$('#loading').hide();//로딩 이미지 감추기
					alert('네트워크 오류 발생');
				} */
			});
		});
		
		//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#register_form #mem_id').keydown(function(){
			checkId = 0;
			$('#message_id').text('');
		});
		
		//submit 이벤트 발생시 아이디 중복 체크 여부 확인
		$('#register_form').submit(function(){
			if(checkId==0){
				$('#message_id').css('color','red')
				                .text('아이디 중복 체크 필수');
				$('#mem_id').focus();
				return false;
			}
		});
		
		
	}); 
</script>
<div class="page-main-style">
	<h2>회원 가입</h2>
	<form:form id="trainer_register_form" action="trainerRegister.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="mem_name">이름</label>
				<form:input path="mem_name"/>
				<form:errors path="mem_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_id">아이디</label>
				<form:input path="mem_id"/>
				<input type="button" id="confirmTrainerId" 
				  value="ID중복체크">
				<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif" 
				      width="16" height="16" style="display:none;" id="loading">
				<span id="message_id"></span>
				<form:errors path="mem_id" cssClass="error-color"/>        
			</li>
			<li>
				<label for="mem_pw">비밀번호</label>
				<form:password path="mem_pw"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_gender">성별</label>
				<input type="radio" name="mem_gender" value="1">남자
				<input type="radio" name="mem_gender" value="2">여자
				<form:errors path="mem_gender" cssClass="error-color"/>
			</li>
			<li>
				<label for="g_addr">근무지 주소</label>
				<form:input path="g_addr"/>
				<form:errors path="g_addr" cssClass="error-color" hint="예)서초구 @@헬스장"/>
			</li>
			<li>
				<label for="exp">경력</label>
				<form:input path="exp" placeholder="예) 3"/>년
				<form:errors path="exp" cssClass="error-color"/>
			</li>
			<li>
            <label for="career">이력</label>
	            <form:textarea path="career" placeholder="예) @@시 몸짱대회 2등 수상" cols="26"/>
	            <form:errors path="career" cssClass="error-color"/>
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
			<input type="submit" value="전송">
			<input type="button" value="로그인"
			    onclick="location.href='${pageContext.request.contextPath}/member/login.do'">
		</div>
	</form:form>
</div>