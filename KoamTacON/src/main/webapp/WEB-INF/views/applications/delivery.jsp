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
                    <h2><spring:message code='MENU-DELIVERY' text='Delivery' /></h2>
                </header>
                
                <div id="divRequest" class="12u$ 12u$(small)"></div>
                
                <div id="divApproval" class="12u$ 12u$(small)" style="text-align:center;"></div>
                
                <div id="divBtn" class="12u$ 12u$(small)"></div>
                
                <div id="divSearch" class="row">
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch1" name="cbSearch1">
                            <option value="00"><spring:message code='WRD-SELECT' text='Select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword1" name="keyword1" value="" placeholder="<spring:message code='WRD-ENTKW' text='Enter Keyword' />">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch2" name="cbSearch2">
                            <option value="00"><spring:message code='WRD-SELECT' text='Select' /></option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword2" name="keyword2" value="" placeholder="<spring:message code='WRD-ENTKW' text='Enter Keyword' />">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch3" name="cbSearch3">
                            <option value="00"><spring:message code='WRD-SELECT' text='Select' /></option>
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
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Customer information popup layer -->
<div id="dim-layer-CInfo" class="dim-layer">
    <div id="dimBgCInfo" class="dimBg"></div>
    <div id="CInfo_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="cInfoDiv" >
                    <form id="frmCInfo">
                        <div class="row uniform">
                            <div class="12u$ 12u$ row">
                                <div class="2u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-NAME' text='Name' /></h5></div>
                                <div class="10u$ 12u$(small)"><input type="text" name="customerName" id="customerName" value="" readonly="readonly" /></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="2u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-ADDR' text='Address' /></h5></div>
                                <div class="10u$ 12u$(small)"><input type="text" name="customerAddr" id="customerAddr" value="" readonly="readonly" /></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="2u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-PHONE' text='Phone' /></h5></div>
                                <div class="5u 12u$(small)"><input type="text" name="customerPhone1" id="customerPhone1" value="" readonly="readonly" /></div>
                                <div class="5u$ 12u$(small)"><input type="text" name="customerPhone2" id="customerPhone2" value="" readonly="readonly" /></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="2u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-EMAIL' text='Email' /></h5></div>
                                <div class="10u$ 12u$(small)"><input type="text" name="customerEmail" id="customerEmail" value="" readonly="readonly" /></div>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeCInfoPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Address information popup layer -->
<div id="dim-layer-addr" class="dim-layer">
    <div id="dimBgAddr" class="dimBg"></div>
    <div id="addr_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="addrDiv" >
                    <form id="frmAddr">
                        <div class="row uniform">
                            <div class="12u$ 12u$ row">
                            	<div class="12u$ 12u$(small) row">
                                	<div class="12u$ 12u$(small)"><input type="text" name="fAddr" id="fAddr" value="" readonly="readonly" /></div>
                                </div>
                            </div>
                            <div class="12u$ 12u$ row">
                            	<div class="6u 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-STRNO' text='Street No.' /></h5></div>
                                	<div class="9u$ 12u$(small)"><input type="text" name="streetNo" id="streetNo" value="" readonly="readonly" /></div>
                                </div>
                                <div class="6u$ 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-STRNM' text='Street Name' /></h5></div>
                                	<div class="9u$ 12u$(small)"><input type="text" name="streetName" id="streetName" value="" readonly="readonly" /></div>
                                </div>
                            </div>
                            <div class="12u$ 12u$ row">
                            	<div class="6u 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-CITY' text='City' /></h5></div>
                                	<div class="9u$ 12u$(small)"><input type="text" name="city" id="city" value="" readonly="readonly" /></div>
                                </div>
                                <div class="6u$ 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-STATE' text='State' /></h5></div>
                                	<div class="9u$ 12u$(small)"><input type="text" name="state" id="state" value="" readonly="readonly" /></div>
                                </div>
                            </div>
                            <div class="12u$ 12u$ row">
                            	<div class="6u 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-COUNTRY' text='Country' /></h5></div>
                                	<div class="9u$ 12u$(small)"><input type="text" name="country" id="country" value="" readonly="readonly" /></div>
                                </div>
                                <div class="6u$ 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-ZIPCD' text='Zipcode' /></h5></div>
                                <div class="9u$ 12u$(small)"><input type="text" name="zipcode" id="zipcode" value="" readonly="readonly" /></div>
                                </div>
                            </div>
                            <div class="12u$ 12u$ row">
                            	<div class="6u 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-PHONE' text='Phone' /></h5></div>
                                	<div class="9u$ 12u$(small)"><input type="text" name="aPhone" id="aPhone" value="" readonly="readonly" /></div>
                                </div>
                                <div class="6u$ 12u$(small) row">
                                	<div class="3u 12u$(small)" style="text-align:right;"><h5><spring:message code='WRD-REMARK' text='Remark' /></h5></div>
                                	<div class="9u$ 12u$(small)"><input type="text" name="aRemark" id="aRemark" value="" readonly="readonly" /></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeAddrPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Signature popup layer -->
