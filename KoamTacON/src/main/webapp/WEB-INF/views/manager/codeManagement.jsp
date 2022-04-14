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
    <title>System Management - KoamTacON</title>
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
        <%@ include file="../include/header_admin.jsp" %>
        <div class="inner">
            
            <section>
                <header class="main">
                    <h2>New Code Management</h2>
                </header>
                
                <h4>Filters</h4>
                <div class="row">
                    <div class="4u 12u$(small)">
                        <input type="text" name="sCodeName" id="sCodeName" value="" placeholder="Code Name"/> 
                    </div>
                    <div class="4u 12u$(small)">
                        <input type="text" name="sTableName" id="sTableName" value="" placeholder="Table Name"/> 
                    </div>
                    <div class="4u 12u$(small)">
                        <input type="text" name="sColumnName" id="sColumnName" value="" placeholder="Column Name"/> 
                    </div>
                </div>
                <br/>
                
                <section>
	                <div class="row">
	                    <div class="7u 12u$(medium)">
	                        <h3>Code Master</h3>
	                        
	                        <div id="tblCodeMasterList" class="table-wrapper">
                                <input type="hidden" name="sMasterCode" id="sMasterCode" value="" />
                                <input type="hidden" name="sRowNo" id="sRowNo" value="" />
	                            <table class="alt">
	                                <thead style="text-align:center;font-size:0.8em;">
	                                    <tr>
	                                        <td>Code</td>
	                                        <td>Name</td>
	                                        <td>Table</td>
	                                        <td>Column</td>
	                                        <td>Description</td>
	                                        <td>Usable</td>
	                                        <td>Edit</td>
	                                    </tr>
	                                </thead>
	                                <tbody style="text-align:center;font-size:0.7em;">
	                                    <tr>
	                                        <td colspan="7" style="text-align:center;">There is no data.</td>
	                                    </tr>
	                                </tbody>
	                                <tfoot style="font-size:0.8em;">
			                            <tr><td colspan="7" style="text-align:center;" id="tdPaginationMaster"></td></tr>
			                            <tr>
			                                <td colspan="7" style="text-align:right;" id="tdButtonMaster">
			                                    <ul class="actions">
			                                        <li><input type="button" name="btnNewCodeMaster" id="btnNewCodeMaster" value="New" class="button small special" /></li>
			                                    </ul>
			                                </td>
			                            </tr>
			                        </tfoot>
	                            </table>
	                        </div>
	                    </div>
	                    <div class="5u 12u$(medium)">
	                        <h3>Code Detail</h3>
	                        <div id="tblCodeDetailList" class="table-wrapper">
	                            <table class="alt">
	                                <thead style="text-align:center;font-size:0.8em;">
	                                    <tr>
	                                        <td width="10%">Code</td>
	                                        <td width="20%">Name</td>
	                                        <td>Description</td>
	                                        <td width="10%">Order</td>
	                                        <td width="10%">Usable</td>
	                                    </tr>
	                                </thead>
	                                <tbody style="text-align:center;font-size:0.7em;">
	                                    <tr>
	                                        <td colspan="5" style="text-align:center;">There is no data.</td>
	                                    </tr>
	                                </tbody>
	                                <tfoot style="font-size:0.8em;">
	                                    <tr><td colspan="5" style="text-align:center;" id="tdPaginationDetail">There is no data.</td></tr>
	                                    <tr>
	                                        <td colspan="5" style="text-align:right;" id="tdButtonDetail">
	                                            <ul class="actions">
	                                                <li><input type="button" name="btnNewCodeDetail" id="btnNewCodeDetail" value="New" class="button small special" /></li>
                                                </ul>
	                                        </td>
	                                    </tr>
                                    </tfoot>
	                            </table>
	                        </div>
	                    </div>
	                </div>
                </section>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Code Master popup layer -->
<div id="dim-layer-code-master" class="dim-layer">
    <div id="dimBgCodeMaster" class="dimBg"></div>
    <div id="code-master-layer" class="popcont-layer" style="max-width:400px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="codeMasterDiv">
                    <form id="frmCodeMasterPop" method="post">
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="text" name="masterCode" id="masterCode" value="" placeholder="Master Code" required="required" maxlength="50" />
                                <input type="hidden" name="flagDupeChk" id="flagDupeChk" value="false" />
                                <input type="hidden" name="flagSave" id="flagSave" value="" />
                            </div>
                            <div id="divBtnDupeChk" class="12u 12u$(small)">
                                <input type="button" name="btnDupeChk" id="btnDupeChk" value="Duplication Check" class="button fit small"/>
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="masterCodeName" id="masterCodeName" value="" placeholder="Master Code Name" required="required" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="tableName" id="tableName" value="" placeholder="Table Name" maxlength="100" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="columnName" id="columnName" value="" placeholder="Column Name" maxlength="100" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="description" id="description" value="" placeholder="Description" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <div class="select-wrapper">
                                    <select id="cbUseYn" name="cbUseYn">
                                      <option value=""> -- select -- </option>
                                      <option value="Y">Yes</option>
                                      <option value="N">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnSaveCodeMaster" id="btnSaveCodeMaster" value="Save" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeCodeMasterPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Code Detail popup layer -->
