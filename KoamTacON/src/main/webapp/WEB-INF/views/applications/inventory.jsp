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
                    <h2><spring:message code='MENU-INVENTORY' text='Inventory' /></h2>
                </header>
                
                <div id="divRequest" class="12u$ 12u$(small)"></div>
                
                <div id="divApproval" class="12u$ 12u$(small)" style="text-align:center;"></div>
                
                <div id="divBtn"></div>
                
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

<!-- Product image upload popup layer -->
<div id="dim-layer-PImgUp" class="dim-layer">
    <div id="dimBgPImgUp" class="dimBg"></div>
    <div id="PImgUp_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="PImgUpDiv" >
                    <form id="frmPImgUp" method="post" enctype="multipart/form-data">
                        <div class="row uniform">
                            <div class="12u 12u$">
                            	<input type="hidden" name="uploadItemKey" id="uploadItemKey" value="" required="required" />
                            	<div class="12u 12u$">
                                <spring:message code='WRD-MAPFILE' text='Mapping File' />:<br>
                                </div>
                                <div class="12u 12u$">
                                	<input type="file" name="excelMap" id="excelMap" value="" required="required" placeholder="<spring:message code='WRD-MAP' text='Map' />" maxlength="200" />
                                </div>
                            	<div class="12u 12u$">
                            	<spring:message code='WRD-IMGTOUPLOAD' text='Images To Upload' />:<br>
                            	</div>
                            	<div class="12u 12u$">
                                	<input type="file" name="productImages" id="productImages" value="" required="required" placeholder="<spring:message code='WRD-PRDUCTIMG' text='Product Image' />" maxlength="200" multiple />
                                </div>
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnPImgUpload" id="btnPImgUpload" value="<spring:message code='WRD-UPLOAD' text='Upload' />" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closePImgUpPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Product image popup layer -->
<div id="dim-layer-PImage" class="dim-layer">
    <div id="dimBgPImage" class="dimBg"></div>
    <div id="PImage_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="PImageDiv" >
                    <form id="frmPImage" method="post">
                        <div class="row uniform">
                            <div id="divProductImage" class="12u 12u$"></div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closePImagePopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mloader"><div class="masterkey_blink"><spring:message code='WRD-INPRGRS' text='In progress' /> ...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvUserType = "";
var gvGroupCode = "";
var gvCurScr = "";

$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.apps');
    
    gvUserType = "<c:out value='${__userType }' />";
    gvGroupCode = gfn_nullValue("<c:out value='${__groupCode }' />");
    
    fn_getApplicationMap();
    fn_getSearchOptions("MA_INVENTORY");
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
		
		//$("#cbSearch2").attr("disabled", true);
		//$("#keyword2").attr("readonly", true);
		//$("#cbSearch3").attr("disabled", true);
		//$("#keyword3").attr("readonly", true);
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
	param += "applicationSeq=0";
	
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
        	fn_makeDivBtn("btnInventoryView");
        	gvCurScr = "LIST";
            fn_getInventory(1);
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
            	/*
	            divHtml += "<p>You have not applied for use for this application. Please click the button below to apply.</p>";
	            divHtml += "<ul class=\"actions vertical\">";
	            divHtml += "    <li><input type=\"button\" name=\"btnApply\" id=\"btnApply\" value=\"Apply\" class=\"button special\" /></li>";
	            divHtml += "</ul>";
	            */
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
		divHtml += "    <li><input type=\"button\" name=\"btnInventoryView\" id=\"btnInventoryView\" value=\"<spring:message code='WRD-LIST' text='LIST' />\" class=\"button\" /></li>";
		divHtml += "    <li><input type=\"button\" name=\"btnHisInventoryView\" id=\"btnHisInventoryView\" value=\"<spring:message code='WRD-HISTORY' text='HISTORY' />\" class=\"button\" /></li>";
		divHtml += "</ul>";
		
		$("#divBtn").html(divHtml);
	    
	    if (!$("#"+divBtnId).hasClass("special")) {
	        $("#"+divBtnId).toggleClass("special");
	    }
    }
}

