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
  <meta http-equiv="Content-Style-Type" content="text/css">
  <meta http-equiv="Content-Script-Type" content="text/javascript">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="format-detection" content="telephone=no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
  <meta name="apple-mobile-web-app-title" content="Default">
  <meta name="robots" content="no-index, follow">
  <meta name="title" content="">
  <meta name="author" content="">
  <meta name="content" content="">
  <meta name="keywords" content="">
  <meta name="description" content="빈자리 description">
  <title>빈자리</title>

	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_peg.css">

  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/swiper-bundle.min.css">

  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/swiper-bundle.min.js"></script>

  <script type="text/javascript" src="${contextPath}/resources/js/temp_peg.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=co1ous7685&submodules=geocoder"></script>

</head>
<body id="mainbody">
    <div class="container">
        <header>
                <!-- <div class="observer-layout"></div> -->
                <!-- <section class="header-pc1 load">.load: setCommon 함수로 AJAX 로드</section> -->
                <!-- <section class="header-mob load">.load: setCommon 함수로 AJAX 로드</section> -->

            <section class="title_header" >
                <article class="main_header">
                    <div id="header_bg">
            <div id="logo">          
                <img src = "${contextPath}/resources/assets/images/car-icon.png" width="100" height="90"> </div>            
            <div id="button_menu" class="button-menu open-menu">         
                <img src = "${contextPath}/resources/assets/images/List.png" width="70" height="70"> 
           </div>
            </div>
                </article>

        </section>

		</header>
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

        <main id="mainpage">
        <section class="area_search">
            <div class="search-component">
                <form class="ui-form search">                           
                 <div class="ui-input">
                  <div class="input outlined">
                      <input id="search_name" name="search_name" type="text" class="custom-text" placeholder="주소를 검색해보세요">
                  </div>
                    </div>  
                    <div class="ux-button-bar">
                    <button id="button_search" type="button" class="ux-button contained primary"><span class="label">검색</span></button>
                    </div>
                    </form>

                </div>
        </section>

            <section>
                <article>
                        <div id="map"></div>
                        <div class="popup">
                    <div id="facname">주차장명</div>
                    <div class="info">
                <ul >
                    <li>
                        <div>주소: </div><div  id="address"></div></li>
                    <li ><div>요금: </div><div id="fee"></div></li>
                    <li><div>구분: </div><div id="category"></div></li>
                </ul>
            </div>
                <div class="info_button_area">
                    <button class="ux-button contained primary" id="button_buy">주차권 구매</button>
                    <button class="ux-button primary" id="button_cancel">돌아가기</button>
                </div>
            </div>
                </article>  
           
            </section>
          
          
        </main>
    </div>
</body>
</html>