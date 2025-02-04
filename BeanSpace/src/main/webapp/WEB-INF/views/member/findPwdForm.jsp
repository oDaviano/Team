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

  <!-- <link type="image/png" rel="shortcut icon" href=""> -->

  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_psh.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_njw.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/swiper-bundle.min.css">
  
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/swiper-bundle.min.js"></script>
 
<%--    <script type="text/javascript" src="${contextPath}/resources/js/temp_peg.js"></script> --%>
  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8ze2pCtEXZEBra8ProWgd2QGH69Ew8A4G6U6B6NC"></script>
</head>
<script>
$(function(){
	var msg = "${msg}";
	  if (msg!= null && msg!="") { 
     	alert(msg);
	  }
 
});
</script>

<body>
    <div class="container">
       
        <header class="header">
            <div class="car-icon">
        <a href="${contextPath}/main.do" id="carIconLink">
                    <img src="${contextPath}/resources/assets/images/car-icon.png" alt="Car Icon">
                </a>
            </div>
            <h1 class="header-title2">비밀번호 찾기</h1>
        <div id="button_menu" class="button-menu open-menu">             
                <img src = "${contextPath}/resources/assets/images/List.png" alt="menu icon"  width="70" height="70"	> </div>
        </header>

    </div>
    	    <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <div class="container">	               
                    <h4>비밀번호를 잊어버리셨나요?</h4>
                        		<div class="psh_own" style="margin-top: 25px;">
                    <!-- 검색 입력 필드 추가 -->
                 <form action="${contextPath}/member/findPwd.do" method="post">
                    <input type="text" id="searchInput" name="email" placeholder="🔍 가입한 이메일 주소를 입력해주세요" class="search-input">      
                         <div class="psh_own">
                            <button type="submit" class="btn-signIn">확인</button>
                            </div>   
                    </form>     
                    </div>            
                </div>

    <script>

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

  
    </script>
</body>
</html>