<div id="dim-layer-code-detail" class="dim-layer">
    <div id="dimBgCodeDetail" class="dimBg"></div>
    <div id="code-detail-layer" class="popcont-layer" style="max-width:400px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="codeDetailDiv">
                    <form id="frmCodeDetailPop" method="post">
                        <input type="hidden" name="dMasterCode" id="dMasterCode" value="false" />
                        <input type="hidden" name="dFlagSave" id="dFlagSave" value="false" />
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="text" name="code" id="code" value="" placeholder="Detail Code" required="required" maxlength="50" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="codeName" id="codeName" value="" placeholder="Code Name" required="required" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="dDescription" id="dDescription" value="" placeholder="Description" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="codeOrder" id="codeOrder" value="" placeholder="Code Order" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <div class="select-wrapper">
                                    <select id="cbDUseYn" name="cbDUseYn">
                                      <option value=""> -- select -- </option>
                                      <option value="Y">Yes</option>
                                      <option value="N">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnSaveCodeDetail" id="btnSaveCodeDetail" value="Save" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeCodeDetailPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.systemMgmt');
    
    fn_getCodeMasterList(1);
});

var strInputEventNm  = "";
strInputEventNm += "#sCodeName, #sTableName, #sColumnName";
// mouse click event
$(document).on("input", strInputEventNm, function(e){
    e.preventDefault();

    fn_getCodeMasterList(1);
});

function fn_getCodeMasterList(pageNo) {
	var param = "";
	param += "sCodeName="+$("#sCodeName").val();
	param += "&";
	param += "sTableName="+$("#sTableName").val();
	param += "&";
	param += "sColumnName="+$("#sColumnName").val();
	param += "&";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getCodeMasterList";
	
	gf_send("<c:url value='/admin/systemManagement/getCodeMasterList' />", param, "fn_getCodeMasterListCallback");
}

function fn_getCodeMasterListCallback(data) {
	var codeMasterList = data.codeMasterList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblCodeMasterList(codeMasterList, paginationHtml);
}

function fn_makeTblCodeMasterList(codeMasterList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = paginationHtml;

	if (codeMasterList != null && codeMasterList.length > 0) {
		for(var i=0; i<codeMasterList.length; i++) {
			bodyHtml += "<tr id=\"trCodeMaster-"+i+"\">";
			bodyHtml += "    <td id=\"tdCodeMasterMasterCode-"+i+"\">"+gfn_nullValue(codeMasterList[i].masterCode)+"</td>";
			bodyHtml += "    <td id=\"tdCodeMasterMasterCodeName-"+i+"\">"+gfn_nullValue(codeMasterList[i].masterCodeName)+"</td>";
			bodyHtml += "    <td id=\"tdCodeMasterTableName-"+i+"\">"+gfn_nullValue(codeMasterList[i].tableName)+"</td>";
			bodyHtml += "    <td id=\"tdCodeMasterColumnName-"+i+"\">"+gfn_nullValue(codeMasterList[i].columnName)+"</td>";
			bodyHtml += "    <td id=\"tdCodeMasterDescription-"+i+"\" style=\"text-align:left;\">"+gfn_nullValue(codeMasterList[i].description)+"</td>";
			bodyHtml += "    <td id=\"tdCodeMasterUseYn-"+i+"\">"+gfn_nullValue(codeMasterList[i].useYn)+"</td>";
			bodyHtml += "    <td id=\"tdCodeMasterBtn-"+i+"\"><input type=\"button\" id=\"btnCodeMasterBtn-"+i+"\" value=\"Edit\" class=\"button small special\" /></td>";
			bodyHtml += "</tr>";
		}
	} else {
		bodyHtml += "<tr><td colspan=\"7\" style=\"text-align:center;\">There is no data.</td></tr>";
	}
	
	$("#tblCodeMasterList tbody").html(bodyHtml);
	$("#tblCodeMasterList tfoot #tdPaginationMaster").html(pageHtml);
	
	$("#sMasterCode").val("");
    fn_getCodeDetailList(1);
}

