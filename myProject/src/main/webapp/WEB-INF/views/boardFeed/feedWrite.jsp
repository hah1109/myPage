<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_feedWrite.css">
<script type="text/javascript">
$(document).ready(function(){
	  $(".form-wrapper .button").click(function(){
	    var button = $(this);
	    var currentSection = button.parents(".section");
	    var currentSectionIndex = currentSection.index();
	    var headerSection = $('.steps li').eq(currentSectionIndex);
	    currentSection.removeClass("is-active").next().addClass("is-active");
	    headerSection.removeClass("is-active").next().addClass("is-active");

	    $(".form-wrapper").submit(function(e) {
	      e.preventDefault();
	    });

	    if(currentSectionIndex === 3){
	      $(document).find(".form-wrapper .section").first().addClass("is-active");
	      $(document).find(".steps li").first().addClass("is-active");
	    }
	  });
	});

</script>
<div class="page-main-style">
글쓰기 페이지

  <div class="container">
    <div class="wrapper">
      <ul class="steps">
        <li class="is-active">Step 1</li>
        <li>Step 2</li>
        <li>Step 3</li>
      </ul>
      <form:form class="form-wrapper" id="feedWrite" action="feedWrite.do" commandName="feedVO">
        <fieldset class="section is-active">
          <h3>주제와 공개범위를 선택해주세요</h3>
		<!-- 타입 정하는 버튼 -->
		      <form:select id="feed_type" path="feed_type">
		         <form:option value="" label="글 주제 선택 " />
		         <form:option value="1" label="식단" />
		         <form:option value="2" label="운동" />
		      </form:select>
		<!-- 공개범위 설정하는 버튼 -->
		      <form:select id="feed_auth" path="feed_auth">
		         <form:option value="" label="공개범위를 선택해주세요" />
		         <form:option value="0" label="나만보기" />
		         <form:option value="1" label="트레이너만 공개" />
		         <form:option value="2" label="팔로워 공개" />
		         <form:option value="3" label="전체공개" />
		      </form:select>
          <div class="button">Next</div>
        </fieldset>
        <fieldset class="section">
          <h3>업로드할 사진 혹은 동영상을 선택해주세요</h3>
          <div class="row cf">
            <div class="four col">
              <input type="radio" name="r1" id="r1" checked>
              <label for="r1"> 
                <h4>Designer</h4>
              </label>
            </div>
            <div class="four col">
              <input type="radio" name="r1" id="r2"><label for="r2">
                <h4>Developer</h4>
              </label>
            </div>
            <div class="four col">
              <input type="radio" name="r1" id="r3"><label for="r3">
                <h4>Project Manager</h4>
              </label>
            </div>
          </div>
          <div class="button">Next</div>
        </fieldset>
        <fieldset class="section">
          <h3>Choose a Password</h3>
          <input type="password" name="password" id="password" placeholder="Password">
          <input type="password" name="password2" id="password2" placeholder="Re-enter Password">
          <input class="submit button" type="submit" value="Sign Up">
        </fieldset>
        <fieldset class="section">
          <h3>Account Created!</h3>
          <p>Your account has now been created.</p>
          <div class="button">Reset Form</div>
        </fieldset>
      </form:form>
    </div>
  </div>
<%--    <form:form id="feedWrite" action="feedWrite.do" commandName="feedVO" enctype="multipart/form-data">
<!-- 타입 정하는 버튼 -->
      <form:select id="feed_type" path="feed_type">
         <form:option value="" label="글 타입 선택 " />
         <form:option value="1" label="식단" />
         <form:option value="2" label="운동" />
      </form:select>
<!-- 공개범위 설정하는 버튼 -->
      <form:select id="feed_auth" path="feed_auth">
         <form:option value="" label="공개범위를 선택해주세요" />
         <form:option value="0" label="나만보기" />
         <form:option value="1" label="트레이너만 공개" />
         <form:option value="2" label="팔로워 공개" />
         <form:option value="3" label="전체공개" />
      </form:select>
<!-- 사진업로드 버튼, 사진 미리보기 -->
      <ul>
			<li><label for="upload" class="upload">이미지 파일업로드</label> <input
				type="file" name="upload" id="upload"
				accept="image/gif,image/png,image/jpeg" style="visibility: hidden;">
			</li>
			<li><img id="feed_file" class="feed_file" alt="feed image"
				style="max-width: 350px; max-height: 350px; display: none; position: relative; left: 130px;">
			</li>
			<li><input type="button" value="파일업로드 취소" id="cancel_upload"
				style="display: none; width: 130px; margin-left: 130px"></li>
		</ul>
      
<!-- content 작성란 -->
      <form:textarea path="feed_content" placeholder="내용을 작성해주세요"/>
      
<!-- 취소(목록으로 이동), 등록 버튼 -->
      <input type="submit" value="전송">
      
   </form:form> --%>

</div>
