<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_njw.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_peg.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/swiper-bundle.min.css">
  
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/swiper-bundle.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8ze2pCtEXZEBra8ProWgd2QGH69Ew8A4G6U6B6NC"></script>
</head>
<body>

       
   <header>
                <!-- <div class="observer-layout"></div> -->
                <!-- <section class="header-pc1 load">.load: setCommon 함수로 AJAX 로드</section> -->
                <!-- <section class="header-mob load">.load: setCommon 함수로 AJAX 로드</section> -->

            <section class="title_header" >
                <article class="main_header">
                    <div id="header_bg">
 <div class="car-icon">
                <a href="${contextPath}/main.do" id="carIconLink">
                    <img src="${contextPath}/resources/assets/images/car-icon.png" alt="Car Icon">
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
<%--                         <aside id="rightside" >
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
                                <li><a href="/pages/toList.do" class="ux-link">예약 내역 조회</a></li>
                                <li><a href="/pages/user_info_edit.html" class="ux-link">개인 정보 수정</a></li>
                                             <li><a href="${contextPath}/member/logout.do" class="ux-link">로그아웃</a></li>
                                </c:when>
                                <c:otherwise>
                                     <li><a  href="${contextPath}/member/loginForm.do"class="ux-link button-mob-sign in">로그인</a></li>
                                     <li><a href="/pages/toList.do" class="ux-link">예약 내역 조회</a></li>
                                
                                </c:otherwise>
        
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </article>
    </section>
    
        </aside> --%>
        <div class="container">	               
                    <h4>현재 비밀번호를 입력해주세요</h4>
                    <!-- 검색 입력 필드 추가 -->
                 <form action="${contextPath}/member/modMemberForm.do" method="post">
                    <input type="password"  id="searchInput" name="pwd" placeholder="현재 비밀번호" class="search-input">      
                         <div class="btn-sign">
                            <button type="submit" class="btn-signIn">수정하기</button>
                            </div>   
                    </form>                 
                </div>
    <script>
    
    $("#searchInput").change(function() {
    	 const inputElement = document.getElementById('searchInput');
    	    let value = inputElement.value; 
    	    console.log(value);

    	    // 허용되지 않은 문자 정규식
    	    const regExp = /[^0-9a-zA-Z!._^]/g; 

    	    if (regExp.test(value)) {
    	        alert("예약 번호는 영어, 숫자, 특수문자 !, ., _, ^만 입력 가능합니다.");

    	        // 허용되지 않은 문자 제거
    	        value = value.replace(regExp, '');

    	        // 입력 필드 값 업데이트
    	        inputElement.value = value;
    	    }
    	});
    	 

     // 검색 기능
     document.getElementById('searchInput').addEventListener('input', function() {
        const query = this.value.toLowerCase();
        const rows = document.querySelectorAll('#reservationTable tr');

        rows.forEach(row => {
            const facilityName = row.cells[0].textContent.toLowerCase();
       //     const reservationDate = row.cells[1].textContent.toLowerCase();

            if (facilityName.includes(query) ){//}|| reservationDate.includes(query)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });

  

    // 날짜 및 시간 필터링 기능
    document.getElementById('datetimeFilter').addEventListener('change', function() {
        const selectedDateTime = this.value; // 입력된 날짜 및 시간
        const rows = document.querySelectorAll('#reservationTable tr');

        rows.forEach(row => {
            const reservationDateTime = row.cells[1].textContent; // 예약 날짜-시간

            // 날짜가 일치하거나 필터가 비어 있으면 표시
            if (reservationDateTime.startsWith(selectedDateTime) || selectedDateTime === '') {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });

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