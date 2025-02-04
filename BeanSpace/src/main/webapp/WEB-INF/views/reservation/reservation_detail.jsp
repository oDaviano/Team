<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
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
<title>예약 세부 정보</title>


<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/confirm_reservation.css">
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/swiper-bundle.min.css">

<script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/lib/swiper-bundle.min.js"></script>

<!-- <script type="text/javascript" src="/js/temp_peg.js"></script> -->
  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
</head>
<body>
<div class="container">
  <div class="header">
    <h2>예약 내역.</h2>

  </div>
  <div class="content">

    <div id = "name" class="info"><strong>시설명:</strong> ${reserve.getName()}</div>
    <div id = "rsvnum" name = "rsvnum" class="info"><strong>예약번호:</strong> ${reserve.getRsvnum()}</div>
    <div id = "address" class="info"><strong>주소:</strong>${reserve.getAddress()}</div>
    <div id = "ptime" class="info"><strong>주차 시간:</strong>${reserve.getPtime()}</div>
    <div id = "etime" class="info"><strong>출차 시간:</strong>${reserve.getEtime()}</div>
    <div id = "carnum" class="info"><strong>차량 번호:</strong> ${reserve.getCarnum()}</div>
    <div id = "phone" class="info"><strong>전화번호:</strong>${reserve.getPhone()}</div>
    <div id = "fee" class="info"><strong>결제 금액:</strong> ${reserve.getFee()}</div>
        <c:choose>
   <c:when test="${isLogOn!=null &&isLogOn == true}"> 
    <div id = "mileage" class="info red">${reserve.getMileage()}</div>
    </c:when>
         <c:otherwise>
          <div></div>
         </c:otherwise>
   </c:choose>
</div>

  <div class="icon">
    <img src="${contextPath}/resources/assets/images/car-icon.png?" alt="">
  </div>
  <form class="content" action="${contextPath}/pages/reservation_cancel.do" method="post">
     <input type="hidden" name="rsvnum" value="${reserve.getRsvnum()}"> 
   <input type="hidden" name="mileage" value="${reserve.getMileage()}"> 
  <div class="buttons">
    <a href = "${contextPath}/pages/memrsvlist.do"><button type="button" class="main-button">확인</button></a>
    <button type="submit" class="main-button">예약 취소</button>
    </div>
</form>
  </div>

</body>
</html>
