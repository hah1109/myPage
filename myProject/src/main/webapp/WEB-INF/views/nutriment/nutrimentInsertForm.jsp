<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nutrimentInsert.css">
<div id="nutriInsertForm">
	<h2>영양 성분 등록</h2>
	<div id="main-div">
		<div id="sub-div">
			<form:form commandName="nutrimentVO" action="nutrimentInsertForm.do">
				<ul>
					<li>
						<label for=food_name>식품 이름</label><br>
						<form:input path="food_name"/><br>
						<form:errors path="food_name" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_g">단위 그램(g)</label><br>
						<form:input path="food_g"/>g
						<form:errors path="food_g" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_kcal">총 열량</label><br>
						<form:input path="food_kcal"/>kcal
						<form:errors path="food_kcal" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_fat">총 지방</label><br>
						<form:input path="food_fat"/>g
						<form:errors path="food_fat" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_col">콜레스테롤</label><br>
						<form:input path="food_col"/>mg
						<form:errors path="food_col" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_na">나트륨 </label><br>
						<form:input path="food_na"/>mg
						<form:errors path="food_na" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_carb">총 탄수화물</label><br>
						<form:input path="food_carb"/>g
						<form:errors path="food_carb" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_df">식이섬유</label><br>
						<form:input path="food_df"/>g
						<form:errors path="food_df" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_sugars">당분</label><br>
						<form:input path="food_sugars"/>g
						<form:errors path="food_sugars" cssClass="error-color"/>
					</li>
					<li>
						<label for="food_protein">단백질</label><br>
						<form:input path="food_protein"/>g
						<form:errors path="food_protein" cssClass="error-color"/>
					</li>
		
				</ul>
				<div class="align-center">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='nutriList.do'">
				</div>
			</form:form>
		</div>
	</div>
</div>