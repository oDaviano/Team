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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta name="apple-mobile-web-app-title" content="Default">
<meta name="robots" content="no-index, follow">
<meta name="title" content="">
<meta name="author" content="">
<meta name="content" content="">
<meta name="keywords" content="">
<meta name="description" content="빈자리 description">
<title>예약</title>

<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/assets/css/font.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/assets/css/reservation.css">

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
	src="${contextPath}/resources/js/reservation.js"></script>
<style>
</style>
</head>
<script>
$(function () {
	 $("#car-number").val("${member.getCarnum()}");
	 $("#phone-number").val("${member.getPhone()}");
	 $("#hemail").val("${member.getEmail()}");  
		setFee(0);
});
</script>
<body>
	<div class="container">
		<div class="header">
			<h2>시설 이름</h2>
			<img src="${contextPath}/resources/assets/images/car-icon.png"
				alt="Car Icon">
		</div>

		<form action="${contextPath}/reservation/reservation_confirm.do"
			method="post">
			<label for="parking-time">주차 시간</label> <input type="datetime-local"
				id="parking-time" name="ptime" onchange="setMinValue()"> <label
				for="exit-time">출차 시간</label> <input type="datetime-local"
				id="exit-time" name="etime" onchange="setMinValue()"> <label
				for="car-number">차량 번호</label> <input type="text" id="car-number"
				name="carnum"> <label for="phone-number">전화번호('-' 	없이)</label> <input
				type="text" id="phone-number" name="phone">


			<div id="feeText" class="info">결제 금액:</div>
			<c:choose>


				<c:when test="${isLogOn == false  || member== null}">

					<label for="nm-rsvnum">예약 확인 번호</label>
					<input type="text" id="hemail" name="email" onchage="checkReg()"></input>
				</c:when>
				<c:otherwise>
					<input id="hemail" type="hidden" name="email"></input>
					<div id="mileageText" class="info red">+</div>
				</c:otherwise>


			</c:choose>


			<input id="hname" type="hidden" name="name"></input> 
			<input id="hfee" type="hidden" name="fee"></input> 
			<input id="hmileage" type="hidden" name="mileage"></input> 
			<input id="haddress" type="hidden" name="address"></input> 
			<input id="rsvnum" type="hidden" name="rsvnum"></input>


			<div class="buttons">
				<button type="submit" class="submit-button">구매</button>
				<button type="button" onclick="history.back()" class="cancel-button">취소</button>
			</div>
		</form>
	</div>
</body>
</html>