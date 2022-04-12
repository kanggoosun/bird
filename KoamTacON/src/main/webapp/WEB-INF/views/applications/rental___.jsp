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
        <!-- Header -->
        <%@ include file="../include/header.jsp" %>
        <div class="inner">
            
            <section>
                <header class="main">
                    <h2>Rental</h2>
                </header>
                
                <div id="divRequest" class="12u$ 12u$(small)"></div>
                
                <div id="divApproval" class="12u$ 12u$(small)" style="text-align:center;"></div>
                
                <div id="divBtn" class="12u$ 12u$(small)"></div>
                
                <div id="divSearch" class="row">
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch1" name="cbSearch1">
                            <option value="00">select</option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword1" name="keyword1" value="" placeholder="Enter key word">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch2" name="cbSearch2">
                            <option value="00">select</option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword2" name="keyword2" value="" placeholder="Enter key word">
                    </div>
                    <div class="0.5u 12u$(small) clsConcat"></div>
                    <div class="1.5u 12u$(small) select-wrapper">
                        <select id="cbSearch3" name="cbSearch3">
                            <option value="00">select</option>
                        </select>
                    </div>
                    <div class="1u 12u$(small)">
                        <input type="text" id="keyword3" name="keyword3" value="" placeholder="Enter key word">
                    </div>
                    <div id="divConcat" class="2u$ 12u$(small) row">
                        <div class="5u 12u$(small)">
                            <input type="radio" id="andSearch" name="searchConcat" value="1">
                            <label for="andSearch">AND</label>
                        </div>
                        <div class="5u$ 12u$(small)">
                            <input type="radio" id="orSearch" name="searchConcat" value="0">
                            <label for="orSearch">OR</label>
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
                                <div class="2u 12u$(small)" style="text-align:right;"><h5>Name</h5></div>
                                <div class="10u$ 12u$(small)"><input type="text" name="customerName" id="customerName" value="" readonly="readonly" /></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="2u 12u$(small)" style="text-align:right;"><h5>Address</h5></div>
                                <div class="10u$ 12u$(small)"><input type="text" name="customerAddr" id="customerAddr" value="" readonly="readonly" /></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="2u 12u$(small)" style="text-align:right;"><h5>Phone</h5></div>
                                <div class="5u 12u$(small)"><input type="text" name="customerPhone1" id="customerPhone1" value="" readonly="readonly" /></div>
                                <div class="5u$ 12u$(small)"><input type="text" name="customerPhone2" id="customerPhone2" value="" readonly="readonly" /></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="2u 12u$(small)" style="text-align:right;"><h5>Email</h5></div>
                                <div class="10u$ 12u$(small)"><input type="text" name="customerEmail" id="customerEmail" value="" readonly="readonly" /></div>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeCInfoPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Contract popup layer -->
<div id="dim-layer-contract" class="dim-layer">
    <div id="dimBgContract" class="dimBg"></div>
    <div id="contract_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="contractDiv" >
                    <form id="frmContract" method="post">
                        <div class="row uniform">
                            <div id="contractFiles" class="12u 12u$"></div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeContractPopup" class="btn-layerClose">Close</a>
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
                                <input type="file" name="excelFile" id="excelFile" value="" required="required" placeholder="Excel file" maxlength="200" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnExcelImport" id="btnExcelImport" value="Import" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeExcelPopup" class="btn-layerClose">Close</a>
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
    fn_getSearchOptions("MA_RENTAL");
});

function fn_getApplicationMap() {
    var param = "";
    param += "applicationSeq=4";
    
    gf_send("<c:url value='/applications/getApplicationMap' />", param, "fn_getApplicationMapCallback");
}

function fn_getApplicationMapCallback(data) {
    fn_showView(data, gfn_nullValue(data.applicationMap.requestTarget), gfn_nullValue(data.applicationMap.approvalFlag));
}

