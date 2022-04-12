<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- global header -->
<%@ include file="../include/gheader.jsp" %>

<!DOCTYPE HTML>
<!--
    Editorial by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title><spring:message code='MENU-APPLICATIONS' text='Applications' /> - KoamTacON</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!--[if lte IE 8]><script src="<c:url value='/resources/assets/js/ie/html5shiv.js' />"></script><![endif]-->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/main.css' />" />
    <!--[if lte IE 9]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie9.css' />" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie8.css' />" /><![endif]-->

    <!-- Scripts -->
    <%@ include file="../include/incScripts.jsp" %>

</head>

<body>
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <!-- Header -->
        <%@ include file="../include/header.jsp" %>
        <div class="inner">
            
            <section>
                <header class="main">
                    <h2><spring:message code='MENU-TICKETVALIDATION' text='Ticket Validation' /></h2>
                </header>
                
                <div id="divRequest" class="12u$ 12u$(small)"></div>
                
                <div id="divApproval" class="12u$ 12u$(small)" style="text-align:center;"></div>
                
                <div id="divBtn" class="12u$ 12u$(small)"></div>
                <div id="divGuide" class="12u$ 12u$(small) abox">
                	<ul>
                		<li>
                    		<spring:message code='MSG-VW064' text='If you have registered new sold tickets information, please click "EVENT INFORMATION SETTING" button to update event information.' />
                    	</li>
                    </ul>
                </div>
                <br>
                <div id="divSearch" class="row">
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch1" name="cbSearch1">
                            <option value="00"><spring:message code='WRD-SELECT' text='select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword1" name="keyword1" value="" placeholder="<spring:message code='WRD-ENTKW' text='Enter Keyword' />">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch2" name="cbSearch2">
                            <option value="00"><spring:message code='WRD-SELECT' text='select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword2" name="keyword2" value="" placeholder="<spring:message code='WRD-ENTKW' text='Enter Keyword' />">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch3" name="cbSearch3">
                            <option value="00"><spring:message code='WRD-SELECT' text='select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword3" name="keyword3" value="" placeholder="<spring:message code='WRD-ENTKW' text='Enter Keyword' />">
                    </div>
                    <div id="divConcat" class="2u$ 12u$(small) row">
                        <div class="5u 12u$(small)">
                            <input type="radio" id="andSearch" name="searchConcat" value="1">
                            <label for="andSearch"><spring:message code='WRD-AND' text='AND' /></label>
                        </div>
                        <div class="5u$ 12u$(small)">
                            <input type="radio" id="orSearch" name="searchConcat" value="0">
                            <label for="orSearch"><spring:message code='WRD-OR' text='OR' /></label>
                        </div>
                    </div>
                </div>
                <br>
                
                <div id="tblApplicationData" class="table-wrapper"></div>
                
                <div id="divIntroductionView" class="12u$ 12u$(small)"></div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Excel import popup layer -->
<div id="dim-layer-excel" class="dim-layer">
    <div id="dimBgExcel" class="dimBg"></div>
    <div id="excel_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="excelDiv" >
                    <form id="frmExcel" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="importTarget" id="importTarget" value="" />
                        <div class="row uniform">
                            <div class="12u 12u$">
                                <input type="file" name="excelFile" id="excelFile" value="" required="required" placeholder="<spring:message code='WRD-ENTEXL' text='Enter Excel' />" maxlength="200" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnExcelImport" id="btnExcelImport" value="<spring:message code='WRD-IMPORT' text='Import' />" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeExcelPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Project image popup layer -->
<div id="dim-layer-prjImg" class="dim-layer">
    <div id="dimBgPrjImg" class="dimBg"></div>
    <div id="prjImg_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="prjImgDiv" >
                    <form id="frmPrjImg" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="projectSeq" name="projectSeq" value="" />
                        <div class="row uniform">
                            <div id="prjTitle" class="12u$ 12u$"></div>
                            <div id="prjImage" class="12u$ 12u$"></div>
                            <div id="uploadImage" class="12u$ 12u$">
                                <div class="12u$ 12u$">
                                    <label for="projectImage">Select the image for project.</label>
	                                <input type="file" name="projectImage" id="projectImage" value="" placeholder="<spring:message code='WRD-PRJIMG' text='Project Image' />" maxlength="200" accept="image/*" />
	                            </div>
	                            <div class="12u$ 12u$">
	                                <ul class="actions vertical">
	                                    <li><input type="button" name="btnImageUpload" id="btnImageUpload" value="<spring:message code='WRD-UPLOAD' text='upload' />" class="button special small fit" /></li>
	                                </ul>
	                            </div>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closePrjImgPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvUserType = "";
