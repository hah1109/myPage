<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var pre_upload = $('#upload').val();
		var photo_path;
		var free_photo;

		$('#upload').change(function(){
			
			var upload = document.getElementById('upload');
			
			free_photo = upload.files[0];
			if(free_photo){
				var reader = new FileReader();
				reader.readAsDataURL(free_photo);
				
				reader.onload = function(){
					photo_path = $('#feed_nowfile').attr('src');
					$('#feed_file').attr('src',reader.result).show();
					$('#feed_nowfile').attr('src',reader.result).show();
				}				
			}
			
			$('.reset_photo').show();
			$('.isImgUpdate').val('0');
		});
		
		$('.reset_photo').click(function(){
			$(this).hide();
			$('#feed_nowfile').attr('src',photo_path).show();
			$('#upload').val('');
			$('.isImgUpdate').val('1');
		});
		
		$('.cancel_photo').click(function(){
			$('#feed_file').hide();
			$('#feed_nowfile').hide();
			$('#upload').val("");
		});
		
	});
</script>

<div class="page-main-style">
	<h2>자유 게시판</h2>
  	<form:form commandName="feedVO" action="feedUpdate.do"
	                      		    enctype="multipart/form-data">
	    <form:hidden path="feed_num"/>
		<ul style="margin-top:20px">
			<li>
				<label for="feed_type">글 타입</label>
				<form:input path="feed_type" class="type"/>
			</li><li>
				<label for="feed_auth">공개범위</label>
				<form:input path="feed_auth" class="auth"/>
			</li>
			<li>
				<label for="feed_content">내용</label>
				<form:textarea path="feed_content" cols="45" rows="15"/>
			</li>
			
			<li>
			<c:if test="${empty feedVO.feed_filename}">	 			
					<img name="feed_file" id="feed_file" style="max-width:350px; max-height:350px; display:none; position:relative; left:130px;">				
			</c:if>
					
			<c:if test="${!empty feedVO.feed_filename}">
				<input type=hidden value="1" name="isImgUpdate" class="isImgUpdate">
				<div class="align-center">
					<img src="imageView.do?feed_num=${feedVO.feed_num}" name="feed_nowfile" id="feed_nowfile" 
					style="max-width:350px; max-height:350px;">
				</div>				
			</c:if>
			</li>
			
			<li>		
				<label for="upload" class="upload">이미지 파일업로드</label>	
			</li>
			<li>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg" style="visibility:hidden;">				
				<input type="button" value="이미지 삭제" class="cancel_photo" class="delete_img" style="width:100px;">
				<input type="button" value="이미지 되돌리기" class="reset_photo" style="display:none; width:120px;">
			</li>
		</ul>
		
			
		<div class="align-right" style="padding-top:30px;">
			<input type="submit" value="수정">
			<input type="button" value="목록으로" onclick="location.href='feedList.do'">
		</div> 
		
	</form:form> 
</div>
<!-- 타입 수정하는 버튼 -->
<!-- 공개범위 수정하는 버튼 -->
<!-- 사진업로드 버튼, 사진 미리보기 -->
<!-- content 작성란 -->
<!-- 취소(목록으로 이동), 수정 버튼 -->