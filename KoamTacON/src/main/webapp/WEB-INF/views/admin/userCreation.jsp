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
    <title>User Creation</title>
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
                    <h2>User Creation</h2>
                </header>
                
                <ul class="actions">
                    <li><input type="button" name="btnExcelRegistration" id="btnExcelRegistration" value="User Creation with excel" class="button special small" /></li>
                    <li><input type="button" name="btnExcelDownload" id="btnExcelDownload" value="Excel template download" class="button special small" /></li>
                </ul>
                
                <section>
                    <h4>Filters</h4>
                    
                    <form id="frmMainFilter" name="frmMainFilter">
	                    <div class="row">
	                        <div class="2u 12u$(medium) select-wrapper">
	                            <select id="cbSearchField" name="cbSearchField">
	                            	<option value="usr.area">Area</option>
	                                <option value="usr.user_id">Web User ID</option>
	                                <option value="mem.activation_code">Activation Code</option>
	                            </select>
	                        </div>
	                        <div class="2u 12u$(medium)">
	                            <input type="text" name="sKeyword" id="sKeyword" value="" placeholder="keyword"/> 
	                        </div>
	                    </div>
	                </form>
                </section>
                
                <section>
                    <h4>User List</h4>
                    <div id="tblAdminList" class="table-wrapper">
                        <table class="alt">
                            <thead>
                                <tr>
                                    <th style="text-align:center;">Area</th>
                                    <th style="text-align:center;">Web User ID</th>
                                    <th style="text-align:center;">Mobile User Name(ID)</th>
                                    <th style="text-align:center;">Device Code</th>
                                    <th style="text-align:center;">Group Code</th>
                                    <th style="text-align:center;">Activation Code</th>
                                    <th style="text-align:center;">Temporary PWD</th>
                                    <th style="text-align:center;">Creation date</th>
                                </tr>
                            </thead>
                            <tbody style="text-align:center;font-size:0.8em;">
                            </tbody>
                            <tfoot style="font-size:0.8em;">
                                <tr><td colspan="3" style="text-align:center;" id="tdPagination"></td></tr>
                                <tr><td colspan="15" style="text-align:right;" id="tdButton"></td></tr>
                            </tfoot>
                        </table>
                    </div>
                </section>
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
                                <input type="text" name="area" id="area" value="" required="required" placeholder="Enter area" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <input type="file" name="excelFile" id="excelFile" value="" required="required" placeholder="Enter excel" maxlength="200" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnExcelUpload" id="btnExcelUpload" value="Create" class="button special small fit" /></li>
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

<div id="mloader"><div class="masterkey_blink">In progress ...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.userMgmt');
    
    fn_getBatchUserList(1);
});

function fn_getBatchUserList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getBatchUserList";
    
    var searchField = gfn_nullValue($("#cbSearchField").val());
    var sKeyword = gfn_nullValue($("#sKeyword").val());
    if (searchField != "" && sKeyword != "") {
        param += "&";
        param += "cbSearchField="+searchField;
        param += "&";
        param += "sKeyword="+sKeyword;
    }
    
	gf_send("<c:url value='/admin/userManagement/getBatchUserList' />", param, "fn_getBatchUserListCallback");
}

function fn_getBatchUserListCallback(data) {
	var list = data.batchUserList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblAdminList(list, paginationHtml);
}

function fn_makeTblAdminList(list, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	var buttonHtml = "";
	
    if (list != null && list.length > 0) {
    	for(var i=0; i<list.length; i++) {
    		
    		bodyHtml += "<tr>";
    		bodyHtml += "    <td id=\"tdArea-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].area)+"</td>";
    		bodyHtml += "    <td id=\"tdUserId-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].userId)+"</td>";
    		bodyHtml += "    <td id=\"tdMdcId-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].mdcId)+"</td>";
    		bodyHtml += "    <td id=\"tdDeviceCode-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].deviceCode)+"</td>";
    		bodyHtml += "    <td id=\"tdGroupCode-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].groupCode)+"</td>";
    		bodyHtml += "    <td id=\"tdActivationCode-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].activationCode)+"</td>";
    		bodyHtml += "    <td id=\"tdTempPwd-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].tempPwd)+"</td>";
    		bodyHtml += "    <td id=\"tdCreationDate-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].creationDate)+"</td>";
    		bodyHtml += "</tr>";
    	}
    	pageHtml = paginationHtml;
    	
    	buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExport\" id=\"btnExcelExport\" value=\"Export\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
    	bodyHtml += "<tr><td colspan=\"8\" style=\"text-align:center;\">There is no data.</td></tr>";
    }
    
    $("#tblAdminList tbody").html(bodyHtml);
    $("#tblAdminList tfoot #tdPagination").html(pageHtml);
    $("#tblAdminList tfoot #tdButton").html(buttonHtml);
}

$(document).on("change", "#cbSearchField", function(e){
    e.preventDefault();
    
    fn_getBatchUserList(1);
});

$(document).on("input", "#sKeyword", function(e){
    e.preventDefault();
    
    fn_getBatchUserList(1);
});

var strClickEventNm  = "";
strClickEventNm += "#btnExcelRegistration, #btnExcelDownload, #btnExcelExport, #btnExcelUpload";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnExcelRegistration") {
    	fn_excelPopup();
    } else if (args[0] === "btnExcelDownload") {
    	fn_templateDownload();
    } else if (args[0] === "btnExcelExport") {
    	fn_excelExport();
    } else if (args[0] === "btnExcelUpload") {
    	fn_createMobileUserBatch();
    }
}

function fn_excelPopup() {
	$("#area").val("");
	$("#excelFile").val("");
	
	gfn_customLayerPopup('dim-layer-excel', 'dimBgExcel', 'excel_layer', 'closeExcelPopup');
}

function fn_templateDownload() {
    var param = "";
    param += "flag="+"template";
    param += "&";
    param += "filename="+"TemplateForBatchOfUserCreation.xlsx";
    
    gf_genFileDownLoad(param);
}

function fn_excelExport() {
    var param = "";
    param += "filename=batch-user-list";
    
    var searchField = gfn_nullValue($("#cbSearchField").val());
    var sKeyword = gfn_nullValue($("#sKeyword").val());
    if (searchField != "" && sKeyword != "") {
        param += "&";
        param += "cbSearchField="+searchField;
        param += "&";
        param += "sKeyword="+sKeyword;
    }
    
    document.location.href = "/common/excelExport?"+param;
}

function fn_createMobileUserBatch() {
	var frmId = "frmExcel";

	if (gfn_checkRequired(frmId) === true) {
		$('#dim-layer-excel').fadeOut();
		$("#mloader").css("display", "block");
		gf_sendFileForm(frmId, "<c:url value='/admin/userManagement/createMobileUserBatch' />", "fn_createMobileUserBatchCallback");
	}
}

function fn_createMobileUserBatchCallback(data) {
	$("#mloader").css("display", "none");
	
	if (data.flag === "success") {
		fn_getBatchUserList(1);
	}
    gfn_layerPopup(data.msg);
}
</script>
</body>
</html>