var gvGroupCode = "";
var gvPageNo = 1;

$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.apps');
    
    gvUserType = "<c:out value='${__userType }' />";
    gvGroupCode = gfn_nullValue("<c:out value='${__groupCode }' />");
    
    fn_getApplicationMap();
    fn_getSearchOptions("MA_TICKET_VALIDATION");
});

function fn_getSearchOptions(tabname) {
    var param = "";
    param += "tabname="+tabname;
    
    gf_send("<c:url value='/apps/common/getSelectOptions' />", param, "fn_getSearchOptionsCallback");
}

function fn_getSearchOptionsCallback(data) {
    var options = data.options;
    
    $("#cbSearch1").empty();
    $("#cbSearch2").empty();
    $("#cbSearch3").empty();
    
    if (options != null && options.length > 0) {
        $("#cbSearch1").append($("<option value=\"00\"><spring:message code='WRD-SELECT' text='select' /></option>"));
        $("#cbSearch1").append(options);
        $("#cbSearch2").append($("<option value=\"00\"><spring:message code='WRD-SELECT' text='select' /></option>"));
        $("#cbSearch2").append(options);
        $("#cbSearch3").append($("<option value=\"00\"><spring:message code='WRD-SELECT' text='select' /></option>"));
        $("#cbSearch3").append(options);
    }
    $("#divConcat").html("");
    var divConcatHtml = "";
    divConcatHtml += "<div class=\"5u 12u$(small)\">";
    divConcatHtml += "    <input type=\"radio\" id=\"andSearch\" name=\"searchConcat\" value=\"1\">";
    divConcatHtml += "    <label for=\"andSearch\"><spring:message code='WRD-AND' text='AND' /></label>";
    divConcatHtml += "</div>";
    divConcatHtml += "<div class=\"5u$ 12u$(small)\">";
    divConcatHtml += "    <input type=\"radio\" id=\"orSearch\" name=\"searchConcat\" value=\"0\">";
    divConcatHtml += "    <label for=\"orSearch\"><spring:message code='WRD-OR' text='OR' /></label>";
    divConcatHtml += "</div>";
    $("#divConcat").html(divConcatHtml);
    $("input:radio[name=searchConcat]:input[value=1]").attr("checked", true);
    $(".clsConcat").html("");
    $(".clsConcat").html("<h2><spring:message code='WRD-AND' text='AND' /></h2>");
}

function fn_getApplicationMap() {
    var param = "";
    param += "applicationSeq=6";
    
    gf_send("<c:url value='/applications/getApplicationMap' />", param, "fn_getApplicationMapCallback");
}

function fn_getApplicationMapCallback(data) {
    fn_showView(data, gfn_nullValue(data.applicationMap.requestTarget), gfn_nullValue(data.applicationMap.approvalFlag));
}

function fn_showView(data, requestTarget, approvalFlag) {
    if (gvUserType === "0" || gvUserType === "1" || gvUserType === "3") {
        if (gvGroupCode === "") {
            fn_makeDivApproval(data.applicationMap);
        } else {
            fn_makeDivBtn("btnTicketValidationView");
            gvCurScr = "VALIDATION_LIST";
            fn_getTicketValidation(1);
        }
    }
}

function fn_makeDivApproval(applicationMap) {
    var divHtml = "";
    
    if (gvUserType === "0") {
        //divHtml += "<div class=\"12u$ 12u$(small)\">";
        if (gvGroupCode === "") {
            divHtml += "<h2><spring:message code='MSG-VW061' text='Create your group first in' /> <a href=\"<c:url value='/group/groupInfo' />\">[<spring:message code='WRD-GM' text='Group Management' />]</a> <spring:message code='MSG-VW073' text='menu.' /></h2>";
        } else {
            var flag = gfn_nullValue(applicationMap.approvalFlag);
            if (flag === "3") {
                //divHtml += "<p>관리자가 다음과 같은 사유로 사용 요청을 거부하였습니다.<br/>";
                divHtml += applicationMap.comment;
                divHtml += "</p>";
            } else if (flag === "0" || flag === "1") {
                //divHtml += "<p>현재 관리자가 승인 처리 작업 진행 중입니다. 관련 자료 연동 작업에 시간이 걸리오니 양해 바랍니다.</p>";
            } else {
                divHtml += "<p><spring:message code='MSG-VW062=' text='You have not applied for use for this application.' /> <spring:message code='MSG-VW063' text='Please click the button below to apply.' /></p>";
                divHtml += "<ul class=\"actions vertical\">";
                divHtml += "    <li><input type=\"button\" name=\"btnApply\" id=\"btnApply\" value=\"<spring:message code='WRD-APPLY' text='Apply' />\" class=\"button special\" /></li>";
                divHtml += "</ul>";
            }
        }
        //divHtml += "</div>";
    }

    $("#divApproval").html("");
    $("#divApproval").html(divHtml);
}