$(document).on("click", "#tblCodeMasterList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    $("#sRowNo").val(no);
    for(var i=0; i<$("#tblCodeMasterList tbody tr").length; i++) {
        if (!$("#btnCodeMasterBtn-"+i).hasClass("special")) {
            $("#btnCodeMasterBtn-"+i).toggleClass("special");
        }
    }
    $("#btnCodeMasterBtn-"+no).toggleClass("special");
    
    if (sId === "tdCodeMasterBtn") {
    	fn_codeMasterEditPop(no);
    } else {
    	$("#sMasterCode").val($("#tdCodeMasterMasterCode-"+no).text());
    	fn_getCodeDetailList(1);
    }
});

function fn_getCodeDetailList(pageNo) {
	var param = "";
    param += "masterCode="+$("#sMasterCode").val();
    param += "&";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getCodeDetailList";
    
    gf_send("<c:url value='/admin/systemManagement/getCodeDetailList' />", param, "fn_getCodeDetailListCallback");
}

function fn_getCodeDetailListCallback(data) {
	var codeDetailList = data.codeDetailList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblCodeDetailList(codeDetailList, paginationHtml);
}

function fn_makeTblCodeDetailList(codeDetailList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	
    if (codeDetailList != null && codeDetailList.length > 0) {
        for(var i=0; i<codeDetailList.length; i++) {
            bodyHtml += "<tr id=\"trCodeDetail-"+i+"\">";
            bodyHtml += "    <td id=\"tdCodeDetailCode-"+i+"\">"+gfn_nullValue(codeDetailList[i].code)+"</td>";
            bodyHtml += "    <td id=\"tdCodeDetailCodeName-"+i+"\">"+gfn_nullValue(codeDetailList[i].codeName)+"</td>";
            bodyHtml += "    <td id=\"tdCodeDetailDescription-"+i+"\" style=\"text-align:left;\">"+gfn_nullValue(codeDetailList[i].description)+"</td>";
            bodyHtml += "    <td id=\"tdCodeDetailCodeOrder-"+i+"\">"+codeDetailList[i].codeOrder+"</td>";
            bodyHtml += "    <td id=\"tdCodeDetailUseYn-"+i+"\">"+gfn_nullValue(codeDetailList[i].useYn)+"</td>";
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
    } else {
        bodyHtml += "<tr><td colspan=\"5\" style=\"text-align:center;\">There is no data.</td></tr>";
    }
    
    $("#tblCodeDetailList tbody").html(bodyHtml);
    $("#tblCodeDetailList tfoot #tdPaginationDetail").html(pageHtml);
}

$(document).on("click", "#tblCodeDetailList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    fn_codeDetailEditPop(no);
});

function fn_codeDetailEditPop(no) {
	gfn_clearForm("frmCodeDetailPop");
	
    if (!$("#sMasterCode").val()) {
    	return false;
    }
    
	$("#dMasterCode").val($("#sMasterCode").val());
    $("#code").val($("#tdCodeDetailCode-"+no).text());
    $("#codeName").val($("#tdCodeDetailCodeName-"+no).text());
    $("#dDescription").val($("#tdCodeDetailDescription-"+no).text());
    $("#codeOrder").val($("#tdCodeDetailCodeOrder-"+no).text());
    $("#cbDUseYn").val($("#tdCodeDetailUseYn-"+no).text());
    $("#cbDUseYn option:eq("+$("#tdCodeDetailUseYn-"+no).text()+")").attr('selected', 'selected');
    
    $("#dFlagSave").val("U");
    $("#code").attr("readonly", true);
    gfn_customLayerPopup('dim-layer-code-detail', 'dimBgCodeDetail', 'code-detail-layer', 'closeCodeDetailPopup');
}

var strClickEventNm  = "";
strClickEventNm += "#btnNewCodeMaster, #btnNewCodeDetail, #btnSaveCodeMaster, #btnSaveCodeDetail, #btnDupeChk";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnNewCodeMaster") {
    	fn_codeMasterNewPop();
    } else if (args[0] === "btnDupeChk") {
        fn_checkCodeMasterDuplication();
    } else if (args[0] === "btnSaveCodeMaster") {
        fn_saveCodeMaster();
    } else if (args[0] === "btnNewCodeDetail") {
    	fn_codeDetailNewPop();
    } else if (args[0] === "btnSaveCodeDetail") {
    	fn_saveCodeDetail();
    }
}

