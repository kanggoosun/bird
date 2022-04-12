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
                    <h2><spring:message code='MENU-FIELDSERVICE' text='Field service' /></h2>
                </header>
                
                <div id="divRequest" class="12u$ 12u$(small)"></div>
                
                <div id="divApproval" class="12u$ 12u$(small)" style="text-align:center;"></div>
                
                <div id="divBtn" class="12u$ 12u$(small)"></div>
                
                <div id="divSearch" class="row">
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch1" name="cbSearch1">
                            <option value="00"><spring:message code='WRD-SELECT' text='select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword1" name="keyword1" value="" placeholder="<spring:message code='' text='Enter Keyword' />">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch2" name="cbSearch2">
                            <option value="00"><spring:message code='WRD-SELECT' text='select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword2" name="keyword2" value="WRD-ENTKW" placeholder="<spring:message code='' text='Enter Keyword' />">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch3" name="cbSearch3">
                            <option value="00"><spring:message code='WRD-SELECT' text='select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword3" name="keyword3" value="" placeholder="<spring:message code='' text='Enter Keyword' />">
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
                                <input type="file" name="excelFile" id="excelFile" value="" required="required" placeholder="<spring:message code='WRD-ENTEXL' text='Enter excel' />" maxlength="200" />
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
    fn_getSearchOptions("MA_FIELD_SERVICE");
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
            fn_makeDivBtn("btnFieldServiceView");
            gvCurScr = "SERVICE_LIST";
            fn_getFieldService(1);
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
        divHtml += "    <li><input type=\"button\" name=\"btnFieldServiceView\" id=\"btnFieldServiceView\" value=\"<spring:message code='WRD-FIELDSVCLIST' text='Field Service LIST' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnProductView\" id=\"btnProductView\" value=\"<spring:message code='WRD-PRODUCTS' text='Products' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnCustomerView\" id=\"btnCustomerView\" value=\"<spring:message code='WRD-CUSTOMERS' text='Customers' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnAddressView\" id=\"btnAddressView\" value=\"<spring:message code='WRD-ADDRS' text='Addresses' />\" class=\"button\" /></li>";
        divHtml += "</ul>";
        
        $("#divBtn").html(divHtml);
        
        if (!$("#"+divBtnId).hasClass("special")) {
            $("#"+divBtnId).toggleClass("special");
        }
    }
}

function fn_getFieldService(pageNo) {
	gvPageNo = pageNo;
	
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getFieldService";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/fieldService/getFieldService' />", param, "fn_getFieldServiceCallback");
}

