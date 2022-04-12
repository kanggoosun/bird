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
<html>
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
<script type="text/javascript"
	src="/resources/codebase/calendar.js?v=7.3.1"></script>
<link rel="stylesheet" href="/resources/codebase/calendar.css?v=7.3.1">

<link rel="stylesheet" href="/resources/common/index.css?v=7.3.1">

</head>

<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<%@ include file="../include/header.jsp"%>
			<div class="inner">

				<%-- <section>
					<header class="main">
						<h2>
							<spring:message code='MENU-INTRODUCTION' text='Introduction' />
							
						</h2>
					</header>
				</section> --%>
				<section
					style="display: flex; justify-content: center; padding: 40px;">
					<label for="date-input" class="dhx_sample-label"> 요청일자 <input
						type="text" id="date-input" class="dhx_input dhx_sample-input"
						readonly data-widget-control style="margin-left: 10px;">
					</label>
				</section>
				<section>
					<header class="main">
						<h2>예약상태조회
							<%-- <spring:message  code='MENU-INTRODUCTION' text='예약상태조회' /> --%>
								
						</h2>
					</header>
				</section>

			</div>
		</div>
	</div>

	<!-- popup layer -->
	<%@ include file="../include/popupLayer.jsp"%>

	<script type="text/javascript">
		// init calendar without container, use null instead of container
		const firstDate = new Date();
		const secondDate = new Date(Date.now() + 1000000000);

		const calendar = new dhx.Calendar(null, {
			dateFormat : "%y/%m/%d",
			range : true,
			value : [ firstDate, secondDate ],
			css : "dhx_widget--bordered"
		});

		/* const calendar = new dhx.Calendar("calendar", {
			range : true,
			value : [ firstDate, secondDate ],
			css : "dhx_widget--bordered"
		});
		 */
		/* const calendar = new dhx.Calendar(null, {
			dateFormat : "%y/%m/%d",
			range : true,
			css : "dhx_widget--bordered"
		});
		 */
		// init popup and attach calendar
		const popup = new dhx.Popup();
		popup.attach(calendar);

		// when calendar value changed, it trigger update input value and hide popup
		calendar.events.on("change", function() {
			dateInput.value = calendar.getValue();
			/* popup.hide(); */
			console.log(dateInput.value);

		});

		const dateInput = document.getElementById("date-input");

		// on input click we show popup
		dateInput.addEventListener("click", function() {
			popup.show(dateInput);
		});
	</script>
</body>
</html>