function fn_showView(data, requestTarget, approvalFlag) {
    if (gvUserType === "0" || gvUserType === "1" || gvUserType === "3") {
        if (gvGroupCode === "") {
            fn_makeDivRequest(data.applicationMap, data.screenShots);
            fn_makeDivApproval(data.applicationMap);
        } else {
            fn_makeDivBtn("btnRentalView");
            fn_makeDivRequest(data.applicationMap, data.screenShots);
            $("#divIntroductionView").hide();
            gvCurScr = "LIST";
            fn_getRental(1);
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
            divHtml += "<h2>Create your group first in <a href=\"<c:url value='/group/groupInfo' />\">[Group Management]</a> menu.</h2>";
        } else {
            var flag = gfn_nullValue(applicationMap.approvalFlag);
            if (flag === "3") {
                divHtml += "<p>관리자가 다음과 같은 사유로 사용 요청을 거부하였습니다.<br/>";
                divHtml += applicationMap.comment;
                divHtml += "</p>";
            } else if (flag === "0" || flag === "1") {
                divHtml += "<p>현재 관리자가 승인 처리 작업 진행 중입니다. 관련 자료 연동 작업에 시간이 걸리오니 양해 바랍니다.</p>";
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

    if (gvGroupCode != null && gvGroupCode != "" && gvGroupCode != "undefined") {
        divHtml += "<ul class=\"actions\">";
        divHtml += "    <li><input type=\"button\" name=\"btnRentalView\" id=\"btnRentalView\" value=\"LIST\" class=\"button\" /></li>";
        divHtml += "    <li><input type=\"button\" name=\"btnCustomerView\" id=\"btnCustomerView\" value=\"CUSTOMER\" class=\"button\" /></li>";
        //divHtml += "    <li><input type=\"button\" name=\"btnCategoryView\" id=\"btnCategoryView\" value=\"CATEGORY\" class=\"button\" /></li>";
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
        $("#cbSearch1").append($("<option value=\"00\">select</option>"));
        $("#cbSearch1").append(options);
        $("#cbSearch2").append($("<option value=\"00\">select</option>"));
        $("#cbSearch2").append(options);
        $("#cbSearch3").append($("<option value=\"00\">select</option>"));
        $("#cbSearch3").append(options);
    }
    $("#divConcat").html("");
    var divConcatHtml = "";
    divConcatHtml += "<div class=\"5u 12u$(small)\">";
    divConcatHtml += "    <input type=\"radio\" id=\"andSearch\" name=\"searchConcat\" value=\"1\">";
    divConcatHtml += "    <label for=\"andSearch\">AND</label>";
    divConcatHtml += "</div>";
    divConcatHtml += "<div class=\"5u$ 12u$(small)\">";
    divConcatHtml += "    <input type=\"radio\" id=\"orSearch\" name=\"searchConcat\" value=\"0\">";
    divConcatHtml += "    <label for=\"orSearch\">OR</label>";
    divConcatHtml += "</div>";
    $("#divConcat").html(divConcatHtml);
    $("input:radio[name=searchConcat]:input[value=1]").attr("checked", true);
    $(".clsConcat").html("");
    $(".clsConcat").html("<h2>AND</h2>");
}

function fn_getRental(pageNo) {
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getRental";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/rental/getRental' />", param, "fn_getRentalCallback");
}

function fn_getRentalCallback(data) {
    var list = data.rentalList;
    var def = data.rentalDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithRental(list, paginationHtml, def);
}

function fn_makeTblApplicationDataWithRental(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\">Rental Seq</th>";
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
            var cName = gfn_nullValue(applicationDataList[i].fName)+" "+gfn_nullValue(applicationDataList[i].lName);
            var cAddr = gfn_nullValue(applicationDataList[i].streetNo)+" "+gfn_nullValue(applicationDataList[i].streetName)+" "+gfn_nullValue(applicationDataList[i].city)+" "+gfn_nullValue(applicationDataList[i].state)+" "+gfn_nullValue(applicationDataList[i].zipcode);
            var cPhone1 = gfn_nullValue(applicationDataList[i].phone1);
            var cPhone2 = gfn_nullValue(applicationDataList[i].phone2);
            var cEmail = gfn_nullValue(applicationDataList[i].email);
            var cSeq = applicationDataList[i].val14;
            var pdfUrl = applicationDataList[i].val15;
            
            tblHtml += "<tr>";
            tblHtml += "    <td id=\"tdKey-"+i+"\">"+applicationDataList[i].reckey+"</td>";
            tblHtml += "    <td id=\"tdVal01-"+i+"\">"+applicationDataList[i].val01+"</td>";
            tblHtml += "    <td id=\"tdVal02-"+i+"\">"+applicationDataList[i].val02+"</td>";
            tblHtml += "    <td id=\"tdVal03-"+i+"\">"+applicationDataList[i].val03+"</td>";
            tblHtml += "    <td id=\"tdVal04-"+i+"\">"+applicationDataList[i].val04+"</td>";
            tblHtml += "    <td id=\"tdVal05-"+i+"\">"+applicationDataList[i].val05+"</td>";
            tblHtml += "    <td id=\"tdVal06-"+i+"\">"+applicationDataList[i].val06+"</td>";
            tblHtml += "    <td id=\"tdVal07-"+i+"\">"+applicationDataList[i].val07+"</td>";
            tblHtml += "    <td id=\"tdVal08-"+i+"\">"+applicationDataList[i].val08+"</td>";
            tblHtml += "    <td id=\"tdVal09-"+i+"\">"+applicationDataList[i].val09+"</td>";
            tblHtml += "    <td id=\"tdVal10-"+i+"\">"+applicationDataList[i].val10+"</td>";
            tblHtml += "    <td id=\"tdVal11-"+i+"\">"+applicationDataList[i].val11+"</td>";
            tblHtml += "    <td id=\"tdVal12-"+i+"\">"+applicationDataList[i].val12+"</td>";
            tblHtml += "    <td id=\"tdVal13-"+i+"\">"+applicationDataList[i].val13+"</td>";
            tblHtml += "    <td id=\"tdCseq-"+i+"\">"+applicationDataList[i].val14;
            if (cSeq != null && cSeq != "" && cSeq != "undefined") {
            	tblHtml += " <img src=\"/resources/images/icon/icon_document.png\" alt=\"\" style=\"max-height:20px;width:auto;\" />";
    		}
            tblHtml += "    </td>";
            tblHtml += "<input type=\"hidden\" id=\"cName-"+i+"\" value=\""+cName+"\">";
            tblHtml += "<input type=\"hidden\" id=\"cAddr-"+i+"\" value=\""+cAddr+"\">";
            tblHtml += "<input type=\"hidden\" id=\"cPhone1-"+i+"\" value=\""+cPhone1+"\">";
            tblHtml += "<input type=\"hidden\" id=\"cPhone2-"+i+"\" value=\""+cPhone2+"\">";
            tblHtml += "<input type=\"hidden\" id=\"cEmail-"+i+"\" value=\""+cEmail+"\">";
            if (pdfUrl != null && pdfUrl != '' && pdfUrl != 'undefined') {
            	tblHtml += "    <td id=\"tdContract-"+i+"\">"+applicationDataList[i].val15;
            	//tblHtml += "         <img src=\"/resources/images/icon/icon_document.png\" alt=\"\" style=\"max-height:20px;width:auto;\" />";
            	tblHtml += "    </td>";
            } else {
            	tblHtml += "    <td id=\"tdContract-"+i+"\"></td>";
            }
            tblHtml += "<input type=\"hidden\" id=\"contract-"+i+"\" value=\""+applicationDataList[i].val15+"\">";
            tblHtml += "    <td id=\"tdVal16-"+i+"\">"+applicationDataList[i].val16+"</td>";
            tblHtml += "    <td id=\"tdVal17-"+i+"\">"+applicationDataList[i].val17+"</td>";
            tblHtml += "    <td id=\"tdVal18-"+i+"\">"+applicationDataList[i].val18+"</td>";
            tblHtml += "    <td id=\"tdVal19-"+i+"\">"+applicationDataList[i].val19+"</td>";
            tblHtml += "    <td id=\"tdVal20-"+i+"\">"+applicationDataList[i].val20+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportRental\" id=\"btnExcelExportRental\" value=\"Export\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportRental\" id=\"btnExcelImportRental\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"21\" style=\"text-align:center;\">There is no data.</td></tr>";
        //buttonHtml += "<ul class=\"actions\">";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportRental\" id=\"btnExcelImportRental\" value=\"Import\" class=\"button special fit\" /></li>";
        //buttonHtml += "</ul>";
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
    tblHtml += "            <th style=\"text-align:center;\">Customer Seq</th>";
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
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCustomerTemplate\" id=\"btnDowonloadCustomerTemplate\" value=\"Download template\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportCustomer\" id=\"btnExcelExportCustomer\" value=\"Export\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportCustomer\" id=\"btnExcelImportCustomer\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"21\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCustomerTemplate\" id=\"btnDowonloadCustomerTemplate\" value=\"Download template\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportCustomer\" id=\"btnExcelImportCustomer\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
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
                    fn_getRental(1);
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
                	fn_getRental(1);
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
                	fn_getRental(1);
                } else {
                    fn_getCustomer(1);
                }
            }
        }
    }
    
    if (id === "andSearch") {
        $(".clsConcat").html("");
        $(".clsConcat").html("<h2>AND</h2>");
        if (gvCurScr === "LIST") {
        	fn_getRental(1);
        } else {
            fn_getCustomer(1);
        }
    } else if (id === "orSearch") {
        $(".clsConcat").html("");
        $(".clsConcat").html("<h2>OR</h2>");
        if (gvCurScr === "LIST") {
        	fn_getRental(1);
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
                	fn_getRental(1);
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
            	fn_getRental(1);
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
                	fn_getRental(1);
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
            	fn_getRental(1);
                } else {
                    fn_getCustomer(1);
                }
        }
    } else if (id === "keyword3") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch3").val() != null && $("#cbSearch3").val() != "" && $("#cbSearch3").val() != "undefined" && $("#cbSearch3").val() != "00") {
                if (gvCurScr === "LIST") {
                	fn_getRental(1);
                } else {
                    fn_getCustomer(1);
                }
            }
        } else {
            if (gvCurScr === "LIST") {
            	fn_getRental(1);
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

        if (id === "tdCseq") {
            fn_layerCInfoPopup(no);
        } else if (id === "tdContract") {
        	/*
            var pdfPath = $("#contract-"+no).val();
            var pdfStrs = pdfPath.split("/");
            var pdfSrc = "http://54.173.68.163/server_marketingtest/mediaanswers/"+pdfStrs[pdfStrs.length-1];
            var pdfHtml = "<a href='"+pdfSrc+"' target='_Blank'/>Click to here</a>";
            
            $("#contractFiles").html("");
            $("#contractFiles").html(pdfHtml);
            gfn_customLayerPopup('dim-layer-contract', 'dimBgContract', 'contract_layer', 'closeContractPopup');
            */
        }    	
    }
});

