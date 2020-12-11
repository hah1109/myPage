<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#change').click(function(){
		if($('#hw_link').val() == null || $('#hw_link').val() == ''){
			alert('링크를 입력해주세요');
			return;
		}else if($('#hw_part').val() == null || $('#hw_part').val() == ''){
			alert('부위를 입력해주세요');
			return;
		}else{
			var link = $('#hw_link').val();
			var pattern ='';
			var io_pattern=0;
			var vid='';
			if(link.includes('iframe')) {
				pattern = 'embed/';
				io_pattern = link.indexOf(pattern);
				vid = link.substring((io_pattern + pattern.length),
						(link.substring(io_pattern).indexOf('\" frameborder')+io_pattern));
			}else if(link.includes('youtu.be')) {
				pattern = 'youtu.be/';
				io_pattern = link.indexOf(pattern);
				vid = link.substring(io_pattern + pattern.length);
			}else if(link.includes('ab_channel')) {
				pattern = '?v=';
				io_pattern = link.indexOf(pattern);
				vid = link.substring((io_pattern + pattern.length),
						(link.substring(io_pattern).indexOf('&ab_')+io_pattern));
			}else {
				alert(link+'2');
				alert('잘못된 링크 정보입니다.');
				return ;
			}//vid  추출

			alert(vid);
			var vtitle;
			$.get("https://www.googleapis.com/youtube/v3/videos", {
				part : 'snippet',
				maxResults : 50,
				id : vid,
				key : 'AIzaSyBHl4ghzq0VGQFdS-bv52wuwUS3vcQrRsA',
			}, function(data) {
				$.each(data.items, function(i, item) {
					vtitle = item.snippet.title;
					vtitle += '('; 
					vtitle += $('#hw_part').val();
					vtitle += ')';
					alert(vtitle);
					$('#hw_title').val(vtitle);
				})

			});
		}
	});
	
});

</script>
	<h2>트레이닝영상 추가</h2>
	<form:form commandName="hwBoardVO" action="hwBoardWrite.do"
	                        enctype="multipart/form-data">
		<ul>
			<li>
				<label for="hw_title">제목</label>
				<form:input path="hw_title" id="hw_title" name="hw_title"/>
			</li>
			<li>
				<label for="hw_part">부위</label>
				<form:input path="hw_part"/>
			</li>
			<li>
				<label for="hw_kcal">소모 칼로리</label>
				<input type="number" id="hw_kcal" name="hw_kcal" value="${hwBoardVO.hw_kcal}"/>
			</li>
			<li>
				<label for="hw_link">링크</label>
				<form:input path="hw_link" id="hw_link" name="hw_link"/>
			</li>
		</ul>	
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록"
			       onclick="location.href='hwList.do'">
			<input type="button" value="변환" id="change">
			
		</div>
	</form:form>