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
<title>Sign in - KoamTacON</title>
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
		var srcCalendarEl1 = document.getElementById('source-calendar1');
		var srcCalendarEl2 = document.getElementById('source-calendar2');
		var srcCalendarEl3 = document.getElementById('source-calendar3');
		var srcCalendarEl4 = document.getElementById('source-calendar4');
		var srcCalendarEl5 = document.getElementById('source-calendar5');
		var srcCalendarEl6 = document.getElementById('source-calendar6');
		var srcCalendarEl7 = document.getElementById('source-calendar7');
		var srcCalendarEl8 = document.getElementById('source-calendar8');
		var srcCalendarEl9 = document.getElementById('source-calendar9');
		var srcCalendarEl10 = document.getElementById('source-calendar10');
		var srcCalendarEl11 = document.getElementById('source-calendar11');
		var srcCalendarEl12 = document.getElementById('source-calendar12');
		/* 	var destCalendarEl = document.getElementById('destination-calendar'); */

		var srcCalendar1 = new FullCalendar.Calendar(srcCalendarEl1, {
			headerToolbar : {
				/* 			left : 'hide', */
				/* 	center : 'title', */
				right : false
			},
			editable : true,
			initialDate : '2020-01-01',
			events : [ {
				title : 'event1',
				start : '2020-01-01',
				end : '2020-01-05'
			}, {
				title : 'event2',
				start : '2020-01-11T10:00:00',
				end : '2020-01-20T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar2 = new FullCalendar.Calendar(srcCalendarEl2, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-02-01',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar3 = new FullCalendar.Calendar(srcCalendarEl3, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-03-01',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});
		var srcCalendar4 = new FullCalendar.Calendar(srcCalendarEl4, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-04-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});
		var srcCalendar5 = new FullCalendar.Calendar(srcCalendarEl5, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-05-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar6 = new FullCalendar.Calendar(srcCalendarEl6, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-06-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar7 = new FullCalendar.Calendar(srcCalendarEl7, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-07-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar8 = new FullCalendar.Calendar(srcCalendarEl8, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-08-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar9 = new FullCalendar.Calendar(srcCalendarEl9, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-09-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar10 = new FullCalendar.Calendar(srcCalendarEl10, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-10-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar11 = new FullCalendar.Calendar(srcCalendarEl11, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-11-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar12 = new FullCalendar.Calendar(srcCalendarEl12, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-12-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});
		/* var destCalendar = new FullCalendar.Calendar(destCalendarEl, {
			initialDate : '2020-09-12',
			editable : true,
			droppable : true, // will let it receive events!
			eventReceive : function(info) {
				console.log('event received!', info.event);
			}
		}); */

		srcCalendar1.render();
		srcCalendar2.render();
		srcCalendar3.render();
		srcCalendar4.render();
		srcCalendar5.render();
		srcCalendar6.render();
		srcCalendar7.render();
		srcCalendar8.render();
		srcCalendar9.render();
		srcCalendar10.render();
		srcCalendar11.render();
		srcCalendar12.render();

		/* destCalendar.render(); */

	});
</script>
<style>
/* bodys {
	margin: 20px 0 0 20px;
	font-size: 12px;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
} */
mains {
	display: flex;
}

aside {
	flex-grow: 3;
	width: 10px;
	margin: 20px 0 0 20px;
	font-size: 12px;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
}

section {
	flex-grow: 3;
	width: 1000px;

	/* height: 1200px; */
}

#source-calendar1, #destination-calendar, #source-calendar2,
	#source-calendar3, #source-calendar4, #source-calendar5,
	#source-calendar6, #source-calendar7, #source-calendar8,
	#source-calendar9, #source-calendar10, #source-calendar11,
	#source-calendar12 {
	position: left;
	float: left;
	width: 300px;
	margin: 0 0px 50px 0;
}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<mains>
				<aside>

					<div id='source-calendar1'></div>
					<div id='source-calendar2'></div>
					<div id='source-calendar3'></div>
					<div id='source-calendar4'></div>
					<div id='source-calendar5'></div>
					<div id='source-calendar6'></div>
					<div id='source-calendar7'></div>
					<div id='source-calendar8'></div>
					<div id='source-calendar9'></div>
					<div id='source-calendar10'></div>
					<div id='source-calendar11'></div>
					<div id='source-calendar12'></div>

				</aside>
				</mains>
			</div>
		</div>
	</div>