function fn_clearFrmCInfoPop() {
    $("#customerName").val("");
    $("#customerAddr").val("");
    $("#customerPhone1").val("");
    $("#customerPhone2").val("");
    $("#customerEmail").val("");
}

function fn_layerCInfoPopup(no){
    fn_clearFrmCInfoPop();
    
    $("#customerName").val($("#cName-"+no).val());
    $("#customerAddr").val($("#cAddr-"+no).val());
    $("#customerPhone1").val($("#cPhone1-"+no).val());
    $("#customerPhone2").val($("#cPhone2-"+no).val());
    $("#customerEmail").val($("#cEmail-"+no).val());
    gfn_customLayerPopup('dim-layer-CInfo', 'dimBgCInfo', 'CInfo_layer', 'closeCInfoPopup');
}

var strClickEventNm  = "";
strClickEventNm += "#btnRentalView, #btnCustomerView, #btnCategoryView";
strClickEventNm += ", #btnExcelExportRental, #btnExcelImportRental";
strClickEventNm += ", #btnExcelExportCustomer, #btnExcelImportCustomer, #btnDowonloadCustomerTemplate";
strClickEventNm += ", #btnExcelImport";
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
    if (id === "btnRentalView") {
        fn_makeDivBtn("btnRentalView");
        $("#divSearch").show();
        fn_getSearchOptions("MA_RENTAL");
        gvCurScr = "LIST";
        fn_getRental(1);
    } else if (id === "btnCustomerView") {
        fn_makeDivBtn("btnCustomerView");
        $("#divSearch").show();
        fn_getSearchOptions("MA_CUSTOMERS");
        gvCurScr = "CUSTOMER";
        fn_getCustomer(1);
    } else if (id === "btnCategoryView") {
        fn_makeDivBtn("btnCategoryView");
        //fn_getSearchOptions("CAT1_RENTAL");
        $("#divSearch").hide();
        gvCurScr = "CATEGORY";
        fn_getCategory(1);
    } else if (id === "btnExcelExportRental") {
        fn_excelExport("rental");
    }  else if (id === "btnExcelExportCustomer") {
        fn_excelExport("customer");
    } else if (id === "btnExcelImportRental" || id === "btnExcelImportCustomer") {
        fn_excelPopup();
    } else if (id === "btnExcelImport") {
        fn_excelImport();
    } else if (id === 'btnDowonloadCustomerTemplate') {
    	fn_templateDownload('Template_Customer.xlsx');
    }
}

