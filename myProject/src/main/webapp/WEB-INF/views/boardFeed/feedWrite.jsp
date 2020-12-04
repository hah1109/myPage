<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#upload').change(function(){
			$('#cancel_upload').show();
		});
		
		$('#cancel_upload').click(function(){
			$(this).hide();
		});
		
		var feed_photo;
		$('#upload').change(function(){
			var upload = document.getElementById('upload');
			
			feed_photo = upload.files[0];
			if(feed_photo){
				var reader = new FileReader();
				reader.readAsDataURL(feed_photo);
				
				reader.onload = function(){
					$('.feed_file').attr('src',reader.result).show();
				}				
			}
		});
		
		$('#cancel_upload').click(function(){
			$('#upload').val("");
			$('.feed_file').hide();
		});
		
	});
</script>
<div class="page-main-style">
   <form:form id="feedWrite" action="feedWrite.do" commandName="feedVO">
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
      
   </form:form>

</div>
<!-- 타입 정하는 버튼 -->
<!-- 공개범위 설정하는 버튼 -->
<!-- 사진업로드 버튼, 사진 미리보기 -->
<!-- content 작성란 -->
<!-- 취소(목록으로 이동), 등록 버튼 -->