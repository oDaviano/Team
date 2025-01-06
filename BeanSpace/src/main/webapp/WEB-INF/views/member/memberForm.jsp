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
			<div class="content">
				<h4 class="content-title">회원가입</h4>
				<form class="ui-form sign" method="post"
					action="${contextPath}/member/addMember.do">
					<fieldset>
						<ul>
							<li>
								<div class="field ">
									<label class="label">아이디</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="id" type="text" class="custom-text"
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
											<input name="pwd" type="password" class="custom-text"
												placeholder="비밀번호를 입력해주세요.">
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label">이름</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="name" type="text" class="custom-text"
												placeholder="이름을 입력해주세요.">
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label">이메일</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="email" type="text" class="custom-text"
												placeholder="이메일을 입력해주세요.">
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="ux-button-bar">
									<button class="ux-button outlined" type="reset">
										<span class="label">다시입력</span>
									</button>
									<button
										class="ux-button contained primary submit-button-sign up"
										type="submit">
										<span class="label">가입하기</span>
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



