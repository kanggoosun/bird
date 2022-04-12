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
    <title>Applications - KoamTacON</title>
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
        <div class="inner">
            <!-- Header -->
            <%@ include file="../include/header.jsp" %>
            
            <section>
                <header class="main">
                    <h2>Inventory</h2>
                </header>
                
                <div id="divRequest" class="12u$ 12u$(small)"></div>
                
                <div id="divApproval" class="12u$ 12u$(small)" style="text-align:center;"></div>
                
                <div id="divBtn" class="12u$ 12u$(small)"></div>
                
                <div id="tblApplicationData" class="table-wrapper"></div>
                
                <div id="divIntroductionView" class="12u$ 12u$(small)"></div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvUserType = "";
var gvGroupCode = "";

$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.apps');
    
    gvUserType = "<c:out value='${__userType }' />";
    gvGroupCode = gfn_nullValue("<c:out value='${__groupCode }' />");
    
    fn_getApplicationMap();
});

function fn_getApplicationMap() {
	var param = "";
	param += "applicationSeq=0";
	param += "$applicationSeq=0";
	gf_send("<c:url value='/applications/getApplicationMap' />", param, "fn_getApplicationMapCallback");
}

function fn_getApplicationMapCallback(data) {
	fn_showView(data, gfn_nullValue(data.applicationMap.requestTarget), gfn_nullValue(data.applicationMap.approvalFlag));
}

function fn_showView(data, requestTarget, approvalFlag) {
	if (gvUserType === "0" || gvUserType === "1") {
        if (gvGroupCode === "") {
        	fn_makeDivRequest(data.applicationMap, data.screenShots);
            fn_makeDivApproval(data.applicationMap);
        } else {
        	fn_makeDivBtn("btnInventoryView");
        	fn_makeDivRequest(data.applicationMap, data.screenShots);
        	$("#divIntroductionView").hide();
            fn_getInventory(1);
        }
	}
}

/*
function fn_showView(data, requestTarget, approvalFlag) {
	if (requestTarget === "") {
		fn_makeDivRequest(data.applicationMap);
        fn_makeDivApproval(data.applicationMap);
	} else {
		if (approvalFlag === "2") {
			fn_makeDivBtn("btnInventoryView");
			fn_getInventory(1);
		} else {
			fn_makeDivRequest(data.applicationMap);
			fn_makeDivApproval(data.applicationMap);
		}
	}
}
*/
function fn_makeDivRequest(applicationMap, screenShots) {
    var divHtml = "";
    
    if (screenShots != null && screenShots.length > 0) {
	    divHtml += "<div class=\"box alt\">";
	    divHtml += "    <div class=\"row uniform\" style=\"text-align:center;\">";
	    for(var i=0; i<4; i++) {
	    	divHtml += "        <div class=\"2u 12u$(small)\">";
		    if(screenShots.length >= i+1) {
			    divHtml += "            <span class=\"image fit\">";
			    divHtml += "                <img src=\"/common/viewImage?fileClass=App&filename="+screenShots[i].filename+"\" style=\"max-width:250px;height:auto;\" />";
			    divHtml += "            </span>";
		    }
		    divHtml += "        </div>";
	    }
	    divHtml += "    </div>";
	    divHtml += "</div>";
    }
    divHtml += "    <div>"+applicationMap.applicationIntroduction+"</div>";
    
    $("#divIntroductionView").html("");
    $("#divIntroductionView").html(divHtml);
}

