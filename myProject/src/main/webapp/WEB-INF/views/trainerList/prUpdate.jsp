<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<div>
	<ul>
		<li>
			<c:if test="${empty trainer.mem_pic}">기본 이미지 표시</c:if>
			<c:if test="${!empty trainer.mem_pic}">
				<img src="${pageContext.request.contextPath}/trainerList/photoOutPut.do" width="100" height="100">
			</c:if>
		</li>
		
		<li>
			<input type="button" value="사진등록">
			<input type="file" id="upload" accept="images/gif,images/png,images/jpeg">
			<input type="button" value="전송" id="photo_submit">
			<input type="button" value="취소" id="photo_reset">
		</li>
	</ul>
</div>

<div>
	<ul>
		<li>
			<input type="text" placeholder="최선을 다해 몸짱을 만들어 드리겠습니다!!">
		</li>
		
		<li>
			<input type="button" value="작성완료">
		</li>
	</ul>
</div>

<div>
	<ul>
		<li>
			<c:if test="${trainer.mem_intro == null}">자기소개: 최선을 다해 몸짱을 만들어 드리겠습니다!!</c:if>
			<c:if test="${trainer.mem_intro != null}">자기소개: ${trainer.mem_intro}</c:if>
		</li>
	</ul>
</div>