function fn_makeTblApplicationDataWithInventory(applicationDataList, paginationHtml, applicationDef) {
	var tblHtml = "";
	var pageHtml = "";
	var buttonHtml = "";
	
	tblHtml += "<table class=\"alt\">";
	tblHtml += "    <thead>";
	tblHtml += "        <tr>";
	tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-ITEMKEY' text='Item Key' /></th>";
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
    //tblHtml += "            <th style=\"text-align:center;\">Product Image</th>";
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
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val13)+"</td>";
        	tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].val14)+"</td>";
        	/*
        	tblHtml += "    <td id=\"tdPImg-"+i+"\">";
        	if (gfn_nullValue(applicationDataList[i].detlImg01) != null && gfn_nullValue(applicationDataList[i].detlImg01) != "" && gfn_nullValue(applicationDataList[i].detlImg01) != "undefined") {
        		tblHtml += "    <div id=\"divPImg-"+i+"\">";
        		tblHtml += gfn_nullValue(applicationDataList[i].detlImg01);
        		tblHtml += "        <img src=\"/resources/images/icon/icon_document.png\" alt=\"\" style=\"max-height:20px;width:auto;\" />";
        		tblHtml += "        <input type=\"hidden\" id=\"productImage-"+i+"\" value=\""+gfn_nullValue(applicationDataList[i].detlImg01)+"\" />";
        		tblHtml += "    </div>";
    		} else {
    			tblHtml += "    <div id=\"divBtnUploadPImg-"+i+"\">";
    			tblHtml += "		<ul class=\"actions\">";
    			tblHtml += "    		<li><input type=\"button\" name=\"btnUploadImage\" id=\"btnUploadImage\" value=\"Image Upload\" class=\"button special fit\" /></li>";
    	        tblHtml += "		</ul>";
    	        tblHtml += "    </div>";
    	        tblHtml += "    <input type=\"hidden\" id=\"itemKey-"+i+"\" value=\""+gfn_nullValue(applicationDataList[i].reckey)+"\" />";
    		}
        	tblHtml += "    </td>";
        	*/
        	tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadInventoryTemplate\" id=\"btnDowonloadInventoryTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnImportInventory\" id=\"btnImportInventory\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportInventory\" id=\"btnExcelExportInventory\" value=\"<spring:message code='' text='' />Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportInventory\" id=\"btnExcelImportInventory\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
	} else {
		tblHtml += "<tr><td colspan=\"16\" style=\"text-align:center;\">There is no data.</td></tr>";
		buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadInventoryTemplate\" id=\"btnDowonloadInventoryTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnImportInventory\" id=\"btnImportInventory\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportInventory\" id=\"btnExcelExportInventory\" value=\"Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportInventory\" id=\"btnExcelImportInventory\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
	}
	tblHtml += "    </tbody>";
	tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
	tblHtml += "        <tr><td colspan=\"16\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
	tblHtml += "        <tr><td colspan=\"16\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
	tblHtml += "    </tfoot>";
	tblHtml += "</table>";
	
	$("#tblApplicationData").html("");
	$("#tblApplicationData").html(tblHtml);
	
	$("#tblApplicationData tfoot #tdPagination").html(pageHtml);
	if (gvUserType != '3') {
		$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
	}
}

function fn_makeTblApplicationDataWithHisInventory(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-HISSEQ' text='History Seq' /></th>";
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
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval20+"</th>";
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
            tblHtml += "    <td>"+applicationDataList[i].val20+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportHisInventory\" id=\"btnExcelExportHisInventory\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportHisInventory\" id=\"btnExcelImportHisInventory\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"21\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"21\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"21\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}