function fn_makeDivApproval(applicationMap) {
	var divHtml = "";
	
	if (gvUserType === "0") {
		//divHtml += "<div class=\"12u$ 12u$(small)\">";
        if (gvGroupCode === "") {
            divHtml += "<h2>Create your group first in <a href=\"<c:url value='/group/groupInfo' />\">[Group Management]</a> menu.</h2>";
        } else {
        	var flag = gfn_nullValue(applicationMap.approvalFlag);
        	if (flag === "3") {
                //divHtml += "<p>관리자가 다음과 같은 사유로 사용 요청을 거부하였습니다.<br/>";
                divHtml += applicationMap.comment;
                divHtml += "</p>";
            } else if (flag === "0" || flag === "1") {
                //divHtml += "<p>현재 관리자가 승인 처리 작업 진행 중입니다. 관련 자료 연동 작업에 시간이 걸리오니 양해 바랍니다.</p>";
            } else {
	            divHtml += "<p>You have not applied for use for this application. Please click the button below to apply.</p>";
	            divHtml += "<ul class=\"actions vertical\">";
	            divHtml += "    <li><input type=\"button\" name=\"btnApply\" id=\"btnApply\" value=\"Apply\" class=\"button special\" /></li>";
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

	divHtml += "<ul class=\"actions\">";
	//divHtml += "    <li><input type=\"button\" name=\"btnIntroductionView\" id=\"btnIntroductionView\" value=\"INTRODUCTION\" class=\"button\" /></li>";
	if (gvGroupCode != null && gvGroupCode != "" && gvGroupCode != "undefined") {
		divHtml += "    <li><input type=\"button\" name=\"btnInventoryView\" id=\"btnInventoryView\" value=\"LIST\" class=\"button\" /></li>";
		divHtml += "    <li><input type=\"button\" name=\"btnHisInventoryView\" id=\"btnHisInventoryView\" value=\"HISTORY\" class=\"button\" /></li>";
		//divHtml += "    <li><input type=\"button\" name=\"btnStockInView\" id=\"btnStockInView\" value=\"Stock In\" class=\"button\" /></li>";
		//divHtml += "    <li><input type=\"button\" name=\"btnStockOutView\" id=\"btnStockOutView\" value=\"Stock Out\" class=\"button\" /></li>";
		//divHtml += "    <li><input type=\"button\" name=\"btnStockCheckView\" id=\"btnStockCheckView\" value=\"Stock Check\" class=\"button\" /></li>";
    }
	divHtml += "</ul>";
	
	$("#divBtn").html("");
    $("#divBtn").html(divHtml);
    
    if (!$("#"+divBtnId).hasClass("special")) {
        $("#"+divBtnId).toggleClass("special");
    }
}

function fn_makeTblApplicationDataWithInventory(applicationDataList, paginationHtml, applicationDef) {
	var tblHtml = "";
	var pageHtml = "";
	var buttonHtml = "";
	
	tblHtml += "<table class=\"alt\">";
	tblHtml += "    <thead>";
	tblHtml += "        <tr>";
	tblHtml += "            <th style=\"text-align:center;\">Item Key</th>";
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
	tblHtml += "        </tr>";
	tblHtml += "    </thead>";
	tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
	if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
        	tblHtml += "<tr>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].reckey)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val01)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val02)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val03)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val04)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val05)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val06)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val07)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val08)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val09)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val10)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val11)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val12)+"</td>";
        	tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportInventory\" id=\"btnExcelExportInventory\" value=\"Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportInventory\" id=\"btnExcelImportInventory\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
	} else {
		tblHtml += "<tr><td colspan=\"13\" style=\"text-align:center;\">There is no data.</td></tr>";
	}
	tblHtml += "    </tbody>";
	tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
	tblHtml += "        <tr><td colspan=\"13\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
	tblHtml += "        <tr><td colspan=\"13\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
	tblHtml += "    </tfoot>";
	tblHtml += "</table>";
	
	$("#tblApplicationData").html("");
	$("#tblApplicationData").html(tblHtml);
	
	$("#tblApplicationData tfoot #tdPagination").html(pageHtml);
	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
}

function fn_makeTblApplicationDataWithHisInventory(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\">History Seq</th>";
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
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportHisInventory\" id=\"btnExcelExportHisInventory\" value=\"Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportHisInventory\" id=\"btnExcelImportHisInventory\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"20\" style=\"text-align:center;\">There is no data.</td></tr>";
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
    $("#tblApplicationData tfoot #tdButton").html(buttonHtml);
}

function fn_makeTblApplicationDataWithStockIn(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\">Barcode</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
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
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportStockIn\" id=\"btnExcelExportStockIn\" value=\"Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportStockIn\" id=\"btnExcelImportStockIn\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"9\" style=\"text-align:center;\">There is no data.</td></tr>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"9\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"9\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    $("#tblApplicationData tfoot #tdButton").html(buttonHtml);
}

function fn_makeTblApplicationDataWithStockOut(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\">Barcode</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
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
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportStockOut\" id=\"btnExcelExportStockOut\" value=\"Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportStockOut\" id=\"btnExcelImportStockOut\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"9\" style=\"text-align:center;\">There is no data.</td></tr>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"9\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"9\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    $("#tblApplicationData tfoot #tdButton").html(buttonHtml);
}

function fn_makeTblApplicationDataWithStockCheck(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\">Barcode</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
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
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportStockCheck\" id=\"btnExcelExportStockCheck\" value=\"Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportStockCheck\" id=\"btnExcelImportStockCheck\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"9\" style=\"text-align:center;\">There is no data.</td></tr>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"9\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"9\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    $("#tblApplicationData tfoot #tdButton").html(buttonHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnApply, #btnIntroductionView";
strClickEventNm += ", #btnInventoryView, #btnExcelExportInventory";
strClickEventNm += ", #btnHisInventoryView, #btnExcelExportHisInventory";
strClickEventNm += ", #btnStockInView, #btnExcelExportStockIn";
strClickEventNm += ", #btnStockOutView, #btnExcelExportStockOut";
strClickEventNm += ", #btnStockCheckView, #btnExcelExportStockCheck";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
	if (id === "btnApply") {
		fn_apply();
	} else if (id === "btnIntroductionView") {
		fn_getApplicationMap();
        $("#tblApplicationData").html("");
        $("#divIntroductionView").show();
        $("#btnIntroductionView").toggleClass("special");
        if ($("#btnInventoryView").hasClass("special")) {
            $("#btnInventoryView").toggleClass("special");
        }
        if ($("#btnHisInventoryView").hasClass("special")) {
            $("#btnHisInventoryView").toggleClass("special");
        }
        if ($("#btnStockInView").hasClass("special")) {
            $("#btnStockInView").toggleClass("special");
        }
        if ($("#btnStockOutView").hasClass("special")) {
            $("#btnStockOutView").toggleClass("special");
        }
        if ($("#btnStockCheckView").hasClass("special")) {
            $("#btnStockCheckView").toggleClass("special");
        }
    } else
	
	if (id === "btnInventoryView") {
		//$("#divIntroductionView").hide();
		fn_makeDivBtn("btnInventoryView");
        fn_getInventory(1);
    } else if (id === "btnExcelExportInventory") {
		fn_excelExport("inventory");
	} else 
		
	if (id === "btnHisInventoryView") {
		//$("#divIntroductionView").hide();
		fn_makeDivBtn("btnHisInventoryView");
        fn_getHisInventory(1);
	} else if (id === "btnExcelExportHisInventory") {
        fn_excelExport("history-of-inventory");
    } 
	/*
	else if (id === "btnStockInView") {
		//$("#divIntroductionView").hide();
        fn_makeDivBtn("btnStockInView");
        fn_getStockIn(1);
    } else if (id === "btnExcelExportStockIn") {
        fn_excelExport("stock-in");
    } else
    	
   	if (id === "btnStockOutView") {
   		//$("#divIntroductionView").hide();
        fn_makeDivBtn("btnStockOutView");
        fn_getStockOut(1);
    } else if (id === "btnExcelExportStockOut") {
        fn_excelExport("stock-out");
    } else
    	
    if (id === "btnStockCheckView") {
    	$("#divIntroductionView").hide();
        fn_makeDivBtn("btnStockCheckView");
        fn_getStockCheck(1);
    } else if (id === "btnExcelExportStockCheck") {
        fn_excelExport("stock-check");
    }
	*/
}

function fn_apply() {
	var param = "";
    param += "applicationSeq=0";
    gf_send("<c:url value='/applications/requestForApproval' />", param, "fn_applyCallback");
}

function fn_applyCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getApplicationMap();
	}
}