function fn_makeDivBtn(divBtnId) {
    var divHtml = "";

    $("#divBtn").html("");
    if (gvGroupCode != null && gvGroupCode != "" && gvGroupCode != "undefined") {
        divHtml += "<ul class=\"actions\">";
        divHtml += "    <li><input type=\"button\" name=\"btnTicketValidationView\" id=\"btnTicketValidationView\" value=\"<spring:message code='WRD-TICKETVALIDLIST' text='Ticket Validation LIST' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnSoldTicketView\" id=\"btnSoldTicketView\" value=\"<spring:message code='WRD-SOLDTICKETS' text='Sold tickets' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnProjectView\" id=\"btnProjectView\" value=\"<spring:message code='WRD-PROJECTS' text='Projects' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnLocationView\" id=\"btnLocationView\" value=\"<spring:message code='WRD-LOCATIONS' text='Locations' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnTimeView\" id=\"btnTimeView\" value=\"<spring:message code='WRD-TIME' text='Time' />\" class=\"button\" /></li>";
        if (gvUserType != "3") {
        	divHtml += "    <li><input type=\"button\" name=\"btnMakeEventInfo\" id=\"btnMakeEventInfo\" value=\"<spring:message code='WRD-EVNTINFSET' text='Event Information Setting' />\" class=\"button\" /></li>";
        }
        divHtml += "</ul>";
        
        $("#divBtn").html(divHtml);
        
        if (!$("#"+divBtnId).hasClass("special")) {
            $("#"+divBtnId).toggleClass("special");
        }
    }
}

function fn_getTicketValidation(pageNo) {
	gvPageNo = pageNo;
	
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getTicketValidation";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/ticketValidation/getTicketValidation' />", param, "fn_getTicketValidationCallback");
}

function fn_getTicketValidationCallback(data) {
    var list = data.ticketValidationList;
    var def = data.ticketValidationDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithTicketValidation(list, paginationHtml, def);
}

function fn_makeSearchParam() {
    var searchParam = "";
    
    if ($("#cbSearch1").val() != null && $("#cbSearch1").val() != "" && $("#cbSearch1").val() != "undefined" && $("#cbSearch1").val() != "00") {
        if ($("#keyword1").val() != null && $("#keyword1").val() != "" && $("#keyword1").val() != "undefined") {
            searchParam += "&";
            searchParam += "cbSearch1="+$("#cbSearch1").val();
            searchParam += "&";
            searchParam += "keyword1="+$("#keyword1").val();
        }
    }
    if ($("#cbSearch2").val() != null && $("#cbSearch2").val() != "" && $("#cbSearch2").val() != "undefined" && $("#cbSearch2").val() != "00") {
        if ($("#keyword2").val() != null && $("#keyword2").val() != "" && $("#keyword2").val() != "undefined") {
            searchParam += "&";
            searchParam += "cbSearch2="+$("#cbSearch2").val();
            searchParam += "&";
            searchParam += "keyword2="+$("#keyword2").val();
        }
    }
    if ($("#cbSearch3").val() != null && $("#cbSearch3").val() != "" && $("#cbSearch3").val() != "undefined" && $("#cbSearch3").val() != "00") {
        if ($("#keyword3").val() != null && $("#keyword3").val() != "" && $("#keyword3").val() != "undefined") {
            searchParam += "&";
            searchParam += "cbSearch3="+$("#cbSearch3").val();
            searchParam += "&";
            searchParam += "keyword3="+$("#keyword3").val();
        }
    }
    searchParam += "&";
    searchParam += "concat="+$("input:radio[name='searchConcat']:checked").val();
    
    return searchParam;
}

function fn_makeTblApplicationDataWithTicketValidation(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-VALIDSEQ' text='Validation Seq' /></th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr>";
            tblHtml += "    <td>"+applicationDataList[i].reckey+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val01+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val02+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val03+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val04+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val05+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportTicketValidation\" id=\"btnExcelExportTicketValidation\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"6\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"6\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"6\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}