var strClickEventNm  = "";
strClickEventNm += "#btnApply";
strClickEventNm += ", #btnInventoryView, #btnExcelExportInventory";
strClickEventNm += ", #btnHisInventoryView, #btnExcelExportHisInventory";
strClickEventNm += ", #btnDowonloadInventoryTemplate, #btnImportInventory, #btnExcelImport";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
	if (id === "btnApply") {
		fn_apply();
	} else if (id === "btnInventoryView") {
		fn_makeDivBtn("btnInventoryView");
		fn_getSearchOptions("MA_INVENTORY");
		gvCurScr = "LIST";
        fn_getInventory(1);
    } else if (id === "btnExcelExportInventory") {
		fn_excelExport("inventory");
	} else if (id === "btnHisInventoryView") {
		fn_makeDivBtn("btnHisInventoryView");
		fn_getSearchOptions("HIS_INVENTORY_JOB");
		gvCurScr = "HISTORY";
        fn_getHisInventory(1);
	} else if (id === "btnExcelExportHisInventory") {
        fn_excelExport("history-of-inventory");
    } else if (id === "btnDowonloadInventoryTemplate") {
    	fn_templateDownload();
    } else if (id === "btnImportInventory") {
    	fn_excelPopup();
    } else if (id === "btnExcelImport") {
    	fn_excelImport();
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
    			//$("#cbSearch2").removeAttr("disabled");
    	        //$("#keyword2").removeAttr("readonly");
    	        if (gvCurScr === "LIST") {
    	        	fn_getInventory(1);
    	        } else {
    	        	fn_getHisInventory(1);
    	        }
    		}
    	} else {
    		//$("#cbSearch2").attr("disabled", "disabled");
            //$("#keyword2").attr("readonly", "readonly");
            //$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
    	}
    } else if (id === "cbSearch2") {
    	if (val != null && val != "" && val != "undefined" && val != "00") {
            if ($("#keyword2").val() != null && $("#keyword2").val() != "" && $("#keyword2").val() != "undefined") {
                //$("#cbSearch3").removeAttr("disabled");
                //$("#keyword3").removeAttr("readonly");
                if (gvCurScr === "LIST") {
                    fn_getInventory(1);
                } else {
                    fn_getHisInventory(1);
                }
            }
        } else {
            //$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
        }
    } else if (id === "cbSearch3") {
    	if (val != null && val != "" && val != "undefined" && val != "00") {
            if ($("#keyword3").val() != null && $("#keyword3").val() != "" && $("#keyword3").val() != "undefined") {
            	if (gvCurScr === "LIST") {
                    fn_getInventory(1);
                } else {
                    fn_getHisInventory(1);
                }
            }
        }
    }
    
    if (id === "andSearch") {
    	$(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-AND' text='AND' /></h2>");
        if (gvCurScr === "LIST") {
            fn_getInventory(1);
        } else {
            fn_getHisInventory(1);
        }
    } else if (id === "orSearch") {
    	$(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-OR' text='OR' /></h2>");
        if (gvCurScr === "LIST") {
            fn_getInventory(1);
        } else {
            fn_getHisInventory(1);
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
    			//$("#cbSearch2").removeAttr("disabled");
                //$("#keyword2").removeAttr("readonly");
    			if (gvCurScr === "LIST") {
                    fn_getInventory(1);
                } else {
                    fn_getHisInventory(1);
                }
    		} else {
    			//$("#cbSearch2").attr("disabled", "disabled");
                //$("#keyword2").attr("readonly", "readonly");
                //$("#cbSearch3").attr("disabled", "disabled");
                //$("#keyword3").attr("readonly", "readonly");
    		}
    	} else {
    		//$("#cbSearch2").attr("disabled", "disabled");
            //$("#keyword2").attr("readonly", "readonly");
            //$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
    		if (gvCurScr === "LIST") {
                    fn_getInventory(1);
                } else {
                    fn_getHisInventory(1);
                }
    	}
    } else if (id === "keyword2") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch2").val() != null && $("#cbSearch2").val() != "" && $("#cbSearch2").val() != "undefined" && $("#cbSearch2").val() != "00") {
            	//$("#cbSearch3").removeAttr("disabled");
                //$("#keyword3").removeAttr("readonly");
            	if (gvCurScr === "LIST") {
                    fn_getInventory(1);
                } else {
                    fn_getHisInventory(1);
                }
            } else {
            	//$("#cbSearch3").attr("disabled", "disabled");
                //$("#keyword3").attr("readonly", "readonly");
            }
        } else {
        	//$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
        	if (gvCurScr === "LIST") {
                    fn_getInventory(1);
                } else {
                    fn_getHisInventory(1);
                }
        }
    } else if (id === "keyword3") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch3").val() != null && $("#cbSearch3").val() != "" && $("#cbSearch3").val() != "undefined" && $("#cbSearch3").val() != "00") {
            	if (gvCurScr === "LIST") {
                    fn_getInventory(1);
                } else {
                    fn_getHisInventory(1);
                }
            }
        } else {
        	if (gvCurScr === "LIST") {
                fn_getInventory(1);
            } else {
                fn_getHisInventory(1);
            }
        }
    }
});

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
    param += fn_makeSearchParam();
    
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
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/inventory/getHisInventory' />", param, "fn_getHisInventoryCallback");
}