function fn_getInventory(pageNo) {
	var param = "";
	param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getInventory";
    
	gf_send("<c:url value='/apps/inventory/getInventory' />", param, "fn_getInventoryCallback");
}

function fn_getInventoryCallback(data) {
	var list = data.inventoryList;
	var def = data.inventoryDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithInventory(list, paginationHtml, def);
}

function fn_getHisInventory(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getHisInventory";
    
    gf_send("<c:url value='/apps/inventory/getHisInventory' />", param, "fn_getHisInventoryCallback");
}

function fn_getHisInventoryCallback(data) {
	var list = data.hisInventoryList;
    var def = data.hisInventoryDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithHisInventory(list, paginationHtml, def);
}

function fn_getStockIn(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getStockIn";
    
    gf_send("<c:url value='/apps/inventory/getStockIn' />", param, "fn_getStockInCallback");
}

function fn_getStockInCallback(data) {
	var list = data.stockInList;
    var def = data.stockInDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithStockIn(list, paginationHtml, def);
}

function fn_getStockCheck(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getStockCheck";
    
    gf_send("<c:url value='/apps/inventory/getStockCheck' />", param, "fn_getStockCheckCallback");
}

function fn_getStockCheckCallback(data) {
	var list = data.stockCheckList;
    var def = data.stockCheckDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithStockCheck(list, paginationHtml, def);
}

function fn_getStockOut(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getStockOut";
    
    gf_send("<c:url value='/apps/inventory/getStockOut' />", param, "fn_getStockOutCallback");
}

function fn_getStockOutCallback(data) {
	var list = data.stockOutList;
    var def = data.stockOutDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithStockOut(list, paginationHtml, def);
}

function fn_excelExport(filename) {
    var param = "";
    param += "filename="+filename;
    param += "&";
    param += "groupCode="+gvGroupCode;
    
    document.location.href = "/common/excelExport?"+param;
}
</script>
</body>
</html>