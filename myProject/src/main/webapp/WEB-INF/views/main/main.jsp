<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MainPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/swiper-bundle.min.css">

    <!--style -->
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        .swiper-container {
            width: 100%;
            height: 100%;
            margin-left: auto;
            margin-right: auto;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
    </style>
    
    <!-- main menu ul,li style -->
    <style>
	 	ul, ol, li { list-style:none; margin:0; padding:0; }
	   
	    ul.main-menu {}
	    ul.main-menu > li { display:inline-block; width:80px; padding:5px 10px; margin:5px; text-align:center; position:relative; }
	    ul.main-menu > li:hover { background:#fff; }
	    ul.main-menu > li ul.submenu { display:none; position:absolute; top:30px; left:0; }
	    ul.main-menu > li:hover ul.submenu { display:block; }
	    ul.main-menu > li ul.submenu > li { display:inline-block; width:80px; padding:5px 10px; background:#eee; border:1px solid #eee; text-align:center; }
	    ul.main-menu > li ul.submenu > li:hover { background:#fff; }
	</style>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
</head>

<body>

	<!-- ------------------------------------헤더------------------------------------- -->
	<!-- 우측 상단 메뉴 -->
	<div style="float:right">
		<!-- 로그인 상태 : 회원등급아이콘,id,알림아이콘,mypage,로그아웃,QnA 활성화 -->
		<c:if test="${!empty user}">
			[<span>${user.mem_auth}</span>]
			[<span>${user.mem_id}</span>]
			<a href="${pageContext.request.contextPath}">알림</a>
			<a href="${pageContext.request.contextPath}/member/myPageMember.do">MyPage</a>
			<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
			<a href="${pageContext.request.contextPath}/boardSysqna/list.do">QnA</a>
		</c:if>
			
		<!-- 비로그인 상태 : 회원가입,로그인 화성화 -->
		<c:if test="${empty user}">
			<a href="${pageContext.request.contextPath}/member/userType.do">회원가입</a>
			<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>	
		</c:if>
	</div>
	<!-- 우측 상단 메뉴 -->


	<!-- 헤더 메인 메뉴 없는 링크 임시로 main으로 통일 해 둠 -->
	<div id="main-header" class="align-center" style="z-index: 2;">
		<ul class="main-menu">
			<li class="main-logo">
				<a href="${pageContext.request.contextPath}/main/main.do">메인로고</a>
			</li>
			<li class="homeTraining">
				<a href="${pageContext.request.contextPath}/homeTraining/hwList.do">홈트레이닝</a>
				<ul class="ht-sub submenu" style="z-index: 2;">
					<li><a href="${pageContext.request.contextPath}/main/main.do">전신</a></li>
					<li><a href="${pageContext.request.contextPath}/main/main.do">어깨</a></li>
					<li><a href="${pageContext.request.contextPath}/main/main.do">가슴</a></li>
					<li><a href="${pageContext.request.contextPath}/main/main.do">등</a></li>
					<li><a href="${pageContext.request.contextPath}/main/main.do">하체</a></li>
					<li><a href="${pageContext.request.contextPath}/main/main.do">스트레칭</a></li>
				</ul>
			</li>
			<li class="nutriment">
				<a href="${pageContext.request.contextPath}/nutriment/nutrimentGuide.do">식단</a>
				<ul class="nutri-sub submenu" style="z-index: 2;">
					<li><a href="${pageContext.request.contextPath}/nutriment/nutrimentGuide.do">식단 가이드</a></li>
					<li><a href="${pageContext.request.contextPath}/nutriment/nutriList.do">영양성분 검색</a></li>
					<li><a href="${pageContext.request.contextPath}/nutriment/nutrimentCal.do">일일 권장 영양소</a></li>
				</ul>
			</li>
			<li class="training-diary">
				<a href="${pageContext.request.contextPath}/main/main.do">트레이닝 다이어리</a>
				<ul class="dt-sub submenu" style="z-index: 2;">
					<li><a href="${pageContext.request.contextPath}/main/main.do">피드</a></li>
					<li><a href="${pageContext.request.contextPath}/main/main.do">마이 퍼스널</a></li>
					<li><a href="${pageContext.request.contextPath}/main/main.do">탐색</a></li>
				</ul>
			</li>
			<li class="board">
				<a href="${pageContext.request.contextPath}/boardFree/list.do">게시판</a>
				<ul class="board-sub submenu" style="z-index: 2;">
					<li><a href="${pageContext.request.contextPath}/boardFree/list.do">자유 게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/boardTip/list.do">팁 게시판</a></li>
				</ul>
			</li>
			<li class="trainer">
				<a href="${pageContext.request.contextPath}/main/main.do">트레이너</a>
				<ul class="trainer-sub submenu" style="z-index: 2;">
					<li><a href="${pageContext.request.contextPath}/main/main.do">트레이너 리스트</a></li>
					<li><a href="${pageContext.request.contextPath}/boardTranqna/list.do">트레이너 Q&A</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<!-- ------------------------------------헤더------------------------------------- -->
	
	<!-- ------------------------------------바디------------------------------------- -->
    <!-- Swiper -->
  	<div class="swiper-container" style="z-index: 1;">
        <div class="swiper-wrapper">
            <div class="swiper-slide">image</div>
            <div class="swiper-slide">image</div>
            <div class="swiper-slide">Balanced Meal</div>
            <div class="swiper-slide">Board</div>
            <div class="swiper-slide">Trainer</div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
    

    <!-- Swiper JS 링크-->
    <script src="${pageContext.request.contextPath}/resources/js/swiper-bundle.min.js"></script>

    <!-- Swiper script  swiper 스크립트는 바디에 있어야 동작 하므로 옮기지 말 것-->
    <script>
        var swiper = new Swiper('.swiper-container', {
            direction: 'vertical',
            slidesPerView: 1,
            spaceBetween: 30,
            mousewheel: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    </script>
    
    <!-- ------------------------------------바디------------------------------------- -->
    
</body>
</html>