<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html>
<html>
<html lang="ko" class="">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
  <title>로그인 폼</title>

  <!-- <link type="image/png" rel="shortcut icon" href=""> -->
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_psh.css"> 
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">

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
<script>
$(function(){
	var session='<%=session.getAttribute("isLogIn")%>';
	 <% if (request.getAttribute("loginFailed") != null) { %>
     alert("로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.");
 <% } %>
	  if(session!=null && session!='null'){
		  window.location.replace('${contextPath}/member/user_info.do');
		  $(location).attr();

	  }
});
</script>

<body>
    <div class="container">
        <header>
			<!-- <div class="observer-layout"></div>
			<section class="header-pc1 load">.load: setCommon 함수로 AJAX 로드</section>
			<section class="header-pc2 load">.load: setCommon 함수로 AJAX 로드</section> 추가 작업용 보류
			<section class="header-mob load">.load: setCommon 함수로 AJAX 로드</section> -->
		</header>

        <main class="psh_own">
				<div class="layer">
					<!-- 로그인 폼 시작 -->
					<form class="login" id="loginForm" action="${contextPath}/member/login.do" method="post">
						<h2>로그인</h2>
						<!-- 이메일 비밀번호 입력 -->
						<input type="text" name="email" placeholder="이메일을 입력하세요." class="input">
						<input type="password"  name ="pwd" placeholder="비밀번호를 입력하세요." class="input">
						<!-- 로그인 회원가입 버튼-->
						<div class="btn-sign">
						<button type="submit" class="btn-signIn">로그인</button>
						<a href="${contextPath}/member/memberForm.do" class="btn-signUp">회원가입</a>
						</div>

						<!-- 소셜로그인 버튼영역 -->
						<div class="social-login">
							<!-- 구글 로그인 버튼 -->
                            <button class="btn-social btn-google">
                                <img src="${contextPath}/resources/assets/images/login/google.png" alt="Google Logo">
                            </button>
							<!-- 네이버 로그인 버튼 -->
                            <button class="btn-social btn-naver">
                                <img src="${contextPath}/resources/assets/images/login/naver.png" alt="Naver Logo">
                            </button>
							<!-- 카카오 로그인 버튼 -->
                            <button class="btn-social btn-kakao">
                                <img src="${contextPath}/resources/assets/images/login/kakao.png" alt="Kakao Logo">
                            </button>
                        </div>
						<!-- 닫기버튼 여부 -->

					</form>
				</div>
		</main>



        <footer>

        </footer>
    </div>
</body>
</html>