<div id="dim-layer-sign" class="dim-layer">
    <div id="dimBgSign" class="dimBg"></div>
    <div id="sign_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="signDiv" >
                    <form id="frmSign" method="post">
                        <div class="row uniform">
                            <div id="signatureImage" class="12u 12u$"></div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeSignPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
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
    fn_getSearchOptions("MA_DELIVERY_MAST");
});

function fn_getApplicationMap() {
    var param = "";
    param += "applicationSeq=3";
    
    gf_send("<c:url value='/applications/getApplicationMap' />", param, "fn_getApplicationMapCallback");
}

function fn_getApplicationMapCallback(data) {
    fn_showView(data, gfn_nullValue(data.applicationMap.requestTarget), gfn_nullValue(data.applicationMap.approvalFlag));
}

function fn_showView(data, requestTarget, approvalFlag) {
    if (gvUserType === "0" || gvUserType === "1"  || gvUserType === "3") {
        if (gvGroupCode === "") {
            fn_makeDivRequest(data.applicationMap, data.screenShots);
            fn_makeDivApproval(data.applicationMap);
        } else {
            fn_makeDivBtn("btnDeliveryView");
            fn_makeDivRequest(data.applicationMap, data.screenShots);
            $("#divIntroductionView").hide();
            gvCurScr = "LIST";
            fn_getDelivery(1);
        }
    }
}

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
            divHtml += "<h2><spring:message code='MSG-VW061' text='Create your group first in' /> <a href=\"<c:url value='/group/groupInfo' />\">[<spring:message code='WRD-GM' text='Group Management' />]</a> <spring:message code='MSG-VW073' text='menu.' /></h2>";
        } else {
            var flag = gfn_nullValue(applicationMap.approvalFlag);
            if (flag === "3") {
                divHtml += "<p><spring:message code='MSG-VW074' text='관리자가 다음과 같은 사유로 사용 요청을 거부하였습니다.' /><br/>";
                divHtml += applicationMap.comment;
                divHtml += "</p>";
            } else if (flag === "0" || flag === "1") {
                divHtml += "<p><spring:message code='MSG-VW075' text='현재 관리자가 승인 처리 작업 진행 중입니다.' /> <spring:message code='MSG-VW076' text='관련 자료 연동 작업에 시간이 걸리오니 양해 바랍니다.' /></p>";
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

    if (gvGroupCode != null && gvGroupCode != "" && gvGroupCode != "undefined") {
        divHtml += "<ul class=\"actions\">";
        divHtml += "    <li><input type=\"button\" name=\"btnDeliveryView\" id=\"btnDeliveryView\" value=\"<spring:message code='WRD-INVCLIST' text='INVOICE LIST' />\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnCustomerView\" id=\"btnCustomerView\" value=\"<spring:message code='WRD-CUSTOMERS' text='CUSTOMERS' />\" class=\"button\" /></li>";
        //divHtml += "    <li><input type=\"button\" name=\"btnAddressView\" id=\"btnAddressView\" value=\"ADDRESS\" class=\"button\" /></li>";
        divHtml += "</ul>";
        
        $("#divBtn").html("");
        $("#divBtn").html(divHtml);
        
        if (!$("#"+divBtnId).hasClass("special")) {
            $("#"+divBtnId).toggleClass("special");
        }
    }
}

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
        $("#cbSearch1").append($("<option value=\"00\"><spring:message code='WRD-SELECT' text='Select' /></option>"));
        $("#cbSearch1").append(options);
        $("#cbSearch2").append($("<option value=\"00\"><spring:message code='WRD-SELECT' text='Select' /></option>"));
        $("#cbSearch2").append(options);
        $("#cbSearch3").append($("<option value=\"00\"><spring:message code='WRD-SELECT' text='Select' /></option>"));
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

function fn_getDelivery(pageNo) {
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getDelivery";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/delivery/getDelivery' />", param, "fn_getDeliveryCallback");
}

