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
		
		var free_photo;
		$('#upload').change(function(){
			var upload = document.getElementById('upload');
			
			free_photo = upload.files[0];
			if(free_photo){
				var reader = new FileReader();
				reader.readAsDataURL(free_photo);
				
				reader.onload = function(){
					$('.free_file').attr('src',reader.result).show();
				}				
			}
		});
		
		$('#cancel_upload').click(function(){
			$('#upload').val("");
			$('.free_file').hide();
		});
		
	});
</script>

<div class="page-main-style">
	<h2>자유 게시판</h2>
  	<form:form commandName="freeBoardVO" action="write.do"
	                      		    enctype="multipart/form-data"> 
 		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="free_title">제목</label>
				<form:input path="free_title"/>
				<form:errors path="free_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="free_content">내용</label>
				<form:textarea path="free_content" cols="40" rows="10"/>
				<form:errors path="free_content" cssClass="error-color"/>
			</li>
 			<li>
				<label for="upload">이미지 파일업로드</label>
				<input type="file" name="upload" id="upload"
				                     accept="image/gif,image/png,image/jpeg">
				<img id="free_file" class="free_file" alt="free image" style="max-width:500px; max-height:500px; display:none;">
			</li>
			<li>
				<input type="button" value="파일업로드 취소" id="cancel_upload" style="display:none;">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="글등록">
			<input type="button" value="목록"
			       onclick="location.href='write.do'">
		</div> 
	</form:form> 
</div>


