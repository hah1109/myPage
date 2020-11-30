<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	commentList();	
	$('#submit_comment').click(function(){
		if($('#comment').val()==''){
			alert('댓글 내용을 입력해주세요!');
			return;
		}
		$.ajax({
			url:'submit_freecomment.do',
			type:'post',
			data:{comment:$('#comment').val(),
				free_num:$('#free_num').val(),
				'mem_num':mem_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data == 1){
					$('#comment').val('');
				}
				commentList();
			},
			error:function(){
				alert('네트워크 오류 발생!');
			}
		});
	});	
});
var mem_num = ${user.mem_num};
function commentList(){
    $.ajax({

    	url : 'list_comment.do',
        type : 'get',
        data : {free_num:$('#free_num').val()},
        success : function(data){			
            var a ='';
            $.each(data, function(key, value){
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin:10px; padding-bottom:10px;">';
                a += '<div><b>'+value.mem_id + '</b>';
                if(value.mem_auth == 1){
                	a += '&nbsp;일반회원';	
                }else if(value.mem_auth == 2){
                	a += '&nbsp;트레이너';
                }else if(value.mem_auth == 0){
                	a += '&nbsp;관리자';
                }
                a += '&nbsp;' + value.str_date;
				if(value.mem_num == mem_num){
				a += '&nbsp;|&nbsp;<span class="commentModify'+value.freec_num+'"><a onclick="commentUpdate('+value.freec_num+',\''+value.free_comment+'\');">수정</a>';
                a += '&nbsp;|&nbsp;<a onclick="commentDelete('+value.freec_num+');">삭제</a> </span>'; 
				}            	                	                
                a += '<div class="commentContent'+value.freec_num+'"> <p>'+value.free_comment +'</p></div></div>';
                a += '<div class="replyComment'+value.freec_num+'"> <a onclick="select_replyComment('+value.freec_num+')"> 댓글 '+value.countComment+'</a></div>'
				a += '</div>';
            });		
			            
            $(".commentList").html(a);
        }
    });
};

function commentUpdate(freec_num, free_comment){
	var a = '';
	var b = '';
	a += '<a onclick="commentUpdateCommit('+freec_num+');">수정완료</a>';
	a += '&nbsp;|&nbsp;<a onclick="commentDelete('+freec_num+');">삭제</a>';
  	b += '<div class="input-group">';
    b += '<input type="text" class="form-control" id="content_'+freec_num+'" value="'+free_comment+'"/>';
    b += '</div>';
    $('.commentModify'+freec_num).html(a);
    $('.commentContent'+freec_num).html(b);		
}


function commentUpdateCommit(freec_num){
	var update_comment = $('#content_'+freec_num).val();
	$.ajax({
		url:'update_freecomment.do',
		type:'post',
		data:{'freec_num':freec_num,
			  'update_comment':update_comment},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data == 1){
				alert('댓글 수정 완료');
				commentList();
			}
		},
		error:function(){
			alert('네트워크 오류 발생!');
		}
	});
}

function commentDelete(freec_num){
	var choice = window.confirm('댓글을 삭제하시겠습니까?');
	if(!choice){
		return;
	}
	$.ajax({
		url:'delete_freecomment.do',
		type:'post',
		data:{'freec_num':freec_num},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data == 1){
				commentList();
			}
		},
		error:function(){
			alert('댓글삭제 네트워크오류');
		}
	});
}

/* 댓글의댓글 글읽기 및 쓰기 */
function select_replyComment(freec_num){
	commentList();
 	 $.ajax({
    	url : 'list_replyComment.do',
        type : 'get',
        data : {'freec_num':freec_num},
        success : function(data){					
            var a ='';
            a += '<a onclick="reset_replyComment('+freec_num+')">댓글접기</a>'
            $.each(data, function(key, value){
	            a += '<div class="list_replyComment" style="border-top:1px solid darkgray; margin:10px; padding:10px;"><b>'+value.mem_id + '</b>';
	            a += '&nbsp;&nbsp;'+value.rfreec_comment + '&nbsp;&nbsp;';
	            if(mem_num == value.mem_num){
	            a += '|&nbsp;<a onclick="delete_replyComment(' + value.rfreec_num +','+ freec_num + ');">삭제</a>';
	            }
	            a += '</div>';
            });
			a += '<input type="text" id="replyComment_content" style="padding-left: 10px;" placeholder="답댓글을 입력해주세요">';
			a += '<input type="button" value="등록" onclick="submit_replyComment('+freec_num+');">';
			a += '<input type="button" value="취소" onclick="cancel_replyComment('+freec_num+');">';
			$('.replyComment'+freec_num).html(a);
		},
		error : function(){
			alert('댓글의댓글 불러오기 네트워크 오류');
		}
 	 }); 
}

/* 댓글의댓글 읽기 다시 숨기기 */
function reset_replyComment(freec_num){
	commentList();
}

/* 댓글의 댓글 글 입력하기 */
function submit_replyComment(freec_num){
	if($('#replyComment_content').val()==''){
		alert('내용을 입력해주세요');
		return;
	}
	
	$.ajax({
		url:'submit_replyComment.do',
		type:'post',
		data:{replyComment_content:$('#replyComment_content').val(),
			  'freec_num':freec_num,
			  'mem_num':mem_num},
		success:function(data){
			if(data==1){
				alert('댓글이 입력되었습니다.');
				$('#replyComment_content').val('');
				select_replyComment(freec_num);
			}
		},
		error:function(){
			alert('댓글의 댓글 입력 네트워크 오류');	
		}
	});
}

/* 댓글의 댓글 글 쓰다가 취소하기(쓴 내용 치우기) */
function cancel_replyComment(freec_num){
	select_replyComment(freec_num);
}

/* 댓글의 댓글 삭제하기 */
function delete_replyComment(rfreec_num,freec_num){
	var choice = window.confirm('삭제하시겠습니까?');
	if(choice){
		$.ajax({
			url:'delete_replyComment.do',
			type:'post',
			data:{'rfreec_num':rfreec_num},
			success:function(data){
				if(data==1){
					select_replyComment(freec_num);
				}				
			},
			error:function(){
				alert('댓글의댓글 삭제 오류');
			}
		});
	}	
}
	
</script>
<div class="page-main-style">
	<h3>팁 게시판</h3>
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
    
    
</div>