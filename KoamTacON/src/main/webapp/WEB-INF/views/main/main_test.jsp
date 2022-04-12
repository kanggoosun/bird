<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- global header -->
<%@ include file="../include/gheader.jsp"%>

<!DOCTYPE HTML>
<!--
    Editorial by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html lang='en'>
<head>
<title><spring:message code='MENU-APPLICATIONS'
		text='Applications' /> - KoamTacON</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="<c:url value='/resources/assets/js/ie/html5shiv.js' />"></script><![endif]-->
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/main.css' />" />
<!--[if lte IE 9]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie9.css' />" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie8.css' />" /><![endif]-->

<!-- Scripts -->
<%@ include file="../include/incScripts.jsp"%>
<link href="/resources/fullcalendar/main.css" rel='stylesheet' />
<script src="/resources/fullcalendar/main.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
</script>

</head>

<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<%@ include file="../include/header.jsp"%>
			<div id='calendar'></div>

			<%-- <div class="inner">
				<!-- Content -->
				<section>

					<header class="main">
						<h2>
							<spring:message code='MENU-CALENDAR' text='Calendar' />
						</h2>
					</header>
					<div id="divApplicationList" class="posts"></div>

				</section>
			</div> --%>
		</div>
	</div>
</body>
</html>