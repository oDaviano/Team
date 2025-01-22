<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">/
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta name="apple-mobile-web-app-title" content="Default">
<meta name="robots" content="no-index, follow">

<link type="image/png" rel="shortcut icon" href="${contextPath}/resources/assets/images/favicon/favicon.png">
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">

<script type="text/javascript">var contextPath = "${contextPath}";</script>


<title>405 Method Not Allowed</title>
<style>
	html, body,.container, section, main {width: 100%;height: 100%;}
	article {width: 90%;height: 100%;align-items:flex-start;}
	.my_div {
		background-image: url("../resources/assets/images/common/ErrorBG.jpg");
		background-size: cover;
		}
	.error_discrption {margin-top: 30px;}
</style>
</head>
<body>
    <div class="container">
        <img class="error-image" src="${contextPath}/resources/assets/images/errorCar.png" alt="405 Error">
        <h1 class=>405</h1> <!-- h1에 error_title 클래스 적용 -->
        <p class="error_title">요청한 HTTP 메서드는 이 리소스에서 허용되지 않습니다.</p>
        <p class="error_discrption">다시 시도하거나, 필요한 경우 관리자에게 문의해 주세요.</p> <!-- 기존 설명 유지 -->
        <button type="button" onclick="location.href='${contextPath}/main.do'">홈으로 돌아가기</button>
    </div>
</body>
 </html>