function fn_getFieldServiceCallback(data) {
    var list = data.fieldServiceList;
    var def = data.fieldServiceDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithFieldService(list, paginationHtml, def);
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

function fn_makeTblApplicationDataWithFieldService(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-SVCSEQ' text='Service Seq' /></th>";
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
            tblHtml += "    <td>"+applicationDataList[i].val10+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val11+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val12+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val13+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val14+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val15+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val16+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val17+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val18+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val19+"</td>";
            //tblHtml += "    <td>"+applicationDataList[i].val20+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadFieldServiceTemplate\" id=\"btnDowonloadFieldServiceTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnFieldServiceImport\" id=\"btnFieldServiceImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportFieldService\" id=\"btnExcelExportFieldService\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"20\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadFieldServiceTemplate\" id=\"btnDowonloadFieldServiceTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnFieldServiceImport\" id=\"btnFieldServiceImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
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

var strClickEventNm  = "";
strClickEventNm += "#btnFieldServiceView, #btnDowonloadFieldServiceTemplate, #btnFieldServiceImport, #btnExcelExportFieldService";
strClickEventNm += ", #btnProductView, #btnDowonloadProductTemplate, #btnProductImport, #btnExcelExportProduct";
strClickEventNm += ", #btnCustomerView, #btnDowonloadCustomerTemplate, #btnCustomerImport, #btnExcelExportCustomer";
strClickEventNm += ", #btnAddressView, #btnDowonloadAddressTemplate, #btnAddressImport, #btnExcelExportAddress";
strClickEventNm += ", #btnExcelImport";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
    if (id === "btnFieldServiceView") {
    	fn_makeDivBtn("btnFieldServiceView");
        fn_getSearchOptions("MA_FIELD_SERVICE");
        gvCurScr = "SERVICE_LIST";
        fn_getFieldService(1);
    } else if (id === "btnExcelExportFieldService") {
    	fn_excelExport("field-service");
    } else if (id === "btnDowonloadFieldServiceTemplate") {
    	fn_templateDownload('1');
    } else if (id === "btnFieldServiceImport") {
    	fn_excelPopup('1');
    } else if (id === "btnProductView") {
    	fn_makeDivBtn("btnProductView");
        fn_getSearchOptions("MA_PRODUCT");
        gvCurScr = "PRODUCT_LIST";
        fn_getProduct(1);
    } else if (id === "btnExcelExportProduct") {
    	fn_excelExport("product");
    } else if (id === "btnDowonloadProductTemplate") {
    	fn_templateDownload('2');
    } else if (id === "btnProductImport") {
    	fn_excelPopup('2');
    } else if (id === "btnCustomerView") {
    	fn_makeDivBtn("btnCustomerView");
        fn_getSearchOptions("MA_CUSTOMERS");
        gvCurScr = "CUSTOMER_LIST";
        fn_getCustomer(1);
    } else if (id === "btnExcelExportCustomer") {
    	fn_excelExport("customer");
    } else if (id === "btnDowonloadCustomerTemplate") {
    	fn_templateDownload('3');
    } else if (id === "btnCustomerImport") {
    	fn_excelPopup('3');
    } else if (id === "btnAddressView") {
    	fn_makeDivBtn("btnAddressView");
        fn_getSearchOptions("MA_FS_ADDRESS");
        gvCurScr = "ADDRESS_LIST";
        fn_getAddress(1);
    } else if (id === "btnExcelExportAddress") {
    	fn_excelExport("address");
    } else if (id === "btnDowonloadAddressTemplate") {
    	fn_templateDownload('4');
    } else if (id === "btnAddressImport") {
    	fn_excelPopup('4');
    } else if (id === "btnExcelImport") {
    	fn_excelImport();
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

function fn_templateDownload(template) {
	var filename = '';
	
	if (template =='1') {
		filename = 'Template_FieldService.xlsx';
	} else if (template =='2') {
		filename = 'Template_Product.xlsx';
	} else if (template =='3') {
		filename = 'Template_Customer.xlsx';
	} else if (template =='4') {
		filename = 'Template_FS_Address.xlsx';
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
	
	if (target =='1') {
    	importTarget = 'fieldService';
	} else if (target =='2') {
		importTarget = 'product';
    } else if (target =='3') {
    	importTarget = 'customer';
    } else if (target =='4') {
    	importTarget = 'address';
    } else {
    	importTarget = '';
    	gfn_layerPopup("<spring:message code='MSG-VW077' text='Please select the import target.' />");
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
    
    if (importTarget =='fieldService') {
    	targetUrl = "<c:url value='/WSApi/importFieldService' />";
    } else if (importTarget =='product') {
    	targetUrl = "<c:url value='/WSApi/importProduct' />";
    } else if (importTarget =='customer') {
    	targetUrl = "<c:url value='/WSApi/importCustomer' />";
    } else if (importTarget =='address') {
    	targetUrl = "<c:url value='/WSApi/importFSAddress' />";
    } else {
    	targetUrl = '';
        gfn_layerPopup("Please select the import target.");
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
	   	if (importTarget == 'fieldService') {
	   		fn_getFieldService(1);
	   	} else if (importTarget == 'product') {
	       	fn_getProduct(1);
	    } else if (importTarget == 'customer') {
	       	fn_getCustomer(1);
	    } else if (importTarget == 'address') {
	       	fn_getAddress(1);
	    }
    }
}

function fn_getProduct(pageNo) {
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getProduct";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/fieldService/getProduct' />", param, "fn_getProductCallback");
}

function fn_getProductCallback(data) {
    var list = data.productList;
    var def = data.productDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithProduct(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithProduct(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-PRDSEQ' text='Product seq' /></th>";
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
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadProductTemplate\" id=\"btnDowonloadProductTemplate\" value=\"<spring:message code='WRD-DOWNTEMP' text='Download Template' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnProductImport\" id=\"btnProductImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportProduct\" id=\"btnExcelExportProduct\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"20\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadProductTemplate\" id=\"btnDowonloadProductTemplate\" value=\"<spring:message code='WRD-DOWNTEMP' text='Download Template' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnProductImport\" id=\"btnProductImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
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

function fn_getCustomer(pageNo) {
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getCustomer";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/rental/getCustomer' />", param, "fn_getCustomerCallback");
}

function fn_getCustomerCallback(data) {
    var list = data.customerList;
    var def = data.customerDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithCustomer(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithCustomer(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-SVCSEQ' text='Service Seq' /></th>";
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
            tblHtml += "    <td>"+applicationDataList[i].val10+"</td>";
            tblHtml += "    <td>"+applicationDataList[i].val11+"</td>";
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
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCustomerTemplate\" id=\"btnDowonloadCustomerTemplate\" value=\"<spring:message code='WRD-DOWNTEMP' text='Download Template' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnCustomerImport\" id=\"btnCustomerImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportCustomer\" id=\"btnExcelExportCustomer\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"12\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCustomerTemplate\" id=\"btnDowonloadCustomerTemplate\" value=\"<spring:message code='WRD-DOWNTEMP' text='Download Template' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnCustomerImport\" id=\"btnCustomerImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"12\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"12\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}

function fn_getAddress(pageNo) {
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getAddress";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/fieldService/getAddress' />", param, "fn_getAddressCallback");
}

function fn_getAddressCallback(data) {
    var list = data.addressList;
    var def = data.addressDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithAddress(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithAddress(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-SVCSEQ' text='Service Seq' /></th>";
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
            tblHtml += "    <td>"+applicationDataList[i].val10+"</td>";
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
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadAddressTemplate\" id=\"btnDowonloadAddressTemplate\" value=\"<spring:message code='WRD-DOWNTEMP' text='Download Template' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnAddressImport\" id=\"btnAddressImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportAddress\" id=\"btnExcelExportAddress\" value=\"<spring:message code='' text='' />Export\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"11\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadAddressTemplate\" id=\"btnDowonloadAddressTemplate\" value=\"<spring:message code='WRD-DOWNTEMP' text='Download Template' />\" class=\"button special\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnAddressImport\" id=\"btnAddressImport\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special\" /></li>";
        buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"11\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"11\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
    tblHtml += "    </tfoot>";
    tblHtml += "</table>";
    
    $("#tblApplicationData").html("");
    $("#tblApplicationData").html(tblHtml);
    
    $("#tblApplicationData tfoot #tdPagination").html(pageHtml);
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
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
    	        if (gvCurScr === "SERVICE_LIST") {
    	        	fn_getFieldService(1);
    	        } else if (gvCurScr === "PRODUCT_LIST") {
    	        	fn_getProduct(1);
    	        } else if (gvCurScr === "CUSTOMER_LIST") {
    	        	fn_getCustomer(1);
    	        } else if (gvCurScr === "ADDRESS_LIST") {
    	        	fn_getAddress(1);
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
                if (gvCurScr === "SERVICE_LIST") {
    	        	fn_getFieldService(1);
    	        } else if (gvCurScr === "PRODUCT_LIST") {
    	        	fn_getProduct(1);
    	        } else if (gvCurScr === "CUSTOMER_LIST") {
    	        	fn_getCustomer(1);
    	        } else if (gvCurScr === "ADDRESS_LIST") {
    	        	fn_getAddress(1);
    	        }
            }
        } else {
            //$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
        }
    } else if (id === "cbSearch3") {
    	if (val != null && val != "" && val != "undefined" && val != "00") {
            if ($("#keyword3").val() != null && $("#keyword3").val() != "" && $("#keyword3").val() != "undefined") {
            	if (gvCurScr === "SERVICE_LIST") {
    	        	fn_getFieldService(1);
    	        } else if (gvCurScr === "PRODUCT_LIST") {
    	        	fn_getProduct(1);
    	        } else if (gvCurScr === "CUSTOMER_LIST") {
    	        	fn_getCustomer(1);
    	        } else if (gvCurScr === "ADDRESS_LIST") {
    	        	fn_getAddress(1);
    	        }
            }
        }
    }
    
    if (id === "andSearch") {
    	$(".clsConcat").html("");
        $(".clsConcat").html("<h2>AND</h2>");
        if (gvCurScr === "SERVICE_LIST") {
        	fn_getFieldService(1);
        } else if (gvCurScr === "PRODUCT_LIST") {
        	fn_getProduct(1);
        } else if (gvCurScr === "CUSTOMER_LIST") {
        	fn_getCustomer(1);
        } else if (gvCurScr === "ADDRESS_LIST") {
        	fn_getAddress(1);
        }
    } else if (id === "orSearch") {
    	$(".clsConcat").html("");
        $(".clsConcat").html("<h2>OR</h2>");
        if (gvCurScr === "SERVICE_LIST") {
        	fn_getFieldService(1);
        } else if (gvCurScr === "PRODUCT_LIST") {
        	fn_getProduct(1);
        } else if (gvCurScr === "CUSTOMER_LIST") {
        	fn_getCustomer(1);
        } else if (gvCurScr === "ADDRESS_LIST") {
        	fn_getAddress(1);
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
    			if (gvCurScr === "SERVICE_LIST") {
    	        	fn_getFieldService(1);
    	        } else if (gvCurScr === "PRODUCT_LIST") {
    	        	fn_getProduct(1);
    	        } else if (gvCurScr === "CUSTOMER_LIST") {
    	        	fn_getCustomer(1);
    	        } else if (gvCurScr === "ADDRESS_LIST") {
    	        	fn_getAddress(1);
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
    		if (gvCurScr === "SERVICE_LIST") {
   	        	fn_getFieldService(1);
   	        } else if (gvCurScr === "PRODUCT_LIST") {
   	        	fn_getProduct(1);
   	        } else if (gvCurScr === "CUSTOMER_LIST") {
   	        	fn_getCustomer(1);
   	        } else if (gvCurScr === "ADDRESS_LIST") {
   	        	fn_getAddress(1);
   	        }
    	}
    } else if (id === "keyword2") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch2").val() != null && $("#cbSearch2").val() != "" && $("#cbSearch2").val() != "undefined" && $("#cbSearch2").val() != "00") {
            	//$("#cbSearch3").removeAttr("disabled");
                //$("#keyword3").removeAttr("readonly");
            	if (gvCurScr === "SERVICE_LIST") {
    	        	fn_getFieldService(1);
    	        } else if (gvCurScr === "PRODUCT_LIST") {
    	        	fn_getProduct(1);
    	        } else if (gvCurScr === "CUSTOMER_LIST") {
    	        	fn_getCustomer(1);
    	        } else if (gvCurScr === "ADDRESS_LIST") {
    	        	fn_getAddress(1);
    	        }
            } else {
            	//$("#cbSearch3").attr("disabled", "disabled");
                //$("#keyword3").attr("readonly", "readonly");
            }
        } else {
        	//$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
        	if (gvCurScr === "SERVICE_LIST") {
   	        	fn_getFieldService(1);
   	        } else if (gvCurScr === "PRODUCT_LIST") {
   	        	fn_getProduct(1);
   	        } else if (gvCurScr === "CUSTOMER_LIST") {
   	        	fn_getCustomer(1);
   	        } else if (gvCurScr === "ADDRESS_LIST") {
   	        	fn_getAddress(1);
   	        }
        }
    } else if (id === "keyword3") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch3").val() != null && $("#cbSearch3").val() != "" && $("#cbSearch3").val() != "undefined" && $("#cbSearch3").val() != "00") {
            	if (gvCurScr === "SERVICE_LIST") {
    	        	fn_getFieldService(1);
    	        } else if (gvCurScr === "PRODUCT_LIST") {
    	        	fn_getProduct(1);
    	        } else if (gvCurScr === "CUSTOMER_LIST") {
    	        	fn_getCustomer(1);
    	        } else if (gvCurScr === "ADDRESS_LIST") {
    	        	fn_getAddress(1);
    	        }
            }
        } else {
        	if (gvCurScr === "SERVICE_LIST") {
	        	fn_getFieldService(1);
	        } else if (gvCurScr === "PRODUCT_LIST") {
	        	fn_getProduct(1);
	        } else if (gvCurScr === "CUSTOMER_LIST") {
	        	fn_getCustomer(1);
	        } else if (gvCurScr === "ADDRESS_LIST") {
	        	fn_getAddress(1);
	        }
        }
    }
});
</script>
</body>
</html>