function fn_getDeliveryCallback(data) {
    var list = data.deliveryList;
    var def = data.deliveryDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithDelivery(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithDelivery(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-DELISEQ' text='Delivery Seq' /></th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-STATUS' text='Status' /></th>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-RESULT' text='Result' /></th>";
    //tblHtml += "            <th style=\"text-align:center;\">Fee</th>";
    //tblHtml += "            <th style=\"text-align:center;\">Fee Type</th>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-REMARK' text='Remark' /></th>";
    //tblHtml += "            <th style=\"text-align:center;\">key</th>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-WORKER' text='Worker' /></th>";
    //tblHtml += "            <th style=\"text-align:center;\">Updated Date</th>";
    //tblHtml += "            <th style=\"text-align:center;\">Updated By</th>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-SRCTYPE' text='Source Type' /></th>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-SRCKEY' text='Source Key' /></th>";
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr>";
            tblHtml += "    <td id=\"tdKey-"+i+"\">"+applicationDataList[i].reckey+"</td>";
            tblHtml += "    <td id=\"tdVal02-"+i+"\">"+applicationDataList[i].val02+"</td>";
            tblHtml += "    <td id=\"tdVal03-"+i+"\">"+applicationDataList[i].val03+"</td>";
            tblHtml += "    <td id=\"tdVal04-"+i+"\">"+applicationDataList[i].val04+"</td>";
            tblHtml += "    <td id=\"tdVal05-"+i+"\">"+applicationDataList[i].val05+"</td>";
            tblHtml += "    <td id=\"tdVal06-"+i+"\">"+applicationDataList[i].val06;
            if (applicationDataList[i].val06 != null && applicationDataList[i].val06 != "" && applicationDataList[i].val06 != "undefined") {
            	tblHtml += " <img src=\"/resources/images/icon/icon_document.png\" alt=\"\" style=\"max-height:20px;width:auto;\" />";
    		}
            tblHtml += "    </td>";
            tblHtml += "    <td id=\"tdVal07-"+i+"\">"+applicationDataList[i].val07;
            if (applicationDataList[i].val07 != null && applicationDataList[i].val07 != "" && applicationDataList[i].val07 != "undefined") {
            	tblHtml += " <img src=\"/resources/images/icon/icon_document.png\" alt=\"\" style=\"max-height:20px;width:auto;\" />";
    		}
            tblHtml += "    </td>";
            tblHtml += "    <td id=\"tdVal08-"+i+"\">"+applicationDataList[i].val08+"</td>";
            tblHtml += "    <td id=\"tdVal09-"+i+"\">"+applicationDataList[i].val09+"</td>";
            //tblHtml += "    <td id=\"tdVal10-"+i+"\">"+applicationDataList[i].val10+"</td>";
            //tblHtml += "    <td id=\"tdVal11-"+i+"\">"+applicationDataList[i].val11+"</td>";
            tblHtml += "    <td id=\"tdVal12-"+i+"\">"+applicationDataList[i].val12+"</td>";
            //tblHtml += "    <td id=\"tdVal14-"+i+"\">"+applicationDataList[i].val14+"</td>";
            tblHtml += "    <td id=\"tdVal15-"+i+"\">"+applicationDataList[i].val15+"</td>";
            //tblHtml += "    <td id=\"tdVal16-"+i+"\">"+applicationDataList[i].val16+"</td>";
            //tblHtml += "    <td id=\"tdVal17-"+i+"\">"+applicationDataList[i].val17+"</td>";
            tblHtml += "    <td id=\"tdVal18-"+i+"\">"+applicationDataList[i].val18+"</td>";
            tblHtml += "    <td id=\"tdVal19-"+i+"\">"+applicationDataList[i].val19+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadDeliveryTemplate\" id=\"btnDowonloadDeliveryTemplate\" value=\"Download template\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportDelivery\" id=\"btnExcelExportDelivery\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportDelivery\" id=\"btnExcelImportDelivery\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"18\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
        //buttonHtml += "<ul class=\"actions\">";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadDeliveryTemplate\" id=\"btnDowonloadDeliveryTemplate\" value=\"Download template\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportDelivery\" id=\"btnExcelImportDelivery\" value=\"Import\" class=\"button special fit\" /></li>";
        //buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"18\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"18\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
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
    
    gf_send("<c:url value='/apps/tracking/getCustomerD' />", param, "fn_getCustomerCallback");
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
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-CUSTSEQ' text='Customer Seq' /></th>";
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
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr>";
            tblHtml += "    <td id=\"tdKey-"+i+"\">"+applicationDataList[i].reckey+"</td>";
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
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCustomerTemplate\" id=\"btnDowonloadCustomerTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportCustomer\" id=\"btnExcelExportCustomer\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportCustomer\" id=\"btnExcelImportCustomer\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"18\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCustomerTemplate\" id=\"btnDowonloadCustomerTemplate\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel Template Download' />\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportCustomer\" id=\"btnExcelImportCustomer\" value=\"<spring:message code='WRD-IMPORT' text='Import' />\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    }
    tblHtml += "    </tbody>";
    tblHtml += "    <tfoot style=\"font-size:0.8em;\">";
    tblHtml += "        <tr><td colspan=\"18\" style=\"text-align:center;\" id=\"tdPagination\"></td></tr>";
    tblHtml += "        <tr><td colspan=\"18\" style=\"text-align:right;\" id=\"tdButton\"></td></tr>";
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
                if (gvCurScr === "LIST") {
                    fn_getDelivery(1);
                } else {
                	fn_getCustomer(1);
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
                    fn_getDelivery(1);
                } else {
                    fn_getCustomer(1);
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
                    fn_getDelivery(1);
                } else {
                    fn_getCustomer(1);
                }
            }
        }
    }
    
    if (id === "andSearch") {
        $(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-AND' text='AND' /></h2>");
        if (gvCurScr === "LIST") {
            fn_getDelivery(1);
        } else {
            fn_getCustomer(1);
        }
    } else if (id === "orSearch") {
        $(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-OR' text='OR' /></h2>");
        if (gvCurScr === "LIST") {
            fn_getDelivery(1);
        } else {
            fn_getCustomer(1);
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
                    fn_getDelivery(1);
                } else {
                    fn_getCustomer(1);
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
                    fn_getDelivery(1);
                } else {
                    fn_getCustomer(1);
                }
        }
    } else if (id === "keyword2") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch2").val() != null && $("#cbSearch2").val() != "" && $("#cbSearch2").val() != "undefined" && $("#cbSearch2").val() != "00") {
                //$("#cbSearch3").removeAttr("disabled");
                //$("#keyword3").removeAttr("readonly");
                if (gvCurScr === "LIST") {
                    fn_getDelivery(1);
                } else {
                    fn_getCustomer(1);
                }
            } else {
                //$("#cbSearch3").attr("disabled", "disabled");
                //$("#keyword3").attr("readonly", "readonly");
            }
        } else {
            //$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
            if (gvCurScr === "LIST") {
                    fn_getDelivery(1);
                } else {
                    fn_getCustomer(1);
                }
        }
    } else if (id === "keyword3") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch3").val() != null && $("#cbSearch3").val() != "" && $("#cbSearch3").val() != "undefined" && $("#cbSearch3").val() != "00") {
            	if (gvCurScr === "LIST") {
                    fn_getDelivery(1);
                } else {
                    fn_getCustomer(1);
                }
            }
        } else {
        	if (gvCurScr === "LIST") {
                fn_getDelivery(1);
            } else {
                fn_getCustomer(1);
            }
        }
    }
});

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

