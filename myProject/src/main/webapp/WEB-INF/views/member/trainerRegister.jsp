<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_trainerRegister.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet">

<script type="text/javascript">
/*----------------------------일반 회원 가입 페이지----------------------------------*/

     $(document).ready(function(){
      var checkId = 0;
      
      //아이디 중복 체크
      $('#confirmTrainerId').click(function(){
         if($('#mem_id').val()==''){
            $('#confirmTrainerId').css('color','red').val('아이디를 입력하세요');
            $('#mem_id').focus();
            return;
         }
         //var regMsg = new RegExp('^[A-Za-z0-9+]{4,10}$');
         var regMsg = /^[A-Za-z0-9+]{4,10}$/
         if(!regMsg.test($('#mem_id').val())){
            $('#confirmTrainerId').css('color','red').val('아이디는 영문,숫자 4자이상 10자이하로 입력하세요');
            $('#mem_id').focus();
            return;
         }
         
         $('#confirmTrainerId').text();//메시지 초기화
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
                  $('#confirmTrainerId').val('ID 중복체크 결과 | 등록가능ID');
                  checkId = 1;
               }else if(data.result == 'idDuplicated'){
                  $('#confirmTrainerId').css('color','red').val('ID 중복체크 결과 | 사용중인 ID, 다른 ID를 입력해주세요');
                  $('#mem_id').val('').focus();
                  checkId=0;
               }else{
                  checkId=0;
                  alert('ID중복체크 오류');
               }
            },
            error:function(){
               checkId = 0;
               $('#loading').hide();//로딩 이미지 감추기
               alert('네트워크 오류 발생');
            }
         });
      });
      
      //아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
      $('#member_register_form #mem_id').keydown(function(){
         checkId = 0;
         $('#confirmTrainerId').css('color','black').val('ID 중복체크');
      });
      
      //submit 이벤트 발생시 아이디 중복 체크 여부 확인
      $('#member_register_form').submit(function(){
         if(checkId==0){
            $('#confirmTrainerId').css('color','red').val('아이디 중복 체크 필수');
            $('#mem_id').focus();
            return false;
         }
         if($('#mem_name').val()==''){
            $('#mem_name').attr('placeholder','이름을 입력하세요');
            $('#mem_name').focus();
            return false;
         }
         if($('#mem_pw').val()==''){
            $('#mem_pw').attr('placeholder','비밀번호를 입력하세요');
            $('#mem_pw').focus();
            return false;
         }
         if($('#mem_gender').val()==''){
            $('#mem_gender').focus();
            return false;
         }
         if($('#mem_cell').val()==''){
            $('#mem_cell').attr('placeholder','전화번호를 입력하세요(숫자만)');
            $('#mem_cell').focus();
            return false;
         }
         if($('#g_addr').val()==''){
            $('#g_addr').attr('placeholder','근무지 주소를 입력해주세요(예/서울시 서초구 반포동)');
            $('#g_addr').focus();
            return false;
         }
         if($('#exp').val()==''){
            $('#exp').focus();
            return false;
         }
         if($('#career').val()==''){
            $('#career').attr('placeholder','자기자랑 꼭 해주세요(예/서울시 몸짱대회 1등)');
            $('#career').focus();
            return false;
         }
         if($('#mem_email').val()==''){
            $('#mem_email').attr('placeholder','이메일을 입력해주세요');
            $('#mem_email').focus();
            return false;
         }
      });
      
   }); 
</script>

<div class="signup-form">
   <h2><img class="register_img" src="../resources/images/text_Register.png"></h2>
   <form:form id="member_register_form" action="trainerRegister.do" commandName="memberVO" >
      <form:errors element="div" cssClass="error-color"/>
      
      <form:input path="mem_name" placeholder="이름" />
      
      <form:input id="mem_id" path="mem_id" placeholder="ID" autocomplete="off" />
      <input type="button" id="confirmTrainerId" value="ID 중복체크">
      
      <form:password id="mem_pw" path="mem_pw" placeholder="비밀번호" />
      
      <form:select id="mem_gender" path="mem_gender" >
         <form:option id="mem_gender" value="" label="성별을 선택해주세요(!!!필수!!!)" />
         <form:option value="1" label="남자" />
         <form:option value="2" label="여자" />
      </form:select>
      
      <form:input id="mem_cell" path="mem_cell" placeholder="전화번호(숫자만 입력하세요)" />
      
      <form:input id="g_addr" path="g_addr" placeholder="근무지 주소(예/서울시 서초구 반포동)" />
      
      <form:select id="exp" path="exp" >
         <form:option id="exp" value="" label="경력사항을 선택해주세요(!!!필수!!!)" />
         <form:option value="0" label="신입 트레이너" />
         <form:option value="1" label="1년 이상" />
         <form:option value="2" label="2년 이상" />
         <form:option value="3" label="3년 이상" />
         <form:option value="4" label="4년 이상" />
         <form:option value="5" label="5년 이상" />
      </form:select>
      
      <form:input id="career" path="career" placeholder="이력" />
      
      <form:input id="mem_email" path="mem_email" placeholder="이메일" />
      
      <form:input path="mem_zipcode" placeholder="우편번호" />
      
      <form:input path="mem_addr1" placeholder="주소" />
      
      <form:input path="mem_addr2" placeholder="상세주소" />
      
      <input type="submit" value="회원가입" class="signup-btn"> 
      
      <a href="${pageContext.request.contextPath}/member/login.do">아이디가 있으면 여기를 클릭해주세요</a>
      
   </form:form>
</div>