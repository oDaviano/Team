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
  <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
  <meta name="apple-mobile-web-app-title" content="Default">
  <meta name="robots" content="no-index, follow">
  <meta name="title" content="">
  <meta name="author" content="">
  <meta name="content" content="">
  <meta name="keywords" content="">
  <meta name="description" content="빈자리 description">
  <title>빈자리</title>

  <!-- <link type="image/png" rel="shortcut icon" href=""> -->

  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_peg.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_njw.css">
   <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_common.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/swiper-bundle.min.css">
  
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/swiper-bundle.min.js"></script>
 
  <script type="text/javascript" src="js/common.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8ze2pCtEXZEBra8ProWgd2QGH69Ew8A4G6U6B6NC"></script>
</head>


<body>
    <div class="container">
       
        <header class="header">
            <div class="car-icon">
                <a href="/pages/main.html" id="carIconLink">
                    <img src="${contextPath}/resources/assets/images/car-icon.png" alt="Car Icon" />
                </a>
            </div>
            <h1 class="header-title2">예약 내역 조회</h1>
            <div id="button_menu" class="menu-icon">         
                <img src = "${contextPath}/resources//assets/images/List.png" alt="menu icon"> 
        </header>
    </div>
</div>

            <body>
                <div class="container">
                   
            
                    <!-- 검색 입력 필드 추가 -->
                    <input type="text" id="searchInput" placeholder="🔍 시설명 또는 예약 날짜 검색..." class="search-input">
                     
        <input type="datetime-local" id="datetimeFilter" class="datetime-input" placeholder="날짜 및 시간 선택">
            
                    <table>
                        <thead>
                            <tr>
                                <th>시설명</th>
                                <th>예약 날짜</th>
                                <th>주차 시간</th>
                                <th>출차 시간</th>
                            </tr>
                        </thead>
                        <tbody id="reservationTable">
                        			<c:choose>
						<c:when test="${empty reservesList}">
							<tr height="10">
								<td colspan="4">
									<p align="center">
										<b><span style="font-size: 9pt;">예약 내역이 없습니다<br>지도에서 예약을 시작해보세요.</span></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${not empty reservesList}">
							<c:forEach var="article" items="${reservesList }"
								varStatus="articleNum">
								<tr align="center">
									<td width="5%">${article.articleNO}</td>
									<td width="10%">${article.id }</td>
									<td align='left' width="35%"><span
										style="padding-right: 30px"></span> <c:choose>
											<c:when test='${article.level > 1 }'>
												<c:forEach begin="1" end="${article.level }" step="1">
													<span style="padding-left: 20px"></span>
												</c:forEach>
												<span style="font-size: 12px;">[답변]</span>
												<a class='cls1'
													href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
											</c:when>
											<c:otherwise>
												<a class='cls1'
													href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
											</c:otherwise>
										</c:choose></td>
									<td width="10%">${article.writeDate}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
                        
                        
                        
                        
                        
                            <!-- 데이터 예시 -->
                            
                            
                            <tr>
                                <td><a href="/pages/confirm_reservation.html" class="facility-link">서울타워 주차장</a></td>
                                <td>2024-12-23</td>
                                <td>14:00</td>
                                <td>16:00</td>
                            </tr>
                            <!-- 데이터가 없을 경우 -->
                            <!-- <tr>
                                <td colspan="4" class="no-data">예약 내역이 없습니다.</td>
                            </tr> -->
                        </tbody>
                    </table>
                   
                </div>
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
    // 검색 기능
    document.getElementById('searchInput').addEventListener('input', function() {
        const query = this.value.toLowerCase();
        const rows = document.querySelectorAll('#reservationTable tr');

        rows.forEach(row => {
            const facilityName = row.cells[0].textContent.toLowerCase();
            const reservationDate = row.cells[1].textContent.toLowerCase();

            if (facilityName.includes(query) || reservationDate.includes(query)) {
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
