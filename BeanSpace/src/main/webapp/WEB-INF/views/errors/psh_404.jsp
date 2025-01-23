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


<title>404 Not Found</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            color: #333;
        }

        .container {
            text-align: center;
        }

        .error-image {
            max-width: 200px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 3rem;
            margin: 0;
        }

        p {
            font-size: 1.2rem;
            margin: 10px 0 20px;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <img class="error-image" src="${contextPath}/resources/assets/images/errorCar.png" alt="404 Error">
        <h1>404</h1>
        <p>죄송합니다, 찾으시는 페이지를 찾을 수 없습니다.</p>
        <button type="button" onclick="location.href='${contextPath}/main.jsp'">홈으로 돌아가기</button>
    </div>
</body>
</html>
</html>