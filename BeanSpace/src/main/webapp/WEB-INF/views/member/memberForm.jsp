<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<html lang="ko" class="">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
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
  <title>회원가입 폼</title>

	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/tmp_member.css">

  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/jquery-ui-1.12.1.theme.min.css">
  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/lib/swiper-bundle.min.css">

  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/lib/swiper-bundle.min.js"></script>

<%--   <script type="text/javascript" src="${contextPath}/resources/js/temp_peg.js"></script> --%>
<%--   <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script> --%>

  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>


<body>
    <div class="container">

        <main class="member_own">
        <!-- 회원가입 영역 -->
        <div class="signup-wrapper">
            <h1 class="signup-title">회원가입</h1>
            <form action="${contextPath}/member/addMember.do" method="post" class="signup-form">

                <!-- 이메일 입력과 중복확인 -->
                <div class="form-group">
                    <input type="email" id="email" placeholder="이메일 입력" name="email" autofocus>
                    <button type="button" class="btn duplicate-check-btn">중복확인</button>
                </div>
                <label id="label1" style="text-align: left;"></label>
                <!-- 비밀번호 입력 확인 -->
                <div class="form-group">
                    <input type="password" placeholder="비밀번호 입력" name="pwd" id="password" required>
                </div>

                <div class="form-group">
                    <input type="password" placeholder="비밀번호 확인" name="confirm_password" id="confirm_password" required>
                    <span class="error-message" id="password-error"></span>
                </div>

                <!-- 이름 입력 -->
                <div class="form-group">
                    <input type="text" placeholder="이름 입력" name="name" required>
                </div>

                <!-- 전화번호 입력 -->
                <div class="form-group">
                    <input type="tel" placeholder="전화번호 입력" name="phone" required>
                </div>

                <!-- 차량 번호 입력 -->
                <div class="form-group">
                    <input type="text" placeholder="차량 번호 입력" name="carnum" required>
                </div>

                <!-- 가입하기 버튼 -->
                <button type="submit" class="btn signup-btn" id="signup-btn" style="display: none;">가입하기</button>
            </form>
        </div>

        </main>



        <script>
            
            $(document).ready(function () {
                let isEmailValid = false; // 이메일 중복 확인 상태
                let isPasswordValid = false; // 비밀번호 일치 상태

                // 이메일 중복 확인
                $(".duplicate-check-btn").on("click", function () {
                    const email = $("#email").val().trim();

                    // 공백이나 빈 문자열인지 확인
                    if (email === '' || email.length === 0) {
                        $("#label1").css("color", "red").text("공백은 이메일로 사용할 수 없습니다.");
                        $("#signup-btn").css("display", "none"); // 버튼 숨기기
                        isEmailValid = false;
                        return;
                    }

                    const cfurl = `${contextPath}/member/confirmEmail.do`;
                    $.ajax({
                        url: cfurl,
                        data: { email: email },
                        type: 'POST',
                        success: function (response) {
                            if (response === true) {
                                // 사용 가능한 이메일인 경우
                                $("#label1").css("color", "green").text("사용 가능한 이메일입니다.");
                                isEmailValid = true;
                            } else {
                                // 사용 불가능한 이메일인 경우
                                $("#label1").css("color", "red").text("사용 불가능한 이메일입니다.");
                                isEmailValid = false;
                            }
                            toggleSignupButton(); // 버튼 상태 업데이트
                        },
                        error: function () {
                            // 서버 요청 실패 시
                            $("#label1").css("color", "red").text("오류가 발생했습니다. 다시 시도해주세요.");
                            isEmailValid = false;
                            toggleSignupButton();
                        }
                    });
                });               
                
                $("#email").on("propertychange change keyup paste input", function(){
                    	isEmailValid = false;
                    	console.log("changed");
                    	toggleSignupButton(); 
                       // $("#signup-btn").css("display", "none"); // 버튼 숨기기
                    });

                // 비밀번호 일치 확인
                const password = $("#password");
                const confirmPassword = $("#confirm_password");
                const passwordError = $("#password-error");

                function validatePassword() {
                    if (password.val() === confirmPassword.val() && password.val() !== '') {
                        passwordError.text("비밀번호가 일치합니다.").css("color", "green");
                        isPasswordValid = true;
                    } else {
                        passwordError.text("비밀번호가 일치하지 않습니다.").css("color", "red");
                        isPasswordValid = false;
                    }
                    toggleSignupButton(); // 버튼 상태 업데이트
                }

                password.on("input", validatePassword);
                confirmPassword.on("input", validatePassword);

                // 버튼 표시/숨기기
                function toggleSignupButton() {
                    if (isEmailValid && isPasswordValid) {
                        $("#signup-btn").css("display", "block"); // 버튼 보이기
                    } else {
                        $("#signup-btn").css("display", "none"); // 버튼 숨기기
                    }
                }
            });

            

        </script>
    </div>
</body>
</html>