$(document).on("click", "#tblApplicationData tbody td", function(e){
    e.preventDefault();

    if (gvCurScr === "LIST") {
	    var tid = $(this).attr("id");
	    var id = tid.split("-")[0];
	    var no = tid.split("-")[1];
	    gvCurScr	
	    if (id === "tdVal06") {
	    	fn_getCustomerInfo(no);
	    } else if (id === "tdVal07") {
	    	fn_getAddressInfo(no);
	    } else if (id === "tdCSign") {
	    	var imgPath = $("#cSign-"+no).val();
	    	if (imgPath != null && imgPath != "" && imgPath != "undefined") {
		    	var imgStrs = imgPath.split("/");
		    	//var imgSrc = "http://54.173.68.163/server_marketingtest/mediaanswers/"+imgStrs[imgStrs.length-1];
		    	var imgSrc = "<c:out value='${ uploadImage }' />"+imgStrs[imgStrs.length-1];
		    	var imgHtml = "<img src='"+imgSrc+"' style='max-height:600px;width:auto;' />";
		    	
		    	$("#signatureImage").html("");
		        $("#signatureImage").html(imgHtml);
		    	gfn_customLayerPopup('dim-layer-sign', 'dimBgSign', 'sign_layer', 'closeSignPopup');
	    	}
	    }
    }
});

