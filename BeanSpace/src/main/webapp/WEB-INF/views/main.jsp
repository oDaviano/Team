<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%-- 	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>  --%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
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
            <section class="title_header" >
                <article class="main_header">
                    <div id="header_bg">
            <div id="logo">
                      <a href="${contextPath}/main.do" id="carIconLink">          
                <img src = "${contextPath}/resources/assets/images/car-icon.png" width="100" height="90"> 
                   </a>
                   </div>            
            <div id="button_menu" class="button-menu open-menu">         
                <img src = "${contextPath}/resources/assets/images/List.png" width="70" height="70"> 
           </div>
            </div>
                </article>

        </section>

		</header>
		    <jsp:include page="/WEB-INF/views/common/aside.jsp" />


        <main id="mainpage">
        <section class="area_search">
            <div class="search-component">
                <form class="ui-form search">                           
                 <div class="ui-input">
                  <div class="input outlined">
                      <input id="search_name" name="search_name" type="text" class="custom-text" placeholder="도시나 주소를 검색해보세요">
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
                     <form class="popup" action ="${contextPath}/reservation/reservation.do" method="post"  >
                    <div id="facname"  name="sfacname">주차장명</div>
                    <div class="info">
                <ul >
                    <li><div>주소: </div><div  id="address" name="saddress"></div></li>
                    <li><div>요금: </div><div id="fee"></div></li>
                    <li><div>구분: </div><div id="category"></div></li>
                </ul>
          
                <div class="info_button_area">
                    <button class="ux-button contained primary" id="button_buy"> 주차권 구매</a></button>
                    <div class="ux-button primary" id="button_cancel">돌아가기</div>
                </div>
            </div>
            </form>
                </article>  
           
            </section>
          
          
        </main>
    </div>
</body>
</html>