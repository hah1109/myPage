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
					photo_path = $('#sq_mfile').attr('src');
					$('#sq_file').attr('src',reader.result).show();
					$('#sq_mfile').attr('src',reader.result).show();
				}				
			}
			
			$('.reset_photo').show();
			$('.isImgUpdate').val('0');
		});
		
		$('.reset_photo').click(function(){
			$(this).hide();
			$('#sq_mfile').attr('src',photo_path).show();
			$('#upload').val('');
			$('.isImgUpdate').val('1');
		});
		
		$('.cancel_photo').click(function(){
			$('#sq_file').hide();
			$('#sq_mfile').hide();
			$('#upload').val("");
		});

		//글제목 글자수 제한
		$('#boardSubmit').submit(function(){
			if($('#free_title').val().length > 32){
				alert('글 제목이 제한 글자수를 초과했습니다.');
			}
			return false;
		});
		
	});
</script>

<div class="page-main-style">
	<h2>자유 게시판</h2>
  	<form:form commandName="boardSysqna" action="modify.do"
	                      		    enctype="multipart/form-data">
	    <form:hidden path="sq_num"/>
 		<form:errors element="div" cssClass="error-color"/>
		<ul style="margin-top:20px">
			<li>
				<label for="sq_title">제목</label>
				<form:input path="sq_title" class="title"/>
				<form:errors path="sq_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="sq_content">내용</label>
				<form:textarea path="sq_content" cols="45" rows="12"/>
				<form:errors path="sq_content" cssClass="error-color"/>
			</li>
			
			<li>
				<c:if test="${empty boardSysqna.sq_filename}">		 			
						<img name="sq_file" id="sq_file" style="max-width:350px; max-height:350px; display:none; position:relative; left:130px;">
				</c:if>
					
				<c:if test="${!empty boardSysqna.sq_filename}">
					<input type=hidden value="1" name="isImgUpdate" class="isImgUpdate">
					<div class="align-center">
						<img src="imageView.do?sq_num=${boardSysqna.sq_num}" name="sq_mfile" id="sq_mfile" style="max-width:300px; max-height:300px;">
					</div>					
				</c:if>	
			</li>
			
			<li>
				<label for="upload" class="upload">이미지 파일업로드</label>
			</li>
			
			<li>
			<div class="align-center">
				<input type="file" value="이미지 업로드 및 수정" name="upload" id="upload" accept="image/gif,image/png,image/jpeg" style="visibility:hidden;">					
				<input type="button" value="이미지 삭제" class="cancel_photo delete_img" style="width:100px;">
				<input type="button" value="이미지 되돌리기" class="reset_photo" style="display:none; width:120px;">
			</div>
			</li>	
		</ul>
		
			
		<div class="align-right">
			<input type="submit" value="수정">
			<input type="button" value="목록으로" onclick="location.href='list.do'">
		</div> 
	</form:form> 
</div>