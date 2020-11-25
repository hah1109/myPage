<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
	<h2>일일 권장 영양소 계산기</h2>
	<form:form action="nutrimentCal.do">
		<ul>
			<li>
				<label for="height">[나의 키]</label>
				<input type="number" id="height" name="height"/>
				<form:errors path="height" cssClass="error-color"/>
			</li>
			<li>
				<label for="weight">[나의 체중]</label>
				<input type="number" id="weight" name="weight"/>
				<form:errors path="weight" cssClass="error-color"/>
			</li>
			<li>
				<label for="age">[나의 나이]</label>
				<input type="number" id="age" name="age"/>
				<form:errors path="weight" cssClass="error-color"/>
			</li>
			<li> <label for="gender">[성별]</label><br>
				<ul>
					<li>
						<input type="radio" id="gender-f" name="gender" value="f" checked="checked">여성<br>
					</li>
					<li>
		  				<input type="radio" id="gender-m" name="gender" value="m">남성<br>
		  			</li>
  				</ul>
  			</li>
			<li> <label for="type">나의 타입</label><br>
				<ul>
					<li>
						<input type="radio" id="fast" name="type" value="fast" checked="checked">빠른 체중 감량<br>
					</li>
					<li>
		  				<input type="radio" id="normal" name="type" value="normal">적당한 체중 감량<br>
		  			</li>
		  			<li>
		  				<input type="radio" id="healthy" name="type" value="healthy">건강한 식습관<br>
		  			</li>
		  			<li>
		  				<input type="radio" id="low" name="type" value="low">저강도 운동<br>
		  			</li>
		  			<li>
		  				<input type="radio" id="high" name="type" value="high">고강도 운동<br>
		  			</li>
  				</ul>
  			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
		</div>
		
		
	</form:form>
</div>