function fn_templateDownload(filename) {
    var param = "";
    param += "flag="+"template";
    param += "&";
    param += "filename="+filename;
    
    gf_genFileDownLoad(param);
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
            gf_sendFileForm(frmId, "<c:url value='/WSApi/importRental' />", "fn_excelImportCallback");
        } else {
            gf_sendFileForm(frmId, "<c:url value='/WSApi/importCustomer' />", "fn_excelImportCallback");
        }
    }
}

function fn_excelImportCallback(data) {
    gfn_layerPopup(data.msg);
    if (data.result === "success") {
        if (gvCurScr === "LIST") {
            fn_getRental(1);
        } else {
            fn_getCustomer(1);
        }
    }
}

function fn_getCategory(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getCustomer";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/rental/getCategoryRental' />", param, "fn_getCategoryCallback");
}

function fn_getCategoryCallback(data) {
    var list = data.categoryList;
    //var def = data.categoryDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithCategory(list, paginationHtml);
}

function fn_makeTblApplicationDataWithCategory(applicationDataList, paginationHtml) {
	var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\">Key Level1</th>";
    tblHtml += "            <th style=\"text-align:center;\">Category Level1</th>";
    tblHtml += "            <th style=\"text-align:center;\">Info Level1</th>";
    tblHtml += "            <th style=\"text-align:center;\">Key Level2</th>";
    tblHtml += "            <th style=\"text-align:center;\">Category Level2</th>";
    tblHtml += "            <th style=\"text-align:center;\">Info Level2</th>";
    tblHtml += "            <th style=\"text-align:center;\">Key Level3</th>";
    tblHtml += "            <th style=\"text-align:center;\">Category Level3</th>";
    tblHtml += "            <th style=\"text-align:center;\">Info Level3</th>";
    tblHtml += "        </tr>";
    tblHtml += "    </thead>";
    tblHtml += "    <tbody style=\"text-align:center;font-size:0.8em;\">";
    if (applicationDataList != null && applicationDataList.length > 0) {
        for(var i=0; i<applicationDataList.length; i++) {
            tblHtml += "<tr>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l1_key)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l1_cat)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l1_info)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l2_key)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l2_cat)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l2_info)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l3_key)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l3_cat)+"</td>";
            tblHtml += "    <td>"+gfn_nullValue(applicationDataList[i].l3_info)+"</td>";
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCategoryTemplate\" id=\"btnDowonloadCategoryTemplate\" value=\"Download template\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportCategory\" id=\"btnExcelImportCategory\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportCategory\" id=\"btnExcelExportCategory\" value=\"Export\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"9\" style=\"text-align:center;\">There is no data.</td></tr>";
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnDowonloadCategoryTemplate\" id=\"btnDowonloadCategoryTemplate\" value=\"Download template\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportCategory\" id=\"btnExcelImportCategory\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
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
    if (gvUserType != '3') {
    	$("#tblApplicationData tfoot #tdButton").html(buttonHtml);
    }
}
</script>
</body>
</html>