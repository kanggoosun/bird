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
		var calendarEl1 = document.getElementById('calendar1');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'title',
				center : '',
				right : ''
			},
			initialDate : '2020-09-12',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect()
			},
			editable : false,
			dayMaxEvents : true, // allow "more" link when too many events
			eventLimit : true,
			events : [ {
				title : 'All Day Event',
				start : '2020-09-01',
				backgroundColor : "rgb(0, 185, 186)",
				textColor : "#000000",

			}, {
				title : 'Long Event',
				start : '2020-09-07',
				end : '2020-09-10',
				backgroundColor : "rgb(0, 185, 186)",

			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2020-09-11',
				end : '2020-09-13'
			}, {
				title : 'Meeting',
				start : '2020-09-12T10:30:00',
				end : '2020-09-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2020-09-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2020-09-12T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2020-09-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2020-09-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2020-09-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2020-09-28'
			}, {
				start : '2020-09-21',
			/* overlap : false, */
			/* 			display : 'background', */
			/* 	backgroundColor : "#00b9ba" */
			}, {
				title : 'libft 코딩',
				start : '2020-09-21',
				backgroundColor : "rgba(0, 185, 186, 0)",
				/* borderColor : "rgba(0, 185, 186, 0)", */
				textColor : "#000000"
			}, ]
		});

		calendar.render();

	});
/* 
	function chageSelectedValue() {
		var yourTestSelect = document.getElementById("TestSelect");

		// select element에서 선택된 option의 value가 저장됩니다.
		var selectedValue = yourTestSelect.options[yourTestSelect.selectedIndex].value;

	} */
</script>
<style>
/* body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
 */
#calendar, #calendar1 {
	max-width: 1200px;
	margin: 0 auto;
	font-size: 1em;
}
</style>
</head>

<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<%@ include file="../include/header.jsp"%>

			<section>
				<header class="main">
					<!-- <select style="width: 160px; float: right; margin: 0;" -->
					<!-- <div class="2u 12u$(medium) select-wrapper">
						<select id="TestSelect" name="SelectValue"
							onchange="location.href=this.value">
							<option value="">Select</option>
							<option value='/board/question'>송도</option>
							<option value='/board/notice'>제주</option>
							<option value="reservationRequest/application">서울</option>
						</select>
					</div> -->
					<div id='calendar'></div>

				</header>
			</section>

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