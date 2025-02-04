<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
  <aside id="rightside" >
<%--          <tiles:insertAttribute name="aside"/>  --%>
                    <section class="sidebar">
                        <article class="sidebar_title">
                            <div class="ux-title">
                                <div class="account_name">
                                
                                    <%-- <img src = "${contextPath}/resources/assets/images/Account.png" width="70" height="70">  --%>
                                                      <c:choose>
                                <c:when test="${isLogOn == true}">                                
                                     <div>${name} 님</div>
                                </c:when>
                                <c:otherwise>
                                    <div>로그인이 필요합니다.</div>
                                
                                </c:otherwise>
        
                                </c:choose>
                              
                                </div>
                            
                            <div class="sideclose">
                                <button type="button" class="ux-button icon-only button-menu button-close" tabindex="0">
                                    X
                                </button>
                            </div>
                        </div>
                        </article>
                        <article>
                    <div class="main">
                        <div class="menu-list">
                            <ul>               
                                <c:choose>
                                <c:when test="${isLogOn == true}">                                
                                <li><a href="${contextPath}/member/user_info.do" class="ux-link">회원 정보</a></li>
                                <li><a href="${contextPath}/pages/memrsvlist.do" class="ux-link">예약 내역 조회</a></li>
                                <li><a href="${contextPath}/member/checkpwdForm.do" class="ux-link">개인 정보 수정</a></li>
                                <li><a href="${contextPath}/member/logout.do" class="ux-link">로그아웃</a></li>
                                </c:when>
                                <c:otherwise>
                                     <li><a  href="${contextPath}/member/loginForm.do"class="ux-link button-mob-sign in">로그인</a></li>
                                     <li><a href="${contextPath}/pages/non_member_authentication.do" class="ux-link">예약 내역 조회</a></li>
                                
                                </c:otherwise>
        
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </article>
    </section>
    
        </aside>

<%-- <div class="backdrop"></div>
<div class="mobile-total-menu">
	<header class="mob-header">
		<section>
			<article>
				<div class="ux-title">
					<div class="ux-button-bar">
						<button type="button" class="ux-button button-user button-rang"
							tabindex="0">
							<!-- <span class="label">사용자님</span><span class="icon"></span> -->
						</button>
					</div>
				</div>
				<div class="ux-button-bar">
					<button type="button"
						class="ux-button icon-only button-menu button-close" tabindex="0">
						<span class="icon"></span><span class="label">전체메뉴 닫기</span>
					</button>
				</div>
			</article>
		</section>
		<div class="main">
			<div class="menu-list">
				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<h4>
							<span>${member.name}</span>님! 반갑습니다<br /> 어떤 캠핑을 준비중이신가요?
						</h4>
					</c:when>
					<c:otherwise>
						<h4>회원가입시 다양한 혜택이 주어집니다!</h4>
					</c:otherwise>
				</c:choose>
				<ul>
					<li><a href="${contextPath}/member/loginForm.do"
						class="ux-link button-mob-sign in">로그인 </a></li>
					<li><a href="${contextPath}/member/memberForm.do"
						class="ux-link">회원가입</a></li>
					<li><a href="${contextPath}/pages/listCampingSites.do" class="ux-link">캠핑장 검색</a></li>
					<!-- <li><a href="#" class="ux-link">추천 인기 캠핑장</a></li> -->
					<!-- <li><a href="#" class="ux-link">찜한장소 확인</a></li> -->
					<!-- <li><a href="#" class="ux-link">예약내역 확인</a></li> -->
					<!-- <li><a href="#" class="ux-link">FAQ/자주하는 질문</a> -->
					<!-- <li><a href="#" class="ux-link">마이페이지</a></li> -->
				</ul>
			</div>
			<div class="etc">
				<div class="button-bar">
					<button type="button" class="ux-button button-logout button-rang"
						onclick="location.href='${contextPath}/member/logout.do'">
						<span class="label">로그아웃</span><span class="icon"></span>
					</button>
				</div>
			</div>
		</div>
	</header>
</div> --%>