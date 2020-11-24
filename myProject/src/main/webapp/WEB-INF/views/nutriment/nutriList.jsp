<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>    
<script type="text/javascript">

	$(document).ready(function(){
		
		$('#nutrimentSearchForm').submit(function(){
			<%-- 유효성 체크 --%>
			if($('#foodName').val() == ''){
			
				var p = document.createElement('p');
				var pText = document.createTextNode('검색어를 입력해주세요.');
				var resultArea = document.getElementById('resultArea');
				
				resultArea.appendChild(p);
				p.appendChild(pText);
				
				$('#foodName').focus();

				return false;
			}

		});

	});
</script>
<div>
	<h2>영양성분 검색</h2>
	<section>
	<form id="nutrimentSearchForm" action="nutrimentSearch.do">
		<ul>
			<li>
				<input type="text" id="foodName" name="foodName"/>
			</li>
		</ul>
		<div>
			<input type="submit" value="검색">
		</div>
	</form>
	</section>
	
	<section>
		<div class="resultArea" id="resultArea">
			<!-- 표 영역 -->
		</div>
	</section>
	
	<!-- 관리자 로그인시 추가 버튼 활성화  -->
	<c:if test="${auth == 0}">
	<div class="aling-right">
		<input type="button" value="추가" onclick="location.href='${pageContext.request.contextPath}/nutriment/nutrimentInsertForm.do'">
	</div>
	</c:if>
	
</div>