function fn_getCustomerInfo(no) {
	var param = "";
    param += 'customerSeq='+$("#tdVal06-"+no).text();
    gf_send("<c:url value='/apps/delivery/getCustomerInfo' />", param, "fn_getCustomerInfoCallback");
}

function fn_getCustomerInfoCallback(data) {
	var cInfo = data.customerInfo;
	if (cInfo != null && cInfo != "") {
		$("#customerName").val(cInfo.val02+' '+cInfo.val01);
		var addr = '';
		if (cInfo.val03 != null && cInfo.val03 != '' && cInfo.val03 != 'undefined') {
			addr += cInfo.val03;
		}
		if (cInfo.val04 != null && cInfo.val04 != '' && cInfo.val04 != 'undefined') {
			if (addr != '') {
				addr += ' ';
			}
			addr += cInfo.val04;
		}
		if (cInfo.val05 != null && cInfo.val05 != '' && cInfo.val05 != 'undefined') {
			if (addr != '') {
				addr += ', ';
			}
			addr += cInfo.val05;
		}
		if (cInfo.val06 != null && cInfo.val06 != '' && cInfo.val06 != 'undefined') {
			if (addr != '') {
				addr += ', ';
			}
			addr += cInfo.val06;
		}
		if (cInfo.val07 != null && cInfo.val07 != '' && cInfo.val07 != 'undefined') {
			if (addr != '') {
				addr += ', ';
			}
			addr += cInfo.val07;
		}
		if (cInfo.val08 != null && cInfo.val08 != '' && cInfo.val08 != 'undefined') {
			if (addr != '') {
				addr += ', ';
			}
			addr += cInfo.val08;
		}
	    $("#customerAddr").val(addr);
	    $("#customerPhone1").val(cInfo.val09);
	    $("#customerPhone2").val(cInfo.val10);
	    $("#customerEmail").val(cInfo.val11);
	    
	    gfn_customLayerPopup('dim-layer-CInfo', 'dimBgCInfo', 'CInfo_layer', 'closeCInfoPopup');
	}
}