function fn_templateDownload(template) {
	var filename = '';
	
	if (template =='1') {
		filename = 'Template_TV_Projects.xlsx';
	} else if (template =='2') {
		filename = 'Template_TV_Locations.xlsx';
	} else if (template =='3') {
		filename = 'Template_TV_Time.xlsx';
	} else if (template =='4') {
		filename = 'Template_TV_Sold_Tickets.xlsx';
	} else {
		filename = '';
		gfn_layerPopup("<spring:message code='MSG-VW066' text='Please select a template to download.' />");
		
	}
	
	if (filename != '') {
	    var param = "";
	    param += "flag="+"template";
	    param += "&";
	    param += "filename="+filename;
	    
	    gf_genFileDownLoad(param);
	}
}

function fn_excelPopup(target) {
	var importTarget = '';
	
	if (target == '0') {
		importTarget = '';
        gfn_layerPopup("<spring:message code='MSG-VW067' text='Please select the target to import.' />");
    } else if (target =='1') {
    	importTarget = 'project';
    } else if (target =='2') {
    	importTarget = 'location';
    } else if (target =='3') {
    	importTarget = 'time';
    } else if (target =='4') {
    	importTarget = 'soldTicket';
    } else {
    	importTarget = '';
    	gfn_layerPopup("<spring:message code='MSG-VW067' text='Please select the target to import.' />");
    }
	
	if (importTarget != '') {
		$("#importTarget").val("");
		$("#importTarget").val(importTarget);
	    $("#excelFile").val("");
	    
	    gfn_customLayerPopup('dim-layer-excel', 'dimBgExcel', 'excel_layer', 'closeExcelPopup');
	}
}

function fn_excelImport() {
    var frmId = "frmExcel";
    var importTarget = $("#importTarget").val();
    var targetUrl = '';
    
    if (importTarget =='project') {
    	targetUrl = "<c:url value='/WSApi/importTVProjects' />";
    } else if (importTarget =='location') {
    	targetUrl = "<c:url value='/WSApi/importTVLocations' />";
    } else if (importTarget =='time') {
    	targetUrl = "<c:url value='/WSApi/importTVTime' />";
    } else if (importTarget =='soldTicket') {
    	targetUrl = "<c:url value='/WSApi/importTVSoldTickets' />";
    } else {
    	targetUrl = '';
        gfn_layerPopup("<spring:message code='MSG-VW067' text='Please select the target to import.' />");
    }
    
    if (gfn_checkRequired(frmId) === true && targetUrl != '') {
        $('#dim-layer-excel').fadeOut();
        gf_sendFileForm(frmId, targetUrl, "fn_excelImportCallback");
    }
}

function fn_excelImportCallback(data) {
    gfn_layerPopup(data.msg);
    if (data.result === "success") {
    	var importTarget = $("#importTarget").val();
    	if (importTarget =='project') {
    		fn_getProjects(1);
        } else if (importTarget =='location') {
        	fn_getLocations(1);
        } else if (importTarget =='time') {
        	fn_getTime(1);
        } else if (importTarget =='soldTicket') {
        	fn_getSoldTickets(1);
        }
    }
}

