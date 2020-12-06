<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout_feedReco.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#photo_btn').click(function(){
		//이미지 파일 선택  태그가 노출
		$('#photo_choice').show();
		//수정버튼을 숨김
		$(this).hide();
	});
		
	//원래 이미지 보관
	var photo_path;
	//변경 이미지를 보관
	var my_photo;
	$('#upload').change(function(){
		var upload = document.getElementById('upload');
		my_photo = upload.files[0];
		if(my_photo){
			var reader = new FileReader();
			reader.readAsDataURL(upload.files[0]);
			
			//사진업로드 전 미리보기 처리
			reader.onload = function(){
				//원래 이미지 보관
				photo_path = $('.my-photo').attr('src');
				//변경된 이미지를 미리보기 셋팅
				 $('.my-photo').attr('src',reader.result);
			};
		}
	});
	
	
	
	//이미지 초기화
	$('#photo_reset').click(function(){
		$('.my-photo').attr('src', photo_path);
		$('#upload').val('');
		$('#photo_choice').hide();
		$('#photo_btn').show();
	});
	
	$('#photo_submit').click(function(){
		if($('#upload').val()==''){
			alert('파일을 선택하세요');
			$('#upload').focus();
			return;
		}
		//파일 전송
		var form_data = new FormData();
		form_data.append('upload', my_photo);
		$.ajax({
			data:form_data,
			type:'POST',
			url:'updateMyPhoto.do',
			dataType:'json',
			cache:false,
			contentType:false,
			encType:'multipart/form-data',
			processData:false,
			success:function(data){
				if(data.result =='logout'){
					alert('로그인 후 사용하세요');
				}else if(data.result == 'success'){
					alert('프로필 사진이 수정 되었습니다.');
					$('#upload').val('');
					$('#photo_choice').hide();
					$('#photo_btn').show();
				}else{
					alert('파일전송 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	//나의 한마디 수정 하는 부분
	var be_intro;
	var af_intro;
	//수정 버튼을 누르면
	$('#intro_btn').click(function(){
		$('#intro_change').show();
		$('#intro').focus();
		$('#intro').removeAttr("readonly");
		be_intro = $('#intro').val();
		$(this).hide();
	});

	//글 초기화
	$('#intro_reset').click(function(){
		
		$('#intro_change').hide();
		$('#intro_btn').show();
		$('#intro').prop('readonly', true);
		$('#intro').val(be_intro);
	});
	
	//한마디 수정
	$('#intro_submit').click(function(){
		//파일 전송
		af_intro = $('#intro').val();
		$.ajax({
			url:'updateIntro.do',
			type:'POST',
			data:af_intro,
			dataType:'json',
			cache:false,
			success:function(data){
				if(data.result =='logout'){
					alert('로그인 후 사용하세요');
				}else if(data.result == 'success'){
					alert('프로필 사진이 수정 되었습니다.');
					$('#intro_change').hide();
					$('#intro_btn').show();
				}else{
					alert('파일전송 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
});
/*
 * 사진 수정 버튼, 소개글 수정 버튼 안보이도록 설정
  이미지 수정 처리, 소개글 수정 처리
 */
</script>

<div class="page-main-style">

<!-- 아이디 노출 -->
	<h1>${member.mem_id }</h1>
<!-- 프로필 사진 노출 -->
	<h2>프로필 사진</h2>
	<ul>
		<li>
			<c:if test="${empty member.mem_picName }">
				<img
					src="${pageContext.request.contextPath }/resources/images/blank.jpg"
					width="100" height="100" class="my-photo">
			</c:if> 
			<c:if test="${!empty member.mem_picName }">
				<img src="${pageContext.request.contextPath }/member/photoView.do"
					width="100" height="100" class="my-photo">
			</c:if>
		</li>
		<!-- 프로필 사진 수정버튼 -->
		<li>
			<div>
				<input type="button" value="수정" id="photo_btn">
			</div>
			<div id="photo_choice" style="display: none;">
				<input type="file" id="upload"
					accept="image/gif,image/png,image/jpeg"> <input
					type="button" value="전송" id="photo_submit"> <input
					type="button" value="취소" id="photo_reset">
			</div>
		</li>
	</ul>
	<!-- 프로필 소개 노출 -->
	<ul>
		<li>
			<c:if test="${empty member.mem_intro }">
				<label for="intro">나의 한마디 : </label>
				<input type="text" id="intro" name="intro"
					placeholder="하고 싶은 한 마디를 적어주세요" readonly/>
			</c:if> <c:if test="${!empty member.mem_intro }">
				<label for="intro">나의 한마디 : </label>
				<input type="text" id="intro" value=${member.mem_intro } readonly/>
			</c:if>
		</li>
		<!-- 프로필 소개 수정버튼 -->
		<li>
			<div>
				<input type="button" value="수정" id="intro_btn">
			</div>
			<div id="intro_change" style="display: none;"> 
				<input type="button" value="전송" id="intro_submit">
				<input type="button" value="취소" id="intro_reset">
			</div>
		</li>
	</ul>
	<hr size="1" width="100%">
	<!-- 글쓰기 버튼 -->
	<p class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='feedWrite.do'">
	</p>
</div>
<!-- 썸네일, type, content 노출 -->	
<c:if test="${count == 0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
</c:if>
<c:if test="${count != 0 }">
	<c:forEach var="feed" items="${list}">
		<div class="masonry">
			<div class="grid">
				<img src="photoView.do?feed_num=${feed.feed_num}">
				<div class="grid__body">
					<div class="relative">
						<a class="grid__link" target="_blank" href="feedDetail.do?feed_num=${feed.feed_num }"></a>
						<c:if test="${feed.feed_type == 1 }">
						<h1 class="grid__title">식단</h1>
						</c:if>
						<c:if test="${feed.feed_type == 2 }">
						<h1 class="grid__title">운동</h1>
						</c:if>
						<p class="grid__author">${feed.feed_auth }</p>
					</div>
					<div class="mt-auto">
						<span class="grid__tag">#${feed.feed_content }</span>
					</div>
				</div>
			</div>
		</div>	
	</c:forEach>
</c:if>
<!-- 마이 퍼스널 게시판 -->
<!-- 
			<td><a href="feedDetail.do?feed_num=${feed.feed_num}"><img
					width="460" height="300"
					src="https://img.youtube.com/vi/${hwBoard.hw_link}/0.jpg"></img></a></td> -->
<!-- 전송될때 mem_num을 전송한다 -->
<!-- 프로필 사진 클릭할 경우 사진의 mem_num과 현재 로그인된 mem_num과의 관계 파악 -->