function fn_codeMasterNewPop() {
	gfn_clearForm("frmCodeMasterPop");
	$("#flagSave").val("I");
	$("#masterCode").attr("readonly", false);
	$("#divBtnDupeChk").show();
	gfn_customLayerPopup('dim-layer-code-master', 'dimBgCodeMaster', 'code-master-layer', 'closeCodeMasterPopup');
}

function fn_checkCodeMasterDuplication() {
	if (!$("#masterCode").val()) {
		gfn_layerPopup("Master code is required!", "masterCode");
		$("#flagDupeChk").val("false");
		return false;
	}
	
	var param = "";
	param += "masterCode="+$("#masterCode").val();
	gf_send("<c:url value='/admin/systemManagement/checkCodeMasterDuplication' />", param, "fn_checkCodeMasterDuplicationCallback");
}

function fn_checkCodeMasterDuplicationCallback(data) {
	if (data.flag === 0) {
		$("#flagDupeChk").val("true");
		gfn_layerPopup("Code is available.");
	} else {
		$("#flagDupeChk").val("false");
		gfn_layerPopup("Code is duplicated.");
	}
}

function fn_saveCodeMaster() {
	var frmId = "frmCodeMasterPop";

	if (gfn_checkRequired(frmId) === true) {
		if ($("#flagSave").val() === "I") {
			if ($("#flagDupeChk").val() === "true") {
				gf_sendForm(frmId, "<c:url value='/admin/systemManagement/insertCodeMaster' />", "fn_saveCodeMasterCallback");
				fn_getCodeDetailList(1);
			} else {
				gfn_layerPopup("Please check code duplication.");
			}
		} else if ($("#flagSave").val() === "U") {
			gf_sendForm(frmId, "<c:url value='/admin/systemManagement/updateCodeMaster' />", "fn_saveCodeMasterCallback");
		}
	}
}

function fn_saveCodeMasterCallback(data) {
	gfn_layerPopup(data.msg);
	if (data.flag === "success") {
		fn_getCodeMasterList(1);
		$('#dim-layer-code-master').fadeOut();
	}
}

function fn_codeMasterEditPop(no) {
	$("#sMasterCode").val($("#tdCodeMasterMasterCode-"+no).text());
	
	if (!$("#sMasterCode").val()) {
        gfn_layerPopup("Please select a row from code master list to edit.");
        return false;
    }
	
	$("#masterCode").val($("#sMasterCode").val());
    $("#masterCodeName").val($("#tdCodeMasterMasterCodeName-"+no).text());
    $("#tableName").val($("#tdCodeMasterTableName-"+no).text());
    $("#columnName").val($("#tdCodeMasterColumnName-"+no).text());
    $("#description").val($("#tdCodeMasterDescription-"+no).text());
    $("#cbUseYn").val($("#tdCodeMasterUseYn-"+no).text());
    $("#cbUseYn option:eq("+$("#tdCodeMasterUseYn-"+no).text()+")").attr('selected', 'selected');
    
    $("#flagSave").val("U");
    $("#masterCode").attr("readonly", true);
    $("#divBtnDupeChk").hide();
    $("#flagDupeChk").val("true");
    gfn_customLayerPopup('dim-layer-code-master', 'dimBgCodeMaster', 'code-master-layer', 'closeCodeMasterPopup');
}


function fn_codeDetailNewPop() {
	if (!$("#sMasterCode").val()) {
        gfn_layerPopup("Please select a row from code master list to edit.");
        return false;
    }
	
	gfn_clearForm("frmCodeDetailPop");
    $("#dFlagSave").val("I");
    $("#dMasterCode").val($("#sMasterCode").val());
    $("#code").attr("readonly", false);
    gfn_customLayerPopup('dim-layer-code-detail', 'dimBgCodeDetail', 'code-detail-layer', 'closeCodeDetailPopup');
}

function fn_saveCodeDetail() {
	var frmId = "frmCodeDetailPop";

    if (gfn_checkRequired(frmId) === true) {
        if ($("#dFlagSave").val() === "I") {
            gf_sendForm(frmId, "<c:url value='/admin/systemManagement/insertCodeDetail' />", "fn_saveCodeDetailCallback");
        } else if ($("#dFlagSave").val() === "U") {
            gf_sendForm(frmId, "<c:url value='/admin/systemManagement/updateCodeDetail' />", "fn_saveCodeDetailCallback");
        }
    }
}

function fn_saveCodeDetailCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getCodeDetailList(1);
		$('#dim-layer-code-detail').fadeOut();
	}
}
</script>
</body>
</html>