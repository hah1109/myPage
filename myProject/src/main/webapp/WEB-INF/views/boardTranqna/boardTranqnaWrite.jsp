<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#board_submit').submit(function(){
			if($('#tq_content').val()==''){
				alert('내용을 입력해 주세요');
				$('#tq_content').focus();
				return false;
			}
			
			if($('#tq_type').is(":checked")){
				alert("??");
				$('#tq_type').val('0');
				
			}
			
		});
		
		$('#upload').change(function(){
			$('#cancel_upload').show();
		});
		
		$('#cancel_upload').click(function(){
			$(this).hide();
		});
		
		var tq_photo;
		$('#upload').change(function(){
			var upload = document.getElementById('upload');
			
			tq_photo = upload.files[0];
			if(tq_photo){
				var reader = new FileReader();
				reader.readAsDataURL(tq_photo);
				
				reader.onload = function(){
					$('.tq_file').attr('src',reader.result).show();
				}				
			}
		});
		
		$('#cancel_upload').click(function(){
			$('#upload').val("");
			$('.tq_file').hide();
		});		
	});
</script>

<div class="page-main-style">
	<h2>트레이닝 문의 게시판</h2>
  	<form:form commandName="tranQnABoardVO" action="write.do" enctype="multipart/form-data" id="board_submit"> 
 		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:checkbox path="tq_type" value="1" label="트레이너에게만 공개"/>
			</li>
			<li>
				<label for="tq_title">제목</label>
				<form:input path="tq_title"/>
				<form:errors path="tq_title" cssClass="error-color"/>
			</li>			
			<li>
				<label for="tq_content">내용</label>
				<form:textarea path="tq_content" cols="40" rows="10"/>
				<form:errors path="tq_content" cssClass="error-color"/>
			</li>
 			<li>
				<label for="upload">이미지 파일업로드</label>
				<input type="file" name="upload" id="upload"
				                     accept="image/gif,image/png,image/jpeg">
				<img id="tq_file" class="tq_file" alt="tq image" style="max-width:400px; max-height:400px; display:none;">
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


