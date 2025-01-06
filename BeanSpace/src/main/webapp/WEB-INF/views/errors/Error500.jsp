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
<meta http-equiv="Content-Script-Type" content="text/javascript">
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


<title>500 Internal Server Error</title>
<style>
	html, body,.container, section, main {width: 100%;height: 100%;}
	article {width: 90%;height: 100%;align-items:flex-start;}
	.my_div {
		background-image: url("${contextPath}/resources/assets/images/common/ErrorBG.jpg");
		background-size: cover;
		}
	.error_discrption {margin-top: 30px;}
</style>
</head>
<body>
 	<div class="container my_div">
 		<main>
	 		<section>
			 	<article>
					<h3 class="error_title">서버 내부 오류가 발생했습니다.</h3>
					<h5 class="error_discrption">잠시 후 다시 시도해주세요.</h5>
			 	</article>
			</section>
		</main>
	</div>
</body>
 </html>