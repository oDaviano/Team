<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
	/* 세미 정리 */
	.hidden-menu-list {margin-right: 80px;}
	.hidden-menu-list .hidden-menu {color: var(--fc-fff);opacity: 0;transition: all 0.3s ease;}
	.hidden-menu-list .hidden-menu+.hidden-menu {margin-left: 20px;}
	.hidden-menu-list .hidden-menu:hover {opacity: 0.2;}
	.member.is-logon {color: var(--fc-fff);}
</style>


<header>
	<section class="header-pc1">
		<article>
			<div class="logo">
				<a href="${contextPath}/main.do" class="ux-link h1"><img
					src="${contextPath}/resources/assets/images/common/header_logo.png"
					alt="logo"></a>
			</div>
			<div class="user">
				<div class="hidden-menu-list">
					<a href="${contextPath}/member/listMembers.do"
						class="hidden-menu member">회원관리</a> <a
						href="${contextPath}/board/listArticles.do"
						class="hidden-menu board">게시판관리</a><br>
				</div>
				<ul>
					<c:choose>
						<c:when test="${isLogOn == true  && member!= null}">
							<li><span class="member is-logon">${member.name}님</span> <a
								href="${contextPath}/member/logout.do"
								class="ux-button button-pc-sign out"><span class="label">Log
										out</span> </a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath}/member/loginForm.do"
								class="ux-button button-pc-sign in"><span class="label">Sign
										In</span> </a></li>
					<!--
					<li><a href="#" class="ux-button icon-menu wish" role="button">
							<i class="icon fa-regular fa-heart"></i> <span class="label">찜한장소</span>
					</a></li> -->
					<!-- 회원가입 경로 -->
					<li><a href="${contextPath}/member/memberForm.do"
						class="ux-button button-pc-sign up" tabindex="0"><span
							class="label">Sign Up</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</article>
	</section>
	<!-- mobile 헤더-->
	<section class="header-mob ">
		<article>
			<div class="logo">
				<a href="${contextPath}/main.do" class="ux-link h1"><img
					src="${contextPath}/resources/assets/images/common/header_logo_dark.png"
					alt=""></a>
			</div>
			<div class="ux-button-bar">
				<button type="button"
					class="ux-button icon-only button-menu open-menu">
					<span class="icon"></span> <span class="label">전체메뉴 열기</span>
				</button>
			</div>
		</article>
	</section>
</header>