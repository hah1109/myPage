<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
	<h2>영양 성분 등록</h2>
	<form:form commandName="nutrimentVO" action="/nutriment/nutrimentInsertForm.do">
		<ul>
			<li>
				<label for=foodName>식품 이름</label>
				<form:input path="foodName"/>
				<form:errors path="foodName" cssClass="error-color"/>
			</li>
			<li>
				<label for="foodWeight">단위 그램(g)</label>
				<form:input path="foodWeight"/><label>g</label>
				<form:errors path="foodWeight" cssClass="error-color"/>
			</li>
			<li>
				<label for="kcal">총 열량</label>
				<form:input path="kcal"/><label>kcal</label>
				<form:errors path="kcal" cssClass="error-color"/>
			</li>
			<li>
				<label for="fat">총 지방</label>
				<form:input path="fat"/><label>g</label>
				<form:errors path="fat" cssClass="error-color"/>
			</li>
			<li>
				<label for="col">콜레스테롤</label>
				<form:input path="col"/><label>mg</label>
				<form:errors path="col" cssClass="error-color"/>
			</li>
			<li>
				<label for="na">나트륨 </label>
				<form:input path="na"/><label>mg</label>
				<form:errors path="na" cssClass="error-color"/>
			</li>
			<li>
				<label for="carb">총 탄수화물</label>
				<form:input path="carb"/><label>g</label>
				<form:errors path="carb" cssClass="error-color"/>
			</li>
			<li>
				<label for="dietaryFiber">식이섬유</label>
				<form:input path=""/><label>g</label>
				<form:errors path="" cssClass="error-color"/>
			</li>
			<li>
				<label for="sugars">당분</label>
				<form:input path="sugars"/><label>g</label>
				<form:errors path="sugars" cssClass="error-color"/>
			</li>
			<li>
				<label for="protein">단백질</label>
				<form:input path="protein"/><label>g</label>
				<form:errors path="protein" cssClass="error-color"/>
			</li>

		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='nutriList.do'">
		</div>
	</form:form>
</div>