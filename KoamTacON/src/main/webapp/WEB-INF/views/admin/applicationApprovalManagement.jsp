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
    <title>Approval Management - KoamTacON</title>
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
                    <h2>Request for Application use</h2>
                </header>
                
                <div id="divBtn"></div>
                
                <div id="tblApprovalList" class="table-wrapper">
                    <table class="alt">
                        <thead>
                            <tr>
                                <th width="10%" style="text-align:center;">User Name</th>
                                <th width="15%" style="text-align:center;">Target</th>
                                <th width="20%" style="text-align:center;">Request date</th>
                                <th width="10%" style="text-align:center;">Approval</th>
                                <th style="text-align:center;">Comment</th>
                            </tr>
                        </thead>
                        <tbody style="font-size:0.8em;text-align:center;">
                            <tr>
                                <td colspan="5">There is no data.</td>
                            </tr>
                        </tbody>
                        <tfoot style="font-size:0.8em;">
                            <tr><td colspan="5" style="text-align:center;" id="tdPagination"></td></tr>
                        </tfoot>
                    </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Approval popup layer -->
<div id="dim-layer-approval" class="dim-layer">
    <div id="dimBgApproval" class="dimBg"></div>
    <div id="approval_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="approvalDiv" >
                    <form id="frmApproval" method="post">
                        <input type="hidden" id="userId" name="userId" value="">
                        <input type="hidden" id="requestType" name="requestType" value="">
                        <input type="hidden" id="requestKind" name="requestKind" value="">
                        <input type="hidden" id="requestTarget" name="requestTarget" value="">
                        <input type="hidden" id="groupCode" name="groupCode" value="">
                        <div class="row uniform">
                            <div class="12u 12u$">
                                <div class="select-wrappecr">
                                    <select id="cbApprovalFlag" name="cbApprovalFlag">
                                        <c:out value="${cbApprovalFlagOptions}" escapeXml="false" />
                                    </select>
                                </div>
                            </div>
                            <div class="12u 12u$">
                                <textarea name="comment" id="comment" placeholder="Enter your comment" rows="6"></textarea>
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnApproval" id="btnApproval" value="Submit" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeApprovalPopup" class="btn-layerClose">Close</a>
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
    
    gfn_toggleMenu('.approvalMgmt');

    fn_getApprovalList(1);
});

function fn_getApprovalList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getApprovalList";
    
	gf_send("<c:url value='/admin/approvalManagement/getApplicationApprovalList' />", param, "fn_getApprovalListCallback");
}

function fn_getApprovalListCallback(data) {
	var approvalList = data.applicationApprovalList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblApprovalList(approvalList, paginationHtml);
}

function fn_makeTblApprovalList(approvalList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	
	if (approvalList != null && approvalList.length > 0) {
		for(var i=0; i<approvalList.length; i++) {
			bodyHtml += "<tr id=\"trApprovalList-"+i+"\">";
			bodyHtml += "    <td>"+gfn_nullValue(approvalList[i].userName);
			bodyHtml += "        <input type=\"hidden\" id=\"userId-"+i+"\" name=\"userId-"+i+"\" value=\""+gfn_nullValue(approvalList[i].userId)+"\">";
			bodyHtml += "        <input type=\"hidden\" id=\"requestType-"+i+"\" name=\"requestType-"+i+"\" value=\""+gfn_nullValue(approvalList[i].requestType)+"\">";
			bodyHtml += "        <input type=\"hidden\" id=\"requestKind-"+i+"\" name=\"requestKind-"+i+"\" value=\""+gfn_nullValue(approvalList[i].requestKind)+"\">";
			bodyHtml += "        <input type=\"hidden\" id=\"requestTarget-"+i+"\" name=\"requestTarget-"+i+"\" value=\""+gfn_nullValue(approvalList[i].requestTarget)+"\">";
			bodyHtml += "        <input type=\"hidden\" id=\"approvalFlag-"+i+"\" name=\"approvalFlag-"+i+"\" value=\""+gfn_nullValue(approvalList[i].approvalFlag)+"\">";
			bodyHtml += "        <input type=\"hidden\" id=\"comment-"+i+"\" name=\"comment-"+i+"\" value=\""+gfn_nullValue(approvalList[i].comment)+"\">";
			bodyHtml += "        <input type=\"hidden\" id=\"groupCode-"+i+"\" name=\"groupCode-"+i+"\" value=\""+gfn_nullValue(approvalList[i].groupCode)+"\">";
			bodyHtml += "    </td>";
			bodyHtml += "    <td>"+gfn_nullValue(approvalList[i].applicationName)+"</td>";
			bodyHtml += "    <td>"+gfn_nullValue(approvalList[i].requestDate)+"</td>";
			bodyHtml += "    <td>"+gfn_nullValue(approvalList[i].approvalFlagNm)+"</td>";
			bodyHtml += "    <td style=\"text-align:left;\">"+gfn_nullValue(approvalList[i].comment)+"</td>";
			bodyHtml += "</tr>";
		}
		pageHtml = paginationHtml;
	} else {
		bodyHtml += "<tr><td colspan=\"5\">There is no data.</td></tr>";
	}
	
	$("#tblApprovalList tbody").html(bodyHtml);
	$("#tblApprovalList tfoot #tdPagination").html(pageHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnApproval, #tblApprovalList tbody tr";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
	var sId = "";
	var no = "";
	if (id.indexOf("-") > -1) {
		sId = id.split("-")[0];
		no = id.split("-")[1];
	} else {
		sId = id;
	}
	
	if (sId === "trApprovalList") {
		fn_approvalPopup(no);
	} else if (sId === "btnApproval") {
		fn_saveApproval();
	}
}

function fn_approvalPopup(no) {
	gfn_clearForm("frmApproval");
	
	$("#userId").val($("#userId-"+no).val());
	$("#requestType").val($("#requestType-"+no).val());
	$("#requestKind").val($("#requestType-"+no).val());
	$("#requestTarget").val($("#requestTarget-"+no).val());
	$("select[id=cbApprovalFlag]").val($("#approvalFlag-"+no).val());
	$("#comment").val($("#comment-"+no).val());
	$("#groupCode").val($("#groupCode-"+no).val());
	
	gfn_customLayerPopup('dim-layer-approval', 'dimBgApproval', 'approval_layer', 'closeApprovalPopup');
}

function fn_saveApproval() {
	var frmId = "frmApproval";
	
	if ($("#cbApprovalFlag").val() === "3" && $("#comment").val() === "") {
		gfn_layerPopup("Please enter comment for refusal.");
		return false;
	}
	gf_sendForm(frmId, "<c:url value='/admin/approvalManagement/saveApplicationApproval' />", "fn_saveApprovalCallback");
}

function fn_saveApprovalCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getApprovalList(1);
		$('#dim-layer-approval').fadeOut();
	}
}
</script>
</body>
</html>