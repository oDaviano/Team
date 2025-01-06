<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
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
    <link type="image/png" rel="shortcut icon" href="${contextPath}/resources/assets/images/favicon/favicon.png">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/swiper-bundle.min.css">
	<script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
	
    <script src="https://cdn.jsdelivr.net/npm/swiper@latest/swiper-bundle.min.js"></script>
    
	<script type="text/javascript">var contextPath = "${contextPath}";</script>
	
	<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/result.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
      #container {}
      #header {}
      #aside {}
      #content {}
      #footer {}
    </style>
   <title><tiles:insertAttribute name="title" /></title>
    
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <aside id="aside">
          <tiles:insertAttribute name="aside"/> 
      </aside>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>