<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#report_submit').submit(function(){
		var value = $('input[name="alarm"]:checked').val();
		var text = $('#text').val();
		if(value == 7){
			$('input[name="alarm"]:checked').val(text);
		}
	});
	
});
</script>
</head>
<body>
	<form id="report_submit" method="post" action="submitReport.do">
		<input type="hidden" name="board_type" value=0>
		<input type="hidden" name="board_num" value="${board_num}">
		<input type="radio" name="alarm" value="욕설">욕설,비방,차별,혐<br>
		<input type="radio" name="alarm" value="홍보">홍보,영리목적<br>
		<input type="radio" name="alarm" value="불법">불법 정보<br>
		<input type="radio" name="alarm" value="음란">음란, 청소년 유해<br>
		<input type="radio" name="alarm" value="개인정보">개인 정보 노출, 유포, 거래<br>
		<input type="radio" name="alarm" value="도배스팸">도배, 스팸<br>
		<input type="radio" name="alarm" value="7">기타<br>
		<textarea id="text"></textarea>
		<input type="submit" value="신고하기">
		<input type="button" value="취소" id="cancel">
	</form>
</body>
</html>