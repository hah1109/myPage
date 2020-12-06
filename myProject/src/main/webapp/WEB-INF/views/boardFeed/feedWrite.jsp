<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_feedWrite.css">
<script type="text/javascript">
$(document).ready(function(){
	  $(".form-wrapper .button").click(function(){
	  	if($('#feed_type').val()==100){
			$('#feed_type').css('color','red').attr('label','글 주제를 선택해주세요');
			$('#feed_type').focus();
			return false;
	    }
	  	if($('#feed_auth').val()==100){
	    	$('#feed_auth').css('color','red').attr('label','글 공개범위를 선택해주세요');
            $('#feed_auth').focus();
            return false;
	    }
	    var button = $(this);
	    var currentSection = button.parents(".section");
	    var currentSectionIndex = currentSection.index();
	    var headerSection = $('.steps li').eq(currentSectionIndex);
	    currentSection.removeClass("is-active").next().addClass("is-active");
	    headerSection.removeClass("is-active").next().addClass("is-active");

	    
	    if(currentSectionIndex === 2){
	        
	      }
	    
	  });
});

</script>
<div class="page-main-style">
	<div class="container">
    <div class="wrapper">
      <ul class="steps">
        <li class="is-active">Step 1</li>
        <li>Step 2</li>
        <li>Step 3</li>
      </ul>
      <form:form class="form-wrapper" id="feedWrite" action="feedWrite.do" commandName="feedVO" enctype="multipart/form-data">
        <fieldset class="section is-active">
          <h3>주제와 공개범위를 선택해주세요</h3>
			<!-- 타입 정하는 버튼 -->
		      <form:select path="feed_type">
		         <form:option value="100" label="글 주제 선택 " />
		         <form:option value="1" label="식단" />
		         <form:option value="2" label="운동" />
		      </form:select>
			<!-- 공개범위 설정하는 버튼 -->
		      <form:select path="feed_auth">
		         <form:option value="100" label="공개범위를 선택해주세요" />
		         <form:option value="0" label="나만보기" />
		         <form:option value="1" label="트레이너만 공개" />
		         <form:option value="2" label="팔로워 공개" />
		         <form:option value="3" label="전체공개" /> 
		      </form:select>
          <div class="button">Next</div>
        </fieldset>
        <fieldset class="section">
          <h3>업로드할 사진을 선택해주세요</h3>
          <div class="row cf">
            <label for="feedUpload" class="feedUpload" ></label> 
			<input type="file" name="feedUpload" id="feedUpload" accept="imgage/gif,image/png,image/jpeg">
          </div>
                 
          <div class="button">Next</div>
        </fieldset>
        <fieldset class="section">
          <h3>글 내용을 작성해주세요</h3>
          <form:input type="text"  path="feed_content" placeholder="글 내용을 작성해주세요"/>
          <input type="submit" value="글 등록" class="submit button" />
          <!-- <div class="button" onclick="location.href='feedReco.do'">취소</div> -->
        </fieldset>
        
      </form:form>
    </div>
  </div>

</div>
