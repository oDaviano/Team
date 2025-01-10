<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<html lang="ko" class="">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta name="apple-mobile-web-app-title" content="Default">
<meta name="robots" content="no-index, follow">
<meta name="title" content="">
<meta name="author" content="">
<meta name="content" content="">
<meta name="keywords" content="">
<meta name="description" content="빈자리 description">
<title>빈자리</title>

<!-- <link type="image/png" rel="shortcut icon" href=""> -->

<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/assets/css/font.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/assets/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/assets/css/tmp_njw.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/assets/css/tmp_peg.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/lib/swiper-bundle.min.css">

<script type="text/javascript"
	src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/lib/swiper-bundle.min.js"></script>

<script type="text/javascript"
	src="${contextPath}/resources/js/common.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<script>
$(function(){
	var session='<%=session.getAttribute("isLogIn")%>';

	  if(session==null || session=='null'){
		  //window.location.replace('${contextPath}/member/loginForm.do');
		 console.log(session);
	   // location.href=loginForm;
	  }
});
</script>
<body>
    <div class="container">
        <header class="header">
            <div class="car-icon">
                <a href="${contextPath}/main.do" id="carIconLink">
                    <img src="${contextPath}/resources/assets/images/car-icon.png" alt="Car Icon">
                </a>
            </div>
            <h1 class="header-title">회원 정보</h1>
            <div id="button_menu" class="menu-icon">
                <img src="${contextPath}/resources/assets/images/List.png" alt="menu icon">
            </div>
        </header>

        <main class="main-content">
            <div class="info-box">
                <div class="info-item">${member.getName()}님</div>
                <div class="info-item">이메일: ${member.getEmail()}</div>
                <div class="info-item">핸드폰 번호: ${member.getPhone()}</div>
                <div class="info-item">차량 번호: ${member.getCarnum()}</div>
                <div class="info-item">적립금: ${member.getMileage()} point</div>
            </div>
        </main>

        <aside id="rightside" >
                    <section class="sidebar">
                        <article class="sidebar_title">
                            <div class="ux-title">
                                <div class="account_name">
                                    <img src = "${contextPath}/resources/assets/images/Account.png" width="70" height="70"> 
                                    <div>OOO님</div>
                                </div>
                            
                            <div class="sideclose">
                                <button type="button" class="ux-button icon-only button-menu button-close" tabindex="0">
                                    X
                                </button>
                            </div>
                        </div>
                        </article>
                        <article>
                    <div class="main">
                        <div class="menu-list">
                            <ul>               
                                <c:choose>
                                <c:when test="${isLogOn == true  && member!= null}">                                
                                     <li><a href="/pages/user_info.html" class="ux-link">회원 정보</a></li>
                                <li><a href="/pages/list_reservation.html" class="ux-link">예약 내역 조회</a></li>
                                <li><a href="/pages/user_info_edit.html" class="ux-link">개인 정보 수정</a></li>
                                             <li><a href="${contextPath}/member/logout.do" class="ux-link">로그아웃</a></li>
                                </c:when>
                                <c:otherwise>
                                     <li><a  href="${contextPath}/member/loginForm.do"class="ux-link button-mob-sign in">로그인</a></li>
                                     <li><a href="/pages/list_reservation.html" class="ux-link">예약 내역 조회</a></li>
                                
                                </c:otherwise>
        
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </article>
    </section>
    
        </aside>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // 메뉴 열기
            document.getElementById('button_menu').addEventListener('click', function () {
                document.querySelector('aside').classList.add('active');
            });

            // 메뉴 닫기
            document.getElementById('closeMenu').addEventListener('click', function () {
                document.querySelector('aside').classList.remove('active');
            });
        });
    </script>
</body>
</html>