function fn_getAddressInfo(no) {
	var tmpSeq = $("#tdVal07-"+no).text();
	var addrSeq = tmpSeq.replace("<<>>", "||");
	var param = "";
    param += 'addrSeq='+addrSeq;
    
    gf_send("<c:url value='/apps/delivery/getAddressInfo' />", param, "fn_getAddressInfoCallback");
}

function fn_getAddressInfoCallback(data) {
	var aInfo = data.addrInfo;
	if (aInfo != null && aInfo != '' && aInfo != 'undefined') {
		$("#fAddr").val(aInfo.val17);
		$("#streetNo").val(aInfo.val01);
		$("#streetName").val(aInfo.val02);
		$("#city").val(aInfo.val03);
		$("#state").val(aInfo.val04);
		$("#country").val(aInfo.val05);
		$("#zipcode").val(aInfo.val06);
		$("#aPhone").val(aInfo.val07);
		$("#aRemark").val(aInfo.val08);
		
		gfn_customLayerPopup('dim-layer-addr', 'dimBgAddr', 'addr_layer', 'closeAddrPopup');
	}
}

var strClickEventNm  = "";
strClickEventNm += "#btnDeliveryView, #btnCustomerView, #btnAddressView";
strClickEventNm += ", #btnDowonloadDeliveryTemplate, #btnExcelExportDelivery, #btnExcelImportDelivery";
strClickEventNm += ", #btnDowonloadCustomerTemplate, #btnExcelExportCustomer, #btnExcelImportCustomer";
strClickEventNm += ", #btnExcelImport";
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
    if (id === "btnDeliveryView") {
    	fn_makeDivBtn("btnDeliveryView");
        fn_getSearchOptions("MA_DELIVERY_MAST");
        gvCurScr = "LIST";
        fn_getDelivery(1);
    } else if (id === "btnCustomerView") {
    	fn_makeDivBtn("btnCustomerView");
        fn_getSearchOptions("MA_CUSTOMERS_D");
        gvCurScr = "CUSTOMER";
        fn_getCustomer(1);
    } else if (id === "btnExcelExportDelivery") {
        fn_excelExport("delivery");
    }  else if (id === "btnExcelExportCustomer") {
        fn_excelExport("customerD");
    } else if (id === "btnExcelImportDelivery" || id === "btnExcelImportCustomer") {
    	fn_excelPopup();
    } else if (id === "btnExcelImport") {
        fn_excelImport();
    } else if (id === "btnDowonloadDeliveryTemplate") {
    	fn_templateDownload("Template_Delivery_job.xlsx");
    } else if (id === "btnDowonloadCustomerTemplate") {
    	fn_templateDownload("Template_Delivery_customer.xlsx");
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

function fn_excelPopup() {
    $("#excelFile").val("");
    
    gfn_customLayerPopup('dim-layer-excel', 'dimBgExcel', 'excel_layer', 'closeExcelPopup');
}

function fn_excelImport() {
    var frmId = "frmExcel";

    if (gfn_checkRequired(frmId) === true) {
        $('#dim-layer-excel').fadeOut();
        if (gvCurScr === "LIST") {
        	gf_sendFileForm(frmId, "<c:url value='/WSApi/importDelivery' />", "fn_excelImportCallback");
        } else {
        	gf_sendFileForm(frmId, "<c:url value='/WSApi/importCustomerD' />", "fn_excelImportCallback");
        }
    }
}

function fn_excelImportCallback(data) {
    gfn_layerPopup(data.msg);
    if (data.result === "success") {
    	if (gvCurScr === "LIST") {
            fn_getDelivery(1);
        } else {
            fn_getCustomer(1);
        }
    }
}

function fn_templateDownload(filename) {
    var param = "";
    param += "flag="+"template";
    param += "&";
    param += "filename="+filename;
    
    gf_genFileDownLoad(param);
}
</script>
</body>
</html>