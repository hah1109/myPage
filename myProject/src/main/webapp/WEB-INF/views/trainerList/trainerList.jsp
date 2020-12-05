<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
@gray-darker:               #444444;
@gray-dark:                 #696969;
@gray:                      #999999;
@gray-light:                #cccccc;
@gray-lighter:              #ececec;
@gray-lightest:             lighten(@gray-lighter,4%);

*,
*::before,
*::after { 
  box-sizing: border-box;
}


body {
  font-family: 'Roboto','Helvetica Neue', Helvetica, Arial, sans-serif;
  font-style: normal;
  font-weight: 400;
  letter-spacing: 0;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -moz-font-feature-settings: "liga" on;
}

img {
  height: auto;
  max-width: 100%;
  vertical-align: middle;
}

.btn {
  background-color: white;
  border: 1px solid @gray-light;
  border-radius: 1rem;
  color: @gray-dark;
  padding: 0.5rem;
  text-transform: lowercase;
}

.btn--block {
  display: block;
  width: 100%;
}
 
.cards {
  display: flex;
  flex-wrap: wrap;
  list-style: none;

}

.cards__item {
  display: flex;
  padding: 1rem;
  width: 25%;

}

.card {
  background-color: white;
  border-radius: 0.25rem;
  box-shadow: 0 20px 40px -14px rgba(0,0,0,0.25);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  &:hover {
    .card__image {
      filter: contrast(100%);
    }
  }
}

.card__content {
  display: flex;
  flex: 1 1 auto;
  flex-direction: column;
  padding: 1rem;
}

.card__image {
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  border-top-left-radius: 0.25rem;
  border-top-right-radius: 0.25rem;
  filter: contrast(70%);
  //filter: saturate(180%);
  overflow: hidden;
  position: relative;
  transition: filter 0.5s cubic-bezier(.43,.41,.22,.91);;
  &::before {
    content: "";
	  display: block;
    padding-top: 56.25%; // 16:9 aspect ratio
  }
  @media(min-width: 40rem) {
    &::before {
      padding-top: 66.6%; // 3:2 aspect ratio
    }
  }
}

.card__image--flowers {
  background-image: url(https://unsplash.it/800/600?image=82);
}

.card__image--river {
  background-image: url(https://unsplash.it/800/600?image=11);
}

.card__image--record {
  background-image: url(https://unsplash.it/800/600?image=39);
}

.card__image--fence {
  background-image: url(https://unsplash.it/800/600?image=59);
}

.card__title {
  color: @gray-dark;
  font-size: 1.25rem;
  font-weight: 300;
  letter-spacing: 2px;
  text-transform: uppercase;
}

.card__text {
  flex: 1 1 auto;
  font-size: 0.875rem;
  line-height: 1.5;
  margin-bottom: 1.25rem;
}


</style>

<c:if test="${count == 0}">
	<div>등록된 트레이너가 없습니다.</div>
</c:if>

<ul class="cards">
<c:if test="${count != 0}">
	<c:forEach var="trainer" items="${list}">
  <li class="cards__item">
    <div class="card">
      <c:if test="${empty trainer.mem_picName}">기본이미지 보여주기</c:if>
      <c:if test="${!empty trainer.mem_picName}">
      <img src="${pageContext.request.contextPath}/trainerList/trainerImage.do?mem_num=${trainer.mem_num}" 
				width="200" height="150">
      </c:if>
      
      
      <div class="card__content">
        <div class="card__title">${trainer.mem_name}</div>
        <p class="card__text">
        	
			<c:if test="${trainer.mem_gender == 1}">남자</c:if>
			<c:if test="${trainer.mem_gender == 2}">여자</c:if>
			<br>
			근무지 : ${trainer.g_addr}
			<br>
			<c:if test="${trainer.exp == 0}">신입 트레이너</c:if>
			<c:if test="${trainer.exp > 0 && trainer.exp < 5}">경력 ${trainer.exp}년 </c:if>
			<c:if test="${trainer.exp == 5}">경력 ${trainer.exp}년 이상 </c:if>			
			<br>
			<c:if test="${trainer.mem_intro == null}">최선을 다해 몸짱을 만들어 드리겠습니다!!</c:if>
			<c:if test="${trainer.mem_intro != null}">${trainer.mem_intro}</c:if>
			
         </p>
        <button class="btn btn--block card__btn" >
        	<a href="trainerListDetail.do?mem_num=${trainer.mem_num}">상세정보 보러가기</a>
        </button>
      </div>
    </div>
  </li>
  </c:forEach>
  </c:if>
</ul>
<div style="text-align:center;">${pagingHtml}</div>
    
    
    
<div class="clear"></div>

<div class="hr"></div>
<div class="space"></div>
</div>

</div><!-- Main ends here -->





<%-- <style>
.wrap{
	text-align:center;
}
</style>

<div class="wrap">

<c:if test="${count == 0}">
	<div>등록된 트레이너가 없습니다.</div>
</c:if>

<c:if test="${count != 0}">
	<c:forEach var="trainer" items="${list}">
	
		<div>
			<ul>
				<li>
					<c:if test="${trainer.mem_pic == null}">
						<a href="trainerListDetail.do?mem_num=${trainer.mem_num}">기본 이미지 보여주기</a>
					</c:if>
				</li>
			</ul>
		</div>
	
		<div>
			<ul>
				<li>이름 : ${trainer.mem_name}</li>
				
				<li>
					<c:if test="${trainer.mem_gender == 1}">남자</c:if>
					<c:if test="${trainer.mem_gender == 2}">여자</c:if>
				</li>
				
				<li>근무지 : ${trainer.g_addr}</li>
				
				<li>
					<c:if test="${trainer.exp == 0}">신입 트레이너</c:if>
					<c:if test="${trainer.exp > 0 && trainer.exp < 5}">경력 ${trainer.exp}년 </c:if>
					<c:if test="${trainer.exp == 5}">경력 ${trainer.exp}년 이상 </c:if>			
				</li>
				
				<li>
					<c:if test="${trainer.mem_intro == null}">최선을 다해 몸짱을 만들어 드리겠습니다!!</c:if>
					<c:if test="${trainer.mem_intro != null}">${trainer.mem_intro}</c:if>
				</li>
			</ul>
			<br>
		</div>
	</c:forEach>
	<div>${pagingHtml}</div>
</c:if>

</div>
 --%>


