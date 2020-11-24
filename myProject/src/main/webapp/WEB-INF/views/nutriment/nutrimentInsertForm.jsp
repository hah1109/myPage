<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
	<h2>영양 성분 등록</h2>
	<form:form commandName="nutrimentVO" action="nutrimentInsertForm.do">
		<ul>
			<li>
				<label for=foodName>식품 이름</label>
				<form:input path="foodName"/>
				<form:errors path="foodName" cssClass="error-color"/>
			</li>
			<li>
				<label for="foodWeight">단위 그램(g)</label>
				<form:input path="foodWeight"/>g
				<form:errors path="foodWeight" cssClass="error-color"/>
			</li>
			<li>
				<label for="kcal">총 열량</label>
				<form:input path="kcal"/>kcal
				<form:errors path="kcal" cssClass="error-color"/>
			</li>
			<li>
				<label for="fat">총 지방</label>
				<form:input path="fat"/>g
				<form:errors path="fat" cssClass="error-color"/>
			</li>
			<li>
				<label for="col">콜레스테롤</label>
				<form:input path="col"/>mg
				<form:errors path="col" cssClass="error-color"/>
			</li>
			<li>
				<label for="na">나트륨 </label>
				<form:input path="na"/>mg
				<form:errors path="na" cssClass="error-color"/>
			</li>
			<li>
				<label for="carb">총 탄수화물</label>
				<form:input path="carb"/>g
				<form:errors path="carb" cssClass="error-color"/>
			</li>
			<li>
				<label for="dietaryFiber">식이섬유</label>
				<form:input path="dietaryFiber"/>g
				<form:errors path="dietaryFiber" cssClass="error-color"/>
			</li>
			<li>
				<label for="sugars">당분</label>
				<form:input path="sugars"/>g
				<form:errors path="sugars" cssClass="error-color"/>
			</li>
			<li>
				<label for="protein">단백질</label>
				<form:input path="protein"/>g
				<form:errors path="protein" cssClass="error-color"/>
			</li>

		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='nutriList.do'">
		</div>
	</form:form>
</div>