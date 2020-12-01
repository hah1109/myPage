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
					$('.sq_file').attr('src',reader.result).show();
				}				
			}
		});
		
		$('#cancel_upload').click(function(){
			$('#upload').val("");
			$('.sq_file').hide();
		});
		
	});
</script>

<div class="page-main-style">
	<h2>자유 게시판</h2>
  	<form:form commandName="sysQnABoardVO" action="write.do"
	                      		    enctype="multipart/form-data"> 
 		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="sq_title">제목</label>
				<form:input path="sq_title"/>
				<form:errors path="sq_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="sq_content">내용</label>
				<form:textarea path="sq_content" cols="40" rows="10"/>
				<form:errors path="sq_content" cssClass="error-color"/>
			</li>
 			<li>
				<label for="upload">이미지 파일업로드</label>
				<input type="file" name="upload" id="upload"
				                     accept="image/gif,image/png,image/jpeg">
				<img id="sq_file" class="sq_file" alt="sq image" style="max-width:300px; max-height:300px; display:none;">
			</li>
			<li>
				<input type="button" value="파일업로드 취소" id="cancel_upload" style="display:none;">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="글등록">
			<input type="button" value="목록"
			       onclick="location.href='list.do'">
		</div> 
	</form:form> 
</div>