function fn_getHisInventoryCallback(data) {
	var list = data.hisInventoryList;
    var def = data.hisInventoryDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithHisInventory(list, paginationHtml, def);
}

function fn_excelExport(filename) {
    var param = "";
    param += "filename="+filename;
    param += "&";
    param += "groupCode="+gvGroupCode;
    param += fn_makeSearchParam();
    
    document.location.href = "/common/excelExport?"+param;
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

function fn_templateDownload() {
    var param = "";
    param += "flag="+"template";
    param += "&";
    param += "filename="+"Template_Inventory.xlsx";
    
    gf_genFileDownLoad(param);
}

function fn_excelPopup() {
    $("#excelFile").val("");

    gfn_customLayerPopup('dim-layer-excel', 'dimBgExcel', 'excel_layer', 'closeExcelPopup');
}

function fn_excelImport() {
    var frmId = "frmExcel";

    if (gfn_checkRequired(frmId) === true) {
        $('#dim-layer-excel').fadeOut();
        $("#mloader").css("display", "block");
        //gf_sendSync("<c:url value='/test/longResponseTest' />", param, "fn_excelImportCallback");
        gf_sendFileForm(frmId, "<c:url value='/WSApi/importInventory' />", "fn_excelImportCallback");
    }
}

function fn_excelImportCallback(data) {
	$("#mloader").css("display", "none");
    gfn_layerPopup(data.msg);
    if (data.result === "success") {
    	fn_getInventory(1);
    }
}

$(document).on("click", "#tblApplicationData tbody td div", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sid = id.split("-")[0];
    var no = id.split("-")[1];

    if (sid === 'divPImg') {
    	fn_popImage($("#productImage-"+no).val());
    } else if (sid === 'divBtnUploadPImg') {
    	fn_productImageUploadPopup($("#itemKey-"+no).val());
    }
});

function fn_popImage(imgString) {
	if (imgString != null && imgString != "" && imgString != "undefined") {
    	//var imgSrc = "http://54.173.68.163/server_marketingtest/resources/DETAIL/"+imgString;
    	var imgSrc = "<c:out value='${ detailImage }' />"+imgString;
    	var imgHtml = "<img src='"+imgSrc+"' style='max-height:350px;width:auto;' />";
    	
    	$("#divProductImage").html("");
        $("#divProductImage").html(imgHtml);
    	gfn_customLayerPopup('dim-layer-PImage', 'dimBgPImage', 'PImage_layer', 'closePImagePopup');
	}
}

function fn_productImageUploadPopup(itemKey) {
    $("#productImages").val("");
    $("#excelMap").val("");
    $("#uploadItemKey").val(itemKey);
    
    gfn_customLayerPopup('dim-layer-PImgUp', 'dimBgPImgUp', 'PImgUp_layer', 'closePImgUpPopup');
}
</script>
</body>
</html>