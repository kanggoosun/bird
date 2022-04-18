<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%> --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<!-- <title>air datepicker</title> -->
<link rel="stylesheet"
	href="/resources/air-datepicker/dist/css/datepicker.min.css">
<!-- <script src="/resources/air-datepicker/dist/js/jquery-3.1.1.min.js"></script> -->
<script src="/resources/air-datepicker/dist/js/datepicker.min.js"></script>
<script src="/resources/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
<style>
* {
	margin: auto;
	padding: 0;
}

.double div {
	float: left;
	/* width: 10 */
	width: 1000px;
	padding: 10px;
	/* 	border: 5px solid green; */
	margin: auto;
	display: inline;
}

aside {
	width: 1600px;
	height: 300px;
	padding: 30px;
	/* 	border: 5px solid green; */
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 2px solid gray;
	/* display: inline; */
	/* display: inline; */
	/* style="display: inline;" */
}
</style>
</head>

<body>

	<!-- <div class="single"></div>

	<br />
	<br />
	<br /> -->
	<aside>
		<div class="double">
			법인<input type="text"> <br> 예약 시작일 <input
				style="width: 220px; display: inline;" id="datepicker1" type="text">
			- <input style="width: 250px; display: inline;" id="datepicker2"
				type="text"> <br>
				상태<input type="text">  
		</div>
	</aside>

	<script>
		//한개만 단순하게 만들때
		/*    $("#disabled-days").datepicker({
		       language: 'ko'
		   });



		 */

		//두개짜리 제어 연결된거 만들어주는 함수
		datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째

		/*
		 * 달력 생성기
		 * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
		 * @example   datePickerSet($("#datepicker"));
		 * 
		 * 
		 * @param sDate, 
		 * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
		 * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
		 */

		var disabledDays = [ 0, 6 ];

		$('#disabled-days').datepicker(
				{
					language : 'ko',
					minDate : new Date(), // Now can select only dates, which goes after today
					onRenderCell : function(date, cellType) {
						if (cellType == 'day') {
							var day = date.getDay(), isDisabled = disabledDays
									.indexOf(day) != -1;

							return {
								disabled : isDisabled
							}
						}
					}
				})

		function datePickerSet(sDate, eDate, flag) {

			//시작 ~ 종료 2개 짜리 달력 datepicker	
			if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
					&& eDate.length > 0) {
				var sDay = sDate.val();
				var eDay = eDate.val();
				var disabledDays = [ 0, 6 ];

				if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
					var sdp = sDate.datepicker().data("datepicker");
					sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

					var edp = eDate.datepicker().data("datepicker");
					edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
				}

				//시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
				if (!isValidStr(eDay)) {
					sDate.datepicker({
						maxDate : new Date(eDay.replace(/-/g, "/"))
					});
				}
				sDate.datepicker({
					language : 'ko',
					autoClose : true,
					minDate : new Date(),
					onSelect : function() {
						datePickerSet(sDate, eDate);
					}
				/* onRenderCell : function(date, cellType) {
					if (cellType == 'day') {
						var day = date.getDay(), isDisabled = disabledDays
								.indexOf(day) != -1;

						return {
							disabled : isDisabled
						}
					}
				} */
				});

				//종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
				if (!isValidStr(sDay)) {
					eDate.datepicker({
						minDate : new Date(sDay.replace(/-/g, "/"))
					});
				}
				eDate.datepicker({
					language : 'ko',
					autoClose : true,
					onSelect : function() {
						datePickerSet(sDate, eDate);
					}
				/* 	onRenderCell : function(date, cellType) {
						if (cellType == 'day') {
							var day = date.getDay(), isDisabled = disabledDays
									.indexOf(day) != -1;

							return {
								disabled : isDisabled
							}
						}
					} */
				});

				//한개짜리 달력 datepicker
			} else if (!isValidStr(sDate)) {
				var sDay = sDate.val();
				if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
					var sdp = sDate.datepicker().data("datepicker");
					sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
				}

				sDate.datepicker({
					language : 'ko',
					autoClose : true
				});
			}

			function isValidStr(str) {
				if (str == null || str == undefined || str == "")
					return true;
				else
					return false;
			}
		}
	</script>
</body>

</html>