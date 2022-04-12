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
    <title><spring:message code='WRD-APPLS' text='Applications' /> - KoamTacON</title>
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
                    <h2><spring:message code='MENU-RETAIL' text='Retail' /></h2>
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
    fn_getSearchOptions("HIS_RETAIL");
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
    param += "applicationSeq=2";
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
            //fn_makeDivBtn("btnRetailView");
            fn_makeDivRequest(data.applicationMap, data.screenShots);
            $("#divIntroductionView").hide();
            fn_getRetail(1);
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
    	divHtml += "    <li><input type=\"button\" name=\"btnRetailView\" id=\"btnRetailView\" value=\"RETAIL\" class=\"button\" /></li>";
    	divHtml += "</ul>";
    	
    	$("#divBtn").html("");
        $("#divBtn").html(divHtml);
        
        if (!$("#"+divBtnId).hasClass("special")) {
            $("#"+divBtnId).toggleClass("special");
        }
    }
}

function fn_makeTblApplicationDataWithRetail(applicationDataList, paginationHtml, applicationDef) {
    var tblHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    tblHtml += "<table class=\"alt\">";
    tblHtml += "    <thead>";
    tblHtml += "        <tr>";
    tblHtml += "            <th style=\"text-align:center;\"><spring:message code='WRD-RETAILSEQ' text='Retail Seq' /></th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval01+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval02+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval03+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval04+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval05+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval06+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval07+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval08+"</th>";
    tblHtml += "            <th style=\"text-align:center;\">"+applicationDef.descval09+"</th>";
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
            tblHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportRetail\" id=\"btnExcelExportRetail\" value=\"<spring:message code='WRD-EXPORT' text='Export' />\" class=\"button special fit\" /></li>";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnExcelImportRetail\" id=\"btnExcelImportRetail\" value=\"Import\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        tblHtml += "<tr><td colspan=\"10\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
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

var strClickEventNm  = "";
strClickEventNm += "#btnApply, #btnExcelExportRetail, #btnIntroductionView, #btnRetailView";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
    if (id === "btnApply") {
        fn_apply();
    } else if (id === "btnExcelExportRetail") {
        fn_excelExport("retail");
    } else if (id === "btnRetailView") {
    	$("#divIntroductionView").hide();
    	fn_makeDivBtn("btnRetailView");
    	fn_getSearchOptions("MA_PURCHASE");
        fn_getRetail(1);
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
                fn_getRetail(1);
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
                fn_getRetail(1);
            }
        } else {
            //$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
        }
    } else if (id === "cbSearch3") {
        if (val != null && val != "" && val != "undefined" && val != "00") {
            if ($("#keyword3").val() != null && $("#keyword3").val() != "" && $("#keyword3").val() != "undefined") {
            	fn_getRetail(1);
            }
        }
    }
    
    if (id === "andSearch") {
        $(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-AND' text='AND' /></h2>");
        fn_getRetail(1);
    } else if (id === "orSearch") {
        $(".clsConcat").html("");
        $(".clsConcat").html("<h2><spring:message code='WRD-OR' text='OR' /></h2>");
        fn_getRetail(1);
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
                fn_getRetail(1);
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
            fn_getRetail(1);
        }
    } else if (id === "keyword2") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch2").val() != null && $("#cbSearch2").val() != "" && $("#cbSearch2").val() != "undefined" && $("#cbSearch2").val() != "00") {
                //$("#cbSearch3").removeAttr("disabled");
                //$("#keyword3").removeAttr("readonly");
                fn_getRetail(1);
            } else {
                //$("#cbSearch3").attr("disabled", "disabled");
                //$("#keyword3").attr("readonly", "readonly");
            }
        } else {
            //$("#cbSearch3").attr("disabled", "disabled");
            //$("#keyword3").attr("readonly", "readonly");
            fn_getRetail(1);
        }
    } else if (id === "keyword3") {
        if (val != null && val != "" && val != "undefined") {
            if ($("#cbSearch3").val() != null && $("#cbSearch3").val() != "" && $("#cbSearch3").val() != "undefined" && $("#cbSearch3").val() != "00") {
            	fn_getRetail(1);
            }
        } else {
        	fn_getRetail(1);
        }
    }
});

function fn_apply() {
    var param = "";
    param += "applicationSeq=1";
    gf_send("<c:url value='/applications/requestForApproval' />", param, "fn_applyCallback");
}

function fn_applyCallback(data) {
    gfn_layerPopup(data.msg);
    
    if (data.flag === "success") {
        fn_getApplicationMap();
    }
}

function fn_getRetail(pageNo) {
    var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getRetail";
    param += fn_makeSearchParam();
    
    gf_send("<c:url value='/apps/retail/getRetail' />", param, "fn_getRetailCallback");
}

function fn_getRetailCallback(data) {
	var list = data.retailList;
    var def = data.retailDef;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblApplicationDataWithRetail(list, paginationHtml, def);
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
</script>
</body>
</html>