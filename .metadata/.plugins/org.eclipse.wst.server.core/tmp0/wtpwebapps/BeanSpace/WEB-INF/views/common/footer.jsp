<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<footer>
	<section class="footer-pc">
		<article>
			<div class="link-list">
				<ul>
					<li><a href="#" class="ux-link">회사소개</a></li>
					<li><a href="#" class="ux-link">이용약관</a></li>
					<li><a href="#" class="ux-link">개인정보처리방침</a></li>
					<li><a href="#" class="ux-link">고객정보취급방침</a></li>
				</ul>
			</div>
			<div class="customer-center-info">
				<dl>
					<dt>고객센터: </dt>
					<dd>
						<span class="value">2024-ABCD</span>
						<span class="desc">(AM.09:10 ~ PM.17:51)</span>
					</dd>
				</dl>
			</div>
			<div class="company-info">
				<ul>
					<li>
						<dl>
							<dt>주소 : </dt>
							<dd><span class="value">멀티캠퍼스 semi-pj-ZOOM/202411호</span></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>대표이사 : </dt>
							<dd><span class="value">규호라</span></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>사업자등록번호 : </dt>
							<dd><span class="value">404</span></dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="copyright-info">
				<dl>
					<dt><span class="label">COPYRIGHT© 2024</span></dt>
					<dd><span class="value">CAMPROAD CO., LTD All rights reserved.</span></dd>
				</dl>
			</div>
		</article>
	</section>
	<section class="footer-mob">
		<article>
			<div class="dock-menu-bar">
				<ul>
					<li>
						<a href="${contextPath}/main.do" class="ux-button icon-menu home current" role="button">
							<i class="icon fa-solid fa-house"></i>
							<span class="label">홈</span>
						</a>
					</li>
					<li>
						<a href="#" class="ux-button icon-menu faq" role="button">
							<i class="icon fa-regular fa-circle-question"></i>
							<span class="label">FAQ</span>
						</a>
					</li>
					<li>
						<a href="#" class="ux-button icon-menu wish" role="button">
							<i class="icon fa-regular fa-heart"></i>
							<span class="label">찜한장소</span>
						</a>
					</li>
					<li>
						<a href="#" class="ux-button icon-menu reserved" role="button">
							<i class="icon fa-solid fa-ticket"></i>
							<span class="label">예약내역</span>
						</a>
					</li>
					<li>
						<a href="#" class="ux-button icon-menu mypage" role="button">
							<i class="icon fa-regular fa-user"></i>
							<span class="label">마이페이지</span>
						</a>
					</li>
				</ul>
			</div>
		</article>
	</section>
</footer>