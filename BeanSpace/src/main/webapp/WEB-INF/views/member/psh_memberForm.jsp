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

  <script type="text/javascript" src="${contextPath}/resources/js/temp_peg.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>

  <script type="text/javascript" src="js/common.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8ze2pCtEXZEBra8ProWgd2QGH69Ew8A4G6U6B6NC"></script>
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
                    <label id="label1"></label>
                    <!-- <button type="button" class="btn duplicate-check-btn">중복확인</button> -->
                </div>
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
                <button type="submit" class="btn signup-btn" id="signup-btn" disabled>가입하기</button>
            </form>
        </div>

        </main>



        <script>
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirm_password');
            const passwordError = document.getElementById('password-error');
            const signupBtn = document.getElementById('signup-btn');
            const contextPath = "${contextPath}";
    
            function validatePassword() {
                if (confirmPassword.value === "") {
                    passwordError.textContent = "";
                    signupBtn.disabled = true; // 비밀번호 확인 입력 필드가 비어 있으면 버튼 비활성화
                } else if (password.value === confirmPassword.value) {
                    passwordError.textContent = "비밀번호가 일치합니다."; // 성공 메시지 추가
                    passwordError.className = "success-message"; // 메시지 스타일 변경
                    signupBtn.disabled = false; // 비밀번호가 일치하면 버튼 활성화
                } else {
                    passwordError.textContent = "비밀번호가 일치하지 않습니다."; // 오류 메시지 추가
                    passwordError.className = "error-message"; // 메시지 스타일 변경
                    signupBtn.disabled = true; // 비밀번호가 일치하지 않으면 버튼 비활성화
                }
            }
    
            // 실시간으로 비밀번호와 확인 필드의 값을 확인하기 위한 이벤트 리스너 추가
            password.addEventListener('input', validatePassword);
            confirmPassword.addEventListener('input', validatePassword);
            
            
            $(document).ready(function () {
                // 이메일 중복 확인
                $("#email").on("focusout", function () {
                    var email = $("#email").val();

                    // 공백이나 빈 문자열인지 확인
                    if (email === '' || email.length === 0) {
                        // 공백인 경우 메시지를 표시하고 Ajax 요청을 중단
                        $("#Label1").css("color", "red").text("공백은 이메일로 사용할 수 없습니다.");
                        return false; // 요청 중단
                    }

                    // Ajax를 통해 서버에 이메일 중복 확인 요청
                    $.ajax({
                    	url: '${contextPath}/member/confirmEmail.do', // 서버의 컨트롤러 URL 경로
                        data: {
                            email: email // 클라이언트에서 서버로 전달할 데이터 (이메일)
                        },
                        type: 'POST', // POST 방식으로 요청
                        dataType: 'json', // 서버 응답을 JSON 형식으로 처리

                        // 서버 요청 성공 시 실행
                        success: function (response) {
                            // response.isAvailable 값 확인
                            if (response.isAvailable === true) {
                                // 사용 가능한 이메일인 경우
                                $("#label1").css("color", "green").text("사용 가능한 이메일입니다.");
                            } else {
                                // 사용 불가능한 이메일인 경우
                                $("#label1").css("color", "red").text("사용 불가능한 이메일입니다.");
                                $("#email").val(''); // 입력 필드 초기화
                            }
                        },

                        // 서버 요청 실패 시 실행
                        error: function () {
                            // 오류 메시지를 표시
                            $("#label1").css("color", "red").text("오류가 발생했습니다. 다시 시도해주세요.");
                        }
                    }); // End Ajax
                });
            });

       
        </script>
    </div>
</body>
</html>