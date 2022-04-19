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
							code='WRD-SIGNIN' text='Sign in' /></a></li>
				<li><a href="<c:url value='/sign/signup' />"><spring:message
							code='WRD-SIGNUP' text='회원가입' /></a></li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${__signin eq 'Y'}">
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

						<li><a href="<c:url value='/main' />"><spring:message
									text='예약가능일자조회' /></a></li>
						<li><a href="<c:url value='/user/reservationRequest/main' />"><spring:message
									text='예약상태조회' /></a></li>
						<li><a
							href="<c:url value='/user/reservationRequest/application' />"><spring:message
									text='예약요청' /></a></li>
						<li><a
							href="<c:url value='/user/cancelRequest/application' />"><spring:message
									text='예약취소' /></a></li>
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
					<c:if test="${__locale eq 'en'}"> selected="selected" </c:if>>ENG</option>
				<option value="ko"
					<c:if test="${__locale eq 'ko'}"> selected="selected" </c:if>>KOR</option>
				<option value="jp"
					<c:if test="${__locale eq 'jp'}"> selected="selected" </c:if>>JPN</option>
		</select></li>
	</ul>
	</mini-nav>
</header>
<header id="header">
	<div class="row">
		<div class="3u 12u$(medium)">
			<c:choose>
				<c:when test="${__userType eq '9'}">
					<a href="<c:url value='/admin/dashboard/view' />" class="image"><img
						src="/resources/images/KoamTacON.png"></a>
				</c:when>
				<c:when test="${__userType eq '8'}">
					<a href="<c:url value='/admin/dashboard/view' />" class="image"><img
						src="/resources/images/KoamTacON.png"></a>
				</c:when>
				<c:otherwise>
					<a href="http://www.koamtacon.com/" target="_top" class="image"><img
						class="logo-img" src="/resources/images/KoamTacON.png"></a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="9u 12u$(medium)">
			<c:out value="${mainMenuHtml}" escapeXml="false"></c:out>
		</div>
	</div>
</header>