var strClickEventNm  = "";
strClickEventNm += "#btnTicketValidationView, #btnExcelExportTicketValidation";
strClickEventNm += ", #btnSoldTicketView, #btnExcelExportSoldTicket, #btnDowonloadSoldTicketTemplate, #btnSoldTicketImport";
strClickEventNm += ", #btnProjectView, #btnExcelExportProject, #btnDowonloadProjectTemplate, #btnProjectImport";
strClickEventNm += ", #btnLocationView, #btnExcelExportLocation, #btnDowonloadLocationTemplate, #btnLocationImport";
strClickEventNm += ", #btnTimeView, #btnExcelExportTime, #btnDowonloadTimeTemplate, #btnTimeImport";
strClickEventNm += ", #btnExcelImport, #btnImageUpload, #btnMakeEventInfo";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
    if (id === "btnTicketValidationView") {
    	fn_makeDivBtn("btnTicketValidationView");
        fn_getSearchOptions("MA_TICKET_VALIDATION");
        gvCurScr = "VALIDATION_LIST";
        fn_getTicketValidation(1);
    } else if (id === "btnExcelExportTicketValidation") {
    	fn_excelExport("ticket-validation");
    } else if (id === "btnSoldTicketView") {
    	fn_makeDivBtn("btnSoldTicketView");
        fn_getSearchOptions("MA_TV_SOLD_TICKETS");
        gvCurScr = "SOLD_TICKET_LIST";
        fn_getSoldTickets(1);
    } else if (id === "btnExcelExportSoldTicket") {
    	fn_excelExport("sold-tickets");
    } else if (id === "btnDowonloadSoldTicketTemplate") {
    	fn_templateDownload('4');
    } else if (id === "btnSoldTicketImport") {
    	fn_excelPopup('4');
    } else if (id === "btnProjectView") {
    	fn_makeDivBtn("btnProjectView");
        fn_getSearchOptions("MA_TV_PROJECTS");
        gvCurScr = "PROJECT_LIST";
        fn_getProjects(1);
    } else if (id === "btnExcelExportProject") {
    	fn_excelExport("projects");
    } else if (id === "btnDowonloadProjectTemplate") {
    	fn_templateDownload('1');
    } else if (id === "btnProjectImport") {
    	fn_excelPopup('1');
    } else if (id === "btnLocationView") {
    	fn_makeDivBtn("btnLocationView");
        fn_getSearchOptions("MA_TV_LOCATIONS");
        gvCurScr = "LOCATION_LIST";
        fn_getLocations(1);
    } else if (id === "btnExcelExportLocation") {
    	fn_excelExport("locations");
    } else if (id === "btnDowonloadLocationTemplate") {
    	fn_templateDownload('2');
    } else if (id === "btnLocationImport") {
    	fn_excelPopup('2');
    } else if (id === "btnTimeView") {
    	fn_makeDivBtn("btnTimeView");
        fn_getSearchOptions("MA_TV_TIME");
        gvCurScr = "TIME_LIST";
        fn_getTime(1);
    } else if (id === "btnExcelExportTime") {
    	fn_excelExport("time");
    } else if (id === "btnDowonloadTimeTemplate") {
    	fn_templateDownload('3');
    } else if (id === "btnTimeImport") {
    	fn_excelPopup('3');
    } else if (id === "btnExcelImport") {
    	fn_excelImport();
    } else if (id === "btnImageUpload") {
    	fn_uploadImage();
    } else if (id === "btnMakeEventInfo") {
    	fn_makeEventInfo();
    }
}

function fn_excelExport(filename) {
    var param = "";
    param += "filename="+filename;
    param += "&";
    param += "groupCode="+gvGroupCode;
    param += fn_makeSearchParam();
    
    document.location.href = "/common/excelExport?"+param;
}

function fn_getSoldTickets(pageNo) {
	gvPageNo = pageNo; 
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getSoldTickets";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/ticketValidation/getSoldTickets' />", param, "fn_getSoldTicketsCallback");
}

