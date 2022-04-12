<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript">
	setInterval(function() {
		var val = "<c:out value='${__signin }' />";
		if (val != null && val != "" && val != "undefined" & val == 'Y') {
			var myajax = new MyAjax();
			myajax.send("/common/getLocal", "");
		}
	}, 1000 * 60 * 1);
	function fn_changLocale(locale) {
		gf_submitMovePage("<c:out value='${__requestURI}' />" + "?lang="
				+ locale, "");
	}
</script>
<header id="header1">
	<mini-nav>
	<ul>
		<c:choose>
			<c:when
				test="${__lastRequestURI eq '/signup' || __lastRequestURI eq '/terms' || __lastRequestURI eq '/registrationInfo' }">
				<li><a href="<c:url value='/sign/signin' />"><spring:message
							code='WRD-SIGNIN' text='로그인' /></a></li>
				<li><a href="<c:url value='/sign/signup' />"><spring:message
							code='WRD-SIGNUP' text='회원가입' /></a></li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${__signin eq 'Y'}">
						<%-- <li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='예약상태조회' /></a></li>
						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='예약가능일자조회' /></a></li>
						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='예약요청' /></a></li>
						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='예약취소' /></a></li> --%>
						<c:choose>
							<c:when test="${__lastRequestURI eq '/userProfile' }">
								<li><c:out value="${__name}" escapeXml="false" /></li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${__userType eq '3' }">
										<li><c:out value="${__name}" escapeXml="false" /></li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:gfn_secuPopup();"><c:out
													value="${__name}" escapeXml="false" /></a></li>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>


						<!-- li><a href="<c:url value='http://www.koamtacon.com/' />" target="_blank">KoamTacON - admin console</a></li -->
						<li><a href="<c:url value='/sign/signout' />"><spring:message
									code='WRD-SIGNOUT' text='Sign out' /></a></li>
						<br />

						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='메뉴관리' /></a></li>
						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='코드관리' /></a></li>
						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='예약가능일자조회' /></a></li>
						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='회원관리' /></a></li>
						<li><a href="<c:url value='/applications/introduction' />"><spring:message
									text='예약요청 관리' /></a></li>

					</c:when>
					<c:otherwise>
						<li><a>&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<img src="/resources/images/icon/lang.png">
		<li><select id="locale" name="locale"
			onchange="fn_changLocale(this.value)">
				<option value="en"
					<c:if test="${__locale eq 'en'}"> selected="selected" </c:if>>test</option>
				<option value="en"
					<c:if test="${__locale eq 'en'}"> selected="selected" </c:if>>ENG</option>
				<option value="ko"
					<c:if test="${__locale eq 'ko'}"> selected="selected" </c:if>>KOR</option>
				<option value="jp"
					<c:if test="${__locale eq 'jp'}"> selected="selected" </c:if>>JPN</option>
		</select></li>
	</ul>
	</mini-nav>
</header>