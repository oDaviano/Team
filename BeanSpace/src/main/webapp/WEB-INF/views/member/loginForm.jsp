<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<main class="ui-sign">
	<section>
		<article>
			<c:choose>
				<c:when test="${result=='loginFailed' }">
					<script>
						window.onload = function() {
							alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
						}
					</script>
				</c:when>
			</c:choose>
			<div class="content">
				<h4 class="content-title">로그인</h4>
				<form class="ui-form sign login" name="frmLogin" method="post"
					action="${contextPath}/member/login.do">
					<fieldset>
						<ul>
							<li>
								<div class="field ">
									<label class="label">아이디</label>
									<div class="ui-input">
										<div class="input outlined">
											<input type="text" name="id" class="custom-text"
												placeholder="아이디를 입력하세요.">
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label">비밀번호</label>
									<div class="ui-input">
										<div class="input outlined">
											<input type="password" name="pwd" class="custom-text"
												placeholder="비밀번호를 입력해주세요.">
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="ux-button-bar column">
									<button
										class="ux-button contained primary submit-button-sign in"
										type="submit">
										<span class="label">로그인</span>
									</button>
									<a href="${contextPath}/member/memberForm.do"
										class="ux-button text-button" type="button"> <span
										class="label">회원가입</span><span class="icon rang"></span>
									</a>
								</div>
							</li>
							<li>
								<div class="ux-divider"></div>
							</li>
							<li>
								<div class="ux-button-bar column">
									<button class="ux-button outlined social google">
										<span class="icon"></span><span class="label">구글 로그인</span>
									</button>
									<button class="ux-button contained social naver">
										<span class="icon"></span><span class="label">네이버 로그인</span>
									</button>
									<button class="ux-button contained social kakao">
										<span class="icon"></span><span class="label">카카오 로그인</span>
									</button>
								</div>
							</li>
						</ul>
					</fieldset>
				</form>
			</div>
		</article>
	</section>
</main>