function fn_getSoldTicketsCallback(data) {
    var list = data.soldTicketsList;
    var def = data.soldTicketsDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithSoldTickets(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithSoldTickets(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-SOLDTICKETSEQ' text='Sold Ticket Seq' /></th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval09+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval10+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval11+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval12+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval13+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval14+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval15+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval16+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval17+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval18+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval19+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval20+"</th>";
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr>";
            tblHtml += "    <td>"+applicationDataList[i].reckey+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val01+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val02+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val03+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val04+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val05+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val06+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val07+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val08+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val09+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val10+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val11+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val12+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val13+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val14+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val15+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val16+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val17+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val18+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val19+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val20+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadSoldTicketTemplate\" id=\"btnDowonloadSoldTicketTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnSoldTicketImport\" id=\"btnSoldTicketImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportSoldTicket\" id=\"btnExcelExportSoldTicket\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"20\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadSoldTicketTemplate\" id=\"btnDowonloadSoldTicketTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnSoldTicketImport\" id=\"btnSoldTicketImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"20\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"20\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}

function fn_getProjects(pageNo) {
	gvPageNo = pageNo;
	
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getProjects";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/ticketValidation/getProjects' />", param, "fn_getProjectsCallback");
}

function fn_getProjectsCallback(data) {
    var list = data.projectsList;
    var def = data.projectsDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithProjects(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithProjects(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-PRJSEQ' text='Project Seq' /></th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval09+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval10+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval11+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval12+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval13+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval14+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval15+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval16+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval17+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval18+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval19+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval20+"</th>";
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr id=\"prjTr-"+i+"\">";
            tblHtml += "    <input type=\"hidden\" id=\"prjSeq-"+i+"\" value=\""+applicationDataList[i].reckey+"\">";
            tblHtml += "    <td>"+applicationDataList[i].reckey+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val01+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val02+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val03+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val04+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val05+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val06+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val07+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val08+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val09+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val10+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val11+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val12+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val13+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val14+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val15+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val16+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val17+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val18+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val19+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val20+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadProjectTemplate\" id=\"btnDowonloadProjectTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnProjectImport\" id=\"btnProjectImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportProject\" id=\"btnExcelExportProject\" value=\"<spring:message code='' text='' />Export\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"7\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadProjectTemplate\" id=\"btnDowonloadProjectTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnProjectImport\" id=\"btnProjectImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"7\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"7\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}

function fn_getLocations(pageNo) {
	gvPageNo = pageNo;
	
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getLocations";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/ticketValidation/getLocations' />", param, "fn_getLocationsCallback");
}

function fn_getLocationsCallback(data) {
    var list = data.locationsList;
    var def = data.locationsDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithLocations(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithLocations(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-LOCSEQ' text='Location Seq' /></th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval09+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval10+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval11+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval12+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval13+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval14+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval15+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval16+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval17+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval18+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval19+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval20+"</th>";
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr>";
            tblHtml += "    <td>"+applicationDataList[i].reckey+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val01+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val02+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val03+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val04+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val05+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val06+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val07+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val08+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val09+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val10+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val11+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val12+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val13+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val14+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val15+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val16+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val17+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val18+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val19+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val20+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadLocationTemplate\" id=\"btnDowonloadLocationTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnLocationImport\" id=\"btnLocationImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportLocation\" id=\"btnExcelExportLocation\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"10\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadLocationTemplate\" id=\"btnDowonloadLocationTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnLocationImport\" id=\"btnLocationImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"10\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"10\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}

function fn_getTime(pageNo) {
	gvPageNo = pageNo;
	
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getTime";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/ticketValidation/getTime' />", param, "fn_getTimeCallback");
}

function fn_getTimeCallback(data) {
    var list = data.timeList;
    var def = data.timeDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithTime(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithTime(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-TIMESEQ' text='Time Seq' /></th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval09+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval10+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval11+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval12+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval13+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval14+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval15+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval16+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval17+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval18+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval19+"</th>";
    //tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval20+"</th>";
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr>";
            tblHtml += "    <td>"+applicationDataList[i].reckey+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val01+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val02+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val03+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val04+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val05+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val06+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val07+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val08+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val09+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val10+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val11+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val12+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val13+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val14+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val15+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val16+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val17+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val18+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val19+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val20+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadTimeTemplate\" id=\"btnDowonloadTimeTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnTimeImport\" id=\"btnTimeImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportTime\" id=\"btnExcelExportTime\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"4\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadTimeTemplate\" id=\"btnDowonloadTimeTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnTimeImport\" id=\"btnTimeImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"4\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"4\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}

$(document).on("click", "#tblApplicationData tbody tr", function(e){
    e.preventDefault();

    var tid = $(this).attr("id");
    if (tid != null && tid != '' && tid != 'undefined') {
    	var id = tid.split("-")[0];
    	var no = tid.split("-")[1];

    	if (id == 'prjTr') {
    		fn_getProjectInfo(no);
    	}
    }
    /* if (no == '0') {
    	var titleHtml = "<h4>The phantom of the opera</h4>";
	    var imgHtml = "<img src='http://54.173.68.163/server_marketingtest/resources/DETAIL/201804240813450_MA_TV_PROJECTS_2018040001_THEPHANTOMOFTHEOPERA.JPG' />";
	    
	    $("#prjTitle").html("");
        $("#prjTitle").html(titleHtml);
	    $("#prjImage").html("");
	    $("#prjImage").html(imgHtml);
	    
	    gfn_customLayerPopup('dim-layer-prjImg', 'dimBgPrjImg', 'prjImg_layer', 'closePrjImgPopup');
    } */
});

function fn_getProjectInfo(no) {
	var prjSeq = $("#prjSeq-"+no).val();
	var param = "";
	param += "reckey="+prjSeq;
	
	gf_send("<c:url value='/apps/ticketValidation/getProjectInfo' />", param, "fn_getProjectInfoCallbak");
}

function fn_getProjectInfoCallbak(data) {
	var list = data.projectList;
	
	if (list != null && list.length == 1) {
		var reckey = list[0].reckey;
		var title = list[0].val01;
		var titleHtml = "<h2>"+title+"</h2>";
		var imgNm = list[0].hval01;
		//var imgPath = "http://54.173.68.163/server_marketingtest/resources/DETAIL/";
		var imgPath = "<c:out value='${ detailImage }' />";
		var imgHtml = "";
		
		if (imgNm != null && imgNm != "" && imgNm != "undefined") {
			imgHtml = "<img src=\""+imgPath + imgNm+"\" style=\"max-width:600px;height:auto;\"/>";
		} else {
			imgHtml = "<h5><spring:message code='MSG-VW078' text='No image.' /></h5>";
		}
		
		$("#projectSeq").val(reckey);
		$("#prjTitle").html("");
        $("#prjTitle").html(titleHtml);
        $("#prjImage").html("");
        $("#prjImage").html(imgHtml);
        
        gfn_customLayerPopup('dim-layer-prjImg', 'dimBgPrjImg', 'prjImg_layer', 'closePrjImgPopup');
	}
}

function fn_uploadImage() {
	var flag = gf_getBrowserCheck();
	var frmId = "frmPrjImg";
	var prjImg = gfn_nullValue($("#projectImage").val());
	
	if (prjImg == "") {
		gfn_layerPopup("<spring:message code='MSG-VW068' text='Please enter the image for project.' />");
	} else {
		$('#dim-layer-prjImg').fadeOut();
	    gf_sendFileForm(frmId, "<c:url value='/WSApi/uploadProjectImage' />", "fn_uploadImageCallback");
	}
}

function fn_uploadImageCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.result === "success") {
		fn_getProjects(gvPageNo);
	}
}

var strChangeEventNm = "#cbSearch1, #cbSearch2, #cbSearch3, #andSearch, #orSearch";
$(document).on("change", strChangeEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var val = $(this).val();
    
    if (id === "cbSearch1") {
    	if (val != null && val != "" && val != "undefined" && val != "00") {
    		if ($("#keyword1").val() != null && $("#keyword1").val() != "" && $("#keyword1").val() != "undefined") {
    			if (gvCurScr === "VALIDATION_LIST") {
    				fn_getTicketValidation(1);
    	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
    	        	fn_getSoldTickets(1);
    	        } else if (gvCurScr === "PROJECT_LIST") {
    	        	fn_getProjectInfo(1);
    	        } else if (gvCurScr === "LOCATION_LIST") {
    	        	fn_getLocations(1);
    	        } else if (gvCurScr === "TIME_LIST") {
    	        	fn_getTime(1);
    	        }
    		}
    	}
    } else if (id === "cbSearch2") {
    	if (val != null && val != "" && val != "undefined" && val != "00") {
            if ($("#keyword2").val() != null && $("#keyword2").val() != "" && $("#keyword2").val() != "undefined") {
            	if (gvCurScr === "VALIDATION_LIST") {
    				fn_getTicketValidation(1);
    	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
    	        	fn_getSoldTickets(1);
    	        } else if (gvCurScr === "PROJECT_LIST") {
    	        	fn_getProjectInfo(1);
    	        } else if (gvCurScr === "LOCATION_LIST") {
    	        	fn_getLocations(1);
    	        } else if (gvCurScr === "TIME_LIST") {
    	        	fn_getTime(1);
    	        }
            }
    	}
    } else if (id === "cbSearch3") {
    	if (val != null && val != "" && val != "undefined" && val != "00") {
            if ($("#keyword3").val() != null && $("#keyword3").val() != "" && $("#keyword3").val() != "undefined") {
            	if (gvCurScr === "VALIDATION_LIST") {
    				fn_getTicketValidation(1);
    	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
    	        	fn_getSoldTickets(1);
    	        } else if (gvCurScr === "PROJECT_LIST") {
    	        	fn_getProjectInfo(1);
    	        } else if (gvCurScr === "LOCATION_LIST") {
    	        	fn_getLocations(1);
    	        } else if (gvCurScr === "TIME_LIST") {
    	        	fn_getTime(1);
    	        }
            }
        }
    }
    
    if (id === "andSearch") {
    	$(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-AND' text='AND' /></h2>");
        if (gvCurScr === "VALIDATION_LIST") {
			fn_getTicketValidation(1);
        } else if (gvCurScr === "SOLD_TICKET_LIST") {
        	fn_getSoldTickets(1);
        } else if (gvCurScr === "PROJECT_LIST") {
        	fn_getProjectInfo(1);
        } else if (gvCurScr === "LOCATION_LIST") {
        	fn_getLocations(1);
        } else if (gvCurScr === "TIME_LIST") {
        	fn_getTime(1);
        }
    } else if (id === "orSearch") {
    	$(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-OR' text='OR' /></h2>");
        if (gvCurScr === "VALIDATION_LIST") {
			fn_getTicketValidation(1);
        } else if (gvCurScr === "SOLD_TICKET_LIST") {
        	fn_getSoldTickets(1);
        } else if (gvCurScr === "PROJECT_LIST") {
        	fn_getProjectInfo(1);
        } else if (gvCurScr === "LOCATION_LIST") {
        	fn_getLocations(1);
        } else if (gvCurScr === "TIME_LIST") {
        	fn_getTime(1);
        }
    }
});

var strInputEventNm = "#keyword1, #keyword2, #keyword3";
$(document).on("input", strInputEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var val = $(this).val();
    
    if (id === "keyword1") {
    	if (val != null && val != "" && val != "undefined") {
    		if ($("#cbSearch1").val() != null && $("#cbSearch1").val() != "" && $("#cbSearch1").val() != "undefined" && $("#cbSearch1").val() != "00") {
    			if (gvCurScr === "VALIDATION_LIST") {
    				fn_getTicketValidation(1);
    	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
    	        	fn_getSoldTickets(1);
    	        } else if (gvCurScr === "PROJECT_LIST") {
    	        	fn_getProjectInfo(1);
    	        } else if (gvCurScr === "LOCATION_LIST") {
    	        	fn_getLocations(1);
    	        } else if (gvCurScr === "TIME_LIST") {
    	        	fn_getTime(1);
    	        }
    		}
    	} else {
    		if (gvCurScr === "VALIDATION_LIST") {
				fn_getTicketValidation(1);
	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
	        	fn_getSoldTickets(1);
	        } else if (gvCurScr === "PROJECT_LIST") {
	        	fn_getProjectInfo(1);
	        } else if (gvCurScr === "LOCATION_LIST") {
	        	fn_getLocations(1);
	        } else if (gvCurScr === "TIME_LIST") {
	        	fn_getTime(1);
	        }
    	}
    } else if (id === "keyword2") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch2").val() != null && $("#cbSearch2").val() != "" && $("#cbSearch2").val() != "undefined" && $("#cbSearch2").val() != "00") {
            	if (gvCurScr === "VALIDATION_LIST") {
    				fn_getTicketValidation(1);
    	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
    	        	fn_getSoldTickets(1);
    	        } else if (gvCurScr === "PROJECT_LIST") {
    	        	fn_getProjectInfo(1);
    	        } else if (gvCurScr === "LOCATION_LIST") {
    	        	fn_getLocations(1);
    	        } else if (gvCurScr === "TIME_LIST") {
    	        	fn_getTime(1);
    	        }
            }
        } else {
        	if (gvCurScr === "VALIDATION_LIST") {
				fn_getTicketValidation(1);
	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
	        	fn_getSoldTickets(1);
	        } else if (gvCurScr === "PROJECT_LIST") {
	        	fn_getProjectInfo(1);
	        } else if (gvCurScr === "LOCATION_LIST") {
	        	fn_getLocations(1);
	        } else if (gvCurScr === "TIME_LIST") {
	        	fn_getTime(1);
	        }
        }
    } else if (id === "keyword3") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch3").val() != null && $("#cbSearch3").val() != "" && $("#cbSearch3").val() != "undefined" && $("#cbSearch3").val() != "00") {
            	if (gvCurScr === "VALIDATION_LIST") {
    				fn_getTicketValidation(1);
    	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
    	        	fn_getSoldTickets(1);
    	        } else if (gvCurScr === "PROJECT_LIST") {
    	        	fn_getProjectInfo(1);
    	        } else if (gvCurScr === "LOCATION_LIST") {
    	        	fn_getLocations(1);
    	        } else if (gvCurScr === "TIME_LIST") {
    	        	fn_getTime(1);
    	        }
            }
        } else {
        	if (gvCurScr === "VALIDATION_LIST") {
				fn_getTicketValidation(1);
	        } else if (gvCurScr === "SOLD_TICKET_LIST") {
	        	fn_getSoldTickets(1);
	        } else if (gvCurScr === "PROJECT_LIST") {
	        	fn_getProjectInfo(1);
	        } else if (gvCurScr === "LOCATION_LIST") {
	        	fn_getLocations(1);
	        } else if (gvCurScr === "TIME_LIST") {
	        	fn_getTime(1);
	        }
        }
    }
});

function fn_makeEventInfo() {
	var param = "";
	
	gf_send("<c:url value='/apps/ticketValidation/makeEventInfo' />", param, "fn_makeEventInfoCallbak");
}

function fn_makeEventInfoCallbak(data) {
	if (data.result == 'OK') {
		gfn_layerPopup("Success");
	}
}
</script>
</body>
</html>