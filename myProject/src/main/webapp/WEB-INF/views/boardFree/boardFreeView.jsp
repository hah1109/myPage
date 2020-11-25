<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){				
		var mem_num = ${user.mem_num};
		commentList();
		
		function commentList(){
		    $.ajax({
		        url : 'list_comment.do',
		        type : 'get',
		        data : {free_num:$('#free_num').val()},
		        success : function(data){					
		            var a ='';
		            $.each(data, function(key, value){
		                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		                a += '<div><b>'+value.mem_id + '</b>';
						a += '&nbsp;' + value.mem_auth_s;	
						if(value.mem_num == mem_num){
						a += '&nbsp;|&nbsp;<span><a onclick="commentUpdate('+value.freec_num+',\''+value.free_comment+'\');">수정</a>';
		                a += '&nbsp;|&nbsp;<a onclick="commentDelete('+value.mem_id+');">삭제</a> </span>'; 
						}	            	                	                
		                a += '<div class="commentContent'+value.freec_num+'"> <p>'+value.free_comment +'</p></div>';						
						a += '</div></div>';
		            });		
					            
		            $(".commentList").html(a);
		        }
		    });
		};
		
		
		
		$('#submit_comment').click(function(){
			if($('#comment').val()==''){
				alert('댓글 내용을 입력해주세요!');
				return;
			}
			alert('${user.mem_num}');

			$.ajax({
				url:'submit_freecomment.do',
				type:'post',
				data:{comment:$('#comment').val(),
					free_num:$('#free_num').val(),
					'mem_num':mem_num},
					/* mem_num:$('#mem_num').val()}, */
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					if(data == 1){
						$('#comment').val('');
					}
					commentList();
				}
			});
		});
		
		
		
		
	});
	
	
	function commentUpdate(freec_num, free_comment){
		var a = '';
	  	a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" name="content_'+freec_num+'" value="'+free_comment+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+freec_num+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.commentContent'+freec_num).html(a);
		
	}
	
	
</script>
<div class="page-main-style">
	<h3>자유 게시판</h3>
	<h2>${boardFree.free_title}</h2>
	<ul>
		<li>
			<b><font size="4">${boardFree.mem_id}</font></b>
			<c:if test="${boardFree.mem_auth==0}">
				관리자
			</c:if>
			<c:if test="${boardFree.mem_auth==1}">
				일반회원
			</c:if>
			<c:if test="${boardFree.mem_auth==2}">
				트레이너
			</c:if>
		</li>
		<li>
			최근수정일: ${boardFree.free_modify_date}
		</li>
		<li>
			조회수 : ${boardFree.free_hit}
		</li>		
	</ul>
	<hr size="1" width="100%">
	<c:if test="${!empty boardFree.free_filename}">
		<img src="imageView.do?free_num=${boardFree.free_num}"  style="max-width:500px; max-height:500px;">
	</c:if>
	<p>
		${boardFree.free_content}
	</p>
	
	<hr size="1" width="100%">
	
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num == boardFree.mem_num}">
			<input type="button" value="수정" onclick="location.href='modify.do?free_num=${boardFree.free_num}'">
			<input type="button" value="삭제" id="btn_delete">
		</c:if>
		<script>
			var btn_delete = document.getElementById('btn_delete');
			btn_delete.onclick=function(){
				var choice = window.confirm('삭제하시겠습니까?');
				if(choice){
					location.href='delete.do?free_num=${boardFree.free_num}';
				}
			};
		</script>
		<input type="button" value="목록으로" onclick="location.href='list.do'">	
	</div>
	
	<form id="commentbox">
		<input type="hidden" id="free_num" value="${boardFree.free_num}">
		<input type="text" id="comment" name="comment" placeholder="댓글을 입력하세요.">
		<input type="button" id="submit_comment" value="등록">
	</form>
	<h3>댓글</h3>
	<hr>


	
	<div class="container">
        <div class="commentList"></div>
    </div>
    
    
	 

	
<%-- 	<c:if test="${!empty boardFree.commentList }">
		<c:forEach var="freeBoardComment" items="${freeCommentList}">			
			<input type="hidden" id="mem_num" value="${freeBoardComment.freec_num}">
			<p>
			<b>${freeBoardComment.mem_id}</b>
			<c:if test="${freeBoardComment.mem_auth==1}">
			일반회원
			</c:if>
			<c:if test="${freeBoardComment.mem_auth==2}">
			트레이너
			</c:if>
			${freeBoardComment.freec_modify_date}
			<c:if test="${user.mem_num == freeBoardComment.mem_num}">
				<input type="button" value="수정" id="modify_comment">
				<input type="button" value="삭제" id="delete_comment">
			</c:if>
			</p>			
			${freeBoardComment.free_comment}					
		</c:forEach>
	</c:if> --%>
</div>