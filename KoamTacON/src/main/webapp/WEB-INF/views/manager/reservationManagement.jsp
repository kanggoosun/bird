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
<title>System Management - KoamTacON</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="/resources/air-datepicker/dist/css/datepicker.min.css">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/main.css' />" />
<!--[if lte IE 9]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie9.css' />" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie8.css' />" /><![endif]-->

<script src="/resources/air-datepicker/dist/js/datepicker.min.js"></script>
<script src="/resources/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
<!-- Scripts -->
<%@ include file="../include/incScripts.jsp"%>

</head>
<style>
h5 {
	display: flex;
	justify-content: center;
	align-items: center;
}

.double div {
	float: left;
	/* width: 10 */
	width: 1000px;
	padding: 10px;
	/* 	border: 5px solid green; */
	/* margin: auto; */
	/* 	display: inline; */
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
<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<%@ include file="../include/header_admin.jsp"%>
			<br>
			<%-- 		<%@ include file="../include/miniCalendar_admin.jsp"%> --%>
			<div class="inner">
				<section style="opacity: 1;">
					<form id="frmMainFilter" name="frmMainFilter">
						<div style="margin: 0 0 0.5em 0;" class="row">
							<div class="2u 12u$(medium) select-wrapper">
								<select id="cbSearchField" name="cbSearchField">
									<option value="usr.user_id">Owner ID</option>
									<option value="usr.name">Owner name</option>
									<option value="usr.company">Company</option>
									<option value="grp.group_code">Group code</option>
									<option value="grp.area">Area</option>
								</select>
							</div>
						</div>

						<div style="margin: 0 0 0.5em 0;" class="row">
							<!-- 	<div style="opacity: 0.8; position: relative;"
								class="2u 12u$(medium)">
								<input type="text" name="sKeyword" id="datepicker1" value=""
									placeholder="예약 시작일" />
							</div>

							<h4></h4>
							<div class="2u 12u$(medium)">
								<input type="text" name="sKeyword" id="datepicker2" value=""
									placeholder="예약 종료일" />
							</div> -->
							<%@ include file="../include/miniCalendar.jsp"%>

						</div>
						<div style="margin: 0 0 0.5em 0;" class="row">
							<div class="2u 12u$(medium) select-wrapper">
								<select id="cbSearchField" name="cbSearchField">
									<option value="usr.user_id">Owner ID</option>
									<option value="usr.name">Owner name</option>
									<option value="usr.company">Company</option>
									<option value="grp.group_code">Group code</option>
									<option value="grp.area">Area</option>
								</select>
							</div>
							<h4></h4>
							<div class="2u 12u$(medium)">
								<input type="text" name="sKeyword" id="sKeyword" value=""
									placeholder="이름" />
							</div>
							<!-- <div class="6u$ 12u$"> -->
							<div class="2u 12u$(medium) select-wrapper">
								<!-- 	<ul class="actions vertical"> -->
								<input type="button" name="btnSaveAdminInfo"
									id="btnSaveAdminInfo" value="Save" class="button special fit" />
								<!-- 	</ul> -->
							</div>
						</div>
					</form>
				</section>
			</div>


			<div class="inner">

				<!-- 	<section> -->
				<header class="main">
					<%-- <%@ include file="../include/minicalendar.jsp" %>  --%>
					<%-- <%@ include file="../include/footer.jsp" %> --%>

				</header>

				<h4>예약요청 관리</h4>
				<div id="tblApplicationList" class="table-wrapper">
					<table class="alt">
						<thead style="text-align: center; font-size: 0.8em;">
							<tr>
								<td width="3%">순번</td>
								<td width="4%">이름</td>
								<td width="6%">법인</td>
								<td width="6%">부서</td>
								<td width="6%">이메일</td>
								<td width="6%">핸드폰번호</td>
								<td width="6%">연수원</td>
								<td width="6%">요청일자</td>
								<td width="6%">시작일</td>
								<td width="6%">종료일</td>
								<td width="5%">이용목적</td>
								<td width="6%">이용요금</td>
								<td width="7%">승인 반려 일자</td>
								<td width="5%">상태</td>
								<td width="5%">취소분류</td>
								<td width="8%">취소 반려 사유</td>
								<td width="17%">실제 이용자 대표 이름</td>
								<td width="10%">실제 이용자 핸드폰번호</td>
								<td width="6%">실제 이용자 이메일</td>
								<td width="4%">차량번호</td>
								<td width="6%">비고</td>				
							</tr>
						</thead>


						<tbody style="text-align: center; font-size: 0.8em;">
							<tr>
								<td colspan="7" style="text-align: center;">55555555555555</td>
							</tr>
						</tbody>
						<tfoot style="font-size: 0.7em;">
							<tr>
								<td colspan="7" style="text-align: center;"
									id="tdPaginationApplication"></td>
							</tr>
							<tr>
								<td colspan="7" style="text-align: right;">
									<ul class="actions">
										<!--   <li><input type="button" name="btnNewApplication" id="btnNewApplication" value="New Application" class="button small special" /></li> -->
									</ul>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!-- Admin Information popup layer -->
	<div id="dim-layer-admin-info" class="dim-layer">
		<div id="dimBgAdminInfo" class="dimBg"></div>
		<div id="admin_info_layer" class="popcont-layer 12u$"
			style="width: 600px;">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<div id="adminInfoDiv">
						<form id="frmAdminInfoPop" method="post">
							<div class="row uniform">
								<h3 style="width: 300px;">예약</h3>
								<div class="6u 12u$(small)">
									<input type="text" name="userId" id="userId" value=""
										placeholder="이름" required="required" maxlength="15" /> <input
										type="hidden" name="flagIdDupeChk" id="flagIdDupeChk"
										value="false" /> <input type="hidden" name="flagSave"
										id="flagSave" value="" />
								</div>
								<!-- <div class="6u$ 12u$(small)">
									<input type="button" name="btnIdDupeChk" id="btnIdDupeChk"
										value="ID Duplication Check" class="button" />
								</div> -->
								<div class="6u 12u$(small)">
									<input type="text" name="name" id="name" value=""
										placeholder="법인" required="required" maxlength="50" />
								</div>
								<div class="6u$ 12u$(small)">
									<input type="email" name="email" id="email" value=""
										placeholder="부서" required="required" maxlength="50" />
								</div>
								<div class="6u 12u$(small)">
									<input type="text" name="name" id="name" value=""
										placeholder="이메일" required="required" maxlength="50" />
								</div>
								<div class="6u$ 12u$(small)">
									<input type="email" name="email" id="email" value=""
										placeholder="핸드폰번호" required="required" maxlength="50" />
								</div>
								<div class="6u 12u$(small)">
									<input type="text" name="name" id="name" value=""
										placeholder="연수원" required="required" maxlength="50" />
								</div>
								<div class="6u$ 12u$(small)">
									<input type="email" name="email" id="email" value=""
										placeholder="이용목적" required="required" maxlength="50" />
								</div>
								<div class="6u 12u$(small)">
									<input type="text" name="name" id="name" value=""
										placeholder="시작일" required="required" maxlength="50" />
								</div>
								<div class="6u$ 12u$(small)">
									<input type="email" name="email" id="email" value=""
										placeholder="종료일" required="required" maxlength="50" />
								</div>
								<div style="width: 550px; display: flex; align-items: center;">
									<h3 style="display: flex; align-items: center;">실제 이용자 정보</h3>
								</div>

								<div class="6u 12u(small)">
									<input type="text" name="name" id="name" value=""
										placeholder="이름" required="required" maxlength="50" />
								</div>

								<div class="6u 12u$(small)">
									<input type="email" name="email" id="email" value=""
										placeholder="핸드폰번호" required="required" maxlength="50" />
								</div>
								<div class="6u 12u$(small)">
									<input type="text" name="name" id="name" value=""
										placeholder="이메일" required="required" maxlength="50" />
								</div>
								<div class="6u$ 12u$(small)">
									<input type="email" name="email" id="email" value=""
										placeholder="차량번호" required="required" maxlength="50" />
								</div>
								<div class="6u 12u$(small)">
									<input type="text" name="name" id="name" value=""
										placeholder="비고" required="required" maxlength="50" />
								</div>

								<%-- <div class="6u 12u$(small)">
									<div class="select-wrappecr" id="divForCBCountry">
										<select id="cbCountry" name="cbCountry">
											<option value="">-- Select country --</option>
											<c:out value="${listCountryCode}" escapeXml="false" />
										</select>
									</div>
								</div> --%>
								<div class="6u$ 12u$">
									<ul class="actions vertical">
										<li><input type="button" name="btnSaveAdminInfo"
											id="btnSaveAdminInfo" value="Save" class="button special fit" /></li>
									</ul>
								</div>
							</div>
						</form>
					</div>

					<!--// content-->
					<div class="btn-r">
						<a href="#" id="closeAdminInfoPopup" class="btn-layerClose">Close</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- popup layer -->
	<%@ include file="../include/popupLayer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			var msg = "<c:out value='${msg}' />";
			if (msg != null && msg != "") {
				gfn_layerPopup(msg);
			}

			gfn_toggleMenu('.systemMgmt');

			fn_getApplicationList(1);
		});

		function fn_getApplicationList(pageNo) {
			var param = "";
			param += "curPage=" + pageNo;
			param += "&";
			param += "callFunction=fn_getApplicationList";

			gf_send(
					"<c:url value='/manager/reservationManagement/getApplicationList' />",
					param, "fn_getApplicationListCallback");
		}

		function fn_getApplicationListCallback(data) {
			var applicationList = data.applicationList;
			var paginationHtml = data.pageInfo.paginationHtml;

			fn_makeTblApplicationList(applicationList, paginationHtml);
		}

		function fn_makeTblApplicationList(applicationList, paginationHtml) {
			var bodyHtml = "";
			var pageHtml = "";

			if (applicationList != null && applicationList.length > 0) {
				for (var i = 0; i < applicationList.length; i++) {
					bodyHtml += "<tr id=\"trApplicationList-"+i+"\">";

					bodyHtml += "    <td id=\"tdNo-"+i+"\">"
							+ gfn_nullValue(applicationList[i].no) + "</td>";
					bodyHtml += "    <td id=\"tdName-"+i+"\">"
							+ gfn_nullValue(applicationList[i].name) + "</td>";
					bodyHtml += "    <td id=\"tdCop_cd-"+i+"\">"
							+ gfn_nullValue(applicationList[i].cop_cd)
							+ "</td>";
					bodyHtml += "    <td id=\"tdDep_nm-"+i+"\">"
							+ gfn_nullValue(applicationList[i].dep_nm)
							+ "</td>";
					bodyHtml += "    <td id=\"tdEmail-"+i+"\">"
							+ gfn_nullValue(applicationList[i].email)
							+ "</td>";
					bodyHtml += "    <td id=\"tdPhone-"+i+"\">"
							+ gfn_nullValue(applicationList[i].phone)
							+ "</td>";
					bodyHtml += "    <td id=\"tdPlace_cd-"+i+"\">"
							+ gfn_nullValue(applicationList[i].place_cd)
							+ "</td>";
					bodyHtml += "    <td id=\"tdReq_day-"+i+"\">"
							+ gfn_nullValue(applicationList[i].req_day)
							+ "</td>";
					bodyHtml += "    <td id=\"tdSta_day-"+i+"\">"
							+ gfn_nullValue(applicationList[i].sta_day)
							+ "</td>";
					bodyHtml += "    <td id=\"tdEnd_day-"+i+"\">"
							+ gfn_nullValue(applicationList[i].end_day)
							+ "</td>";
					bodyHtml += "    <td id=\"tdUse_aim_cd-"+i+"\">"
							+ gfn_nullValue(applicationList[i].use_aim_cd)
							+ "</td>";
					bodyHtml += "    <td id=\"tdTot_cost-"+i+"\">"
							+ gfn_nullValue(applicationList[i].tot_cost)
							+ "</td>";
					bodyHtml += "    <td id=\"tdApp_rej_day-"+i+"\">"
							+ gfn_nullValue(applicationList[i].app_rej_day)
							+ "</td>";
					bodyHtml += "    <td id=\"tdRes_sts_cd-"+i+"\">"
							+ gfn_nullValue(applicationList[i].res_sts_cd)
							+ "</td>";
					bodyHtml += "    <td id=\"tdRej_sort_cd-"+i+"\">"
							+ gfn_nullValue(applicationList[i].rej_sort_cd)
							+ "</td>";
					bodyHtml += "    <td id=\"tdCan_rej_cau-"+i+"\">"
							+ gfn_nullValue(applicationList[i].can_rej_cau)
							+ "</td>";
					bodyHtml += "    <td id=\"tdReal_use_nm-"+i+"\">"
							+ gfn_nullValue(applicationList[i].real_use_nm)
							+ "</td>";
					bodyHtml += "    <td id=\"tdReal_use_phone-"+i+"\">"
							+ gfn_nullValue(applicationList[i].real_use_phone)
							+ "</td>";
					bodyHtml += "    <td id=\"tdReal_use_email-"+i+"\">"
							+ gfn_nullValue(applicationList[i].real_use_email)
							+ "</td>";
					bodyHtml += "    <td id=\"tdReal_use_car_no-"+i+"\">"
							+ gfn_nullValue(applicationList[i].real_use_car_no)
							+ "</td>";	
					bodyHtml += "    <td id=\"tdRmk-"+i+"\">"
							+ gfn_nullValue(applicationList[i].rmk) 
							+ "</td>";
					bodyHtml += "    <td id=\"tdSeq-"+i+"\">"
							+gfn_nullValue(applicationList[i].seq)
							+ "</td>";	
					bodyHtml += "</tr>";
				}
				pageHtml = paginationHtml;
			} else {
				bodyHtml += "<tr><td colspan=\"7\" style=\"text-align:center;\">There is no data.</td></tr>";
			}

			$("#tblApplicationList tbody").html(bodyHtml);
			$("#tblApplicationList tfoot #tdPaginationApplication").html(
					pageHtml);
		}

		$(document).on("click", "#tblApplicationList tbody td", function(e) {
			e.preventDefault();

			var id = $(this).attr("id");
			var no = id.split("-")[1];

			fn_AdminInfoPop(no);
		});

		function fn_clearFrmAdminInfoPop() {
			$("#userId").val("");
			$("#name").val("");
			$("#email").val("");
			$("#cbCountry").val("");
			$('#cbCountry option:eq(0)').attr('selected', 'selected');
			$("#flagIdDupeChk").val("false");
			$("#flagSave").val("");
		}
		function fn_AdminInfoPop(no) {
			fn_clearFrmAdminInfoPop();

			if (no === null || no === "") {
				$("#flagSave").val("I");
			} else {
				$("#flagSave").val("U");
				$("#userId").val($("#userId-" + no).val());
				$("#name").val($("#tdReal_use_nm-" + no).text());
				$("#email").val($("#tdUserEmail-" + no).text());
				$("#cbCountry").val($("#countryCode-" + no).val()).prop(
						"selected", true);
			}

			gfn_customLayerPopup('dim-layer-admin-info', 'dimBgAdminInfo',
					'admin_info_layer', 'closeAdminInfoPopup');
		}

		function fn_submitAdminInfo() {
			var frmId = "frmAdminInfoPop";

			if ($("#flagSave").val() === "I"
					&& eval($("#flagIdDupeChk").val()) === false) {
				gfn_layerPopup("Click the ID Duplication Check button to check whether id exists already, if not, you can create the id.");
				return false;
			}

			if (gfn_checkRequired(frmId) === true) {
				if (gfn_checkFormat(frmId) === true) {
					if ($("#flagSave").val() === "I") {
						gf_sendForm(
								frmId,
								"<c:url value='/manager/reservationManagement/insertApplication' />",
								"fn_submitAdminInfoCallback");
					} else {
						gf_sendForm(
								frmId,
								"<c:url value='/manager/reservationManagement/updateApplication' />",
								"fn_submitAdminInfoCallback");
					}
				}
			}
		}

		function fn_submitAdminInfoCallback(data) {
			$('#dim-layer-admin-info').fadeOut();
			gfn_layerPopup(data.msg);

			fn_getAdminInfoList(1);
		}

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