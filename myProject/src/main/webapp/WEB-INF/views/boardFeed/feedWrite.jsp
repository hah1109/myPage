<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page-main-style">
   <form:form id="feedWrite" action="feedWrite.do" commandName="feedVO">
<!-- 타입 정하는 버튼 -->
      <form:select id="feed_type" path="feed_type">
         <form:option value="" label="글 타입 선택 " />
         <form:option value="1" label="식단" />
         <form:option value="2" label="운동" />
      </form:select>
<!-- 공개범위 설정하는 버튼 -->
      <form:select id="feed_auth" path="feed_auth">
         <form:option value="" label="공개범위를 선택해주세요" />
         <form:option value="0" label="나만보기" />
         <form:option value="1" label="트레이너만 공개" />
         <form:option value="2" label="팔로워 공개" />
         <form:option value="3" label="전체공개" />
      </form:select>
<!-- 사진업로드 버튼, 사진 미리보기 -->
      <form:input type="file" path="feed_file" accept="imgage/gif,image/png,image/jpeg"/>
      
<!-- content 작성란 -->
      <form:textarea path="feed_content" placeholder="내용을 작성해주세요"/>
      
<!-- 취소(목록으로 이동), 등록 버튼 -->
      <input type="submit" value="전송">
      
   </form:form>

</div>
<!-- 타입 정하는 버튼 -->
<!-- 공개범위 설정하는 버튼 -->
<!-- 사진업로드 버튼, 사진 미리보기 -->
<!-- content 작성란 -->
<!-- 취소(목록으로 이동), 등록 버튼 -->