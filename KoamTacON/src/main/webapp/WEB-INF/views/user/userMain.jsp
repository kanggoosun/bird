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
	$(document).ready(function(){
// 		alert("1354");
// 	    var msg = "<c:out value='${msg}' />";
// 	    if (msg != null && msg != "") { gfn_layerPopup(msg); }
	    
// 	    gfn_toggleMenu('.systemMgmt');
	    
// 	    fn_getApplicationList(1);
	});

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			/* 	headerToolbar : {
					right : false
				}, */
// 			initialDate : '2022-07-12',
			navLinks : false, // can click day/week names to navigate views
			selectable : false,
			selectMirror : false,
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
			events :  [ {
				title : 'All Day Event',
				start : '2020-09-01'
			}, {
				title : 'Long Event',
				start : '2020-09-07',
				end : '2020-09-10'
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
			} ]
		});

		calendar.render();
	});
	
	function start() {
		
// 		var param = "";
// 		param += "curPage="+pageNo;
// 	    param += "&";
// 	    param += "callFunction=fn_getApplicationList";
	    
// 		gf_send("<c:url value='/admin/systemManagement/getApplicationList' />", param, "fn_getApplicationListCallback");

		fn_getDayEventList();
	}

	function fn_getDayEventList() {
// 		var pyear = "2022";
// 		var pmonth = "07";
		
		var param = "";
// 		param += "year="+pyear;
// 	    param += "&";
// 		param += "month="+pmonth;
// 	    param += "&";
// 	    param += "callFunction=fn_getDayEventList";
	    
		gf_send("<c:url value='/user/main/getDayEventList' />", param, "fn_getDayEventListCallback");
	}

	function fn_getDayEventListCallback(data) {
		console.log("12313131313 1312312312312311331 ------------------------->  "+data);
		
		
		var calendarEl = document.getElementById('calendar');
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridMonth',
// 	      initialDate : '2022-07-12',
// 	      headerToolbar: {
// 	        left: 'prev,next today',
// 	        center: 'title',
// 	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
// 	      },

	      events: data.applicationList
	    });

	    calendar.render();
	}
</script>
<style>
/* body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
 */

#calendar {
	max-width: 1200px;
	margin: 0 auto;
	font-size: 0.9em;
}

</style>
</head>

<body onload=start()>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<%@ include file="../include/header.jsp"%>

			<section>
				<header class="main">
<!-- 				어드민메인 -->
					<div style="position: absolute;  "> 
						<div style="float:left;margin-left: 130px; margin-top: 30px;word-spacing:35px; font-size:15px;">송&nbsp;도</div>
						<div style=" margin: 30px 60px 5px 220px; width:100px; height:20px; border:1px solid black; background-color:#E04A0E;  "></div>
						<div style="float:left;margin-left:130px; word-spacing:35px; font-size:15px;">속&nbsp;초</div>
						<div style=" margin: 5px 60px 5px 220px; width:100px; height:20px; border:1px solid black; background-color:#1EB422;  "></div>
						<div style="float:left;margin-left: 130px;word-spacing:35px; font-size:15px;">제&nbsp;주</div>
						<div style=" margin: 5px 60px 5px 220px; width:100px; height:20px; border:1px solid black; background-color:#2B34ED;  "></div>
						<div style="float:left;margin-left: 130px; font-size:15px;">예약&nbsp;&nbsp;&nbsp;불가</div>
						<div style=" margin: 5px 60px 00px 220px; width:100px; height:20px; border:1px solid black; background-color:#5E5E5E;  "></div>
					</div>
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