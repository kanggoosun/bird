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
    <title><spring:message code='MENU-MEMBERMANAGEMENT' text='Member Management' /> - KoamTacON</title>
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
                    <h2><spring:message code='MENU-MEMBERMANAGEMENT' text='Member Management' /></h2>
                </header>
                
                <div id="divMessage" style="text-align:center;"></div>
                
                <h3><spring:message code='WRD-MEMBS' text='Members' /></h3>
                <div id="divMessage2" class="abox"></div>
                <br>
                <div class="table-wrapper">
                    <table id="tblGroupMember" class="alt">
                        <thead>
                            <tr>
                                <th width="25%" style="text-align:center;"><spring:message code='WRD-USERID' text='User ID' /></th>
                                <th width="25%" style="text-align:center;"><spring:message code='WRD-NAME' text='Name' /></th>
                                <th width="25%" style="text-align:center;"><spring:message code='WRD-EMAIL' text='Email' /></th>
                                <th width="25%" style="text-align:center;"><spring:message code='WRD-CREATDT' text='Creation date' /></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr><td colspan="4" style="text-align:center;" id="tdPagination"></td></tr>
                            <tr><td colspan="4" style="text-align:right;" id="tdButton"></td></tr>
                        </tfoot>
                    </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Group Creation popup layer -->
<div id="dim-layer-cont" class="dim-layer">
    <div id="dimBgCont" class="dimBg"></div>
    <div id="content_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="contentDiv" >
                    <form id="frmPop" method="post">
                        <div class="row uniform">
                            <div class="12u 12u$">
                                <spring:message code='MSG-VW045' text='Please enter a group name.' />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="groupName" id="groupName" value="" required="required" placeholder="<spring:message code='WRD-GRPNM' text='Group name' />" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnGroupCreation" id="btnGroupCreation" value="<spring:message code='WRD-CREATE' text='Create' />" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeContentPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add member popup layer -->
<div id="dim-layer-add-member" class="dim-layer">
    <div id="dimBgAddMember" class="dimBg"></div>
    <div id="member_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="memberDiv" >
                    <form id="frmAddMember" method="post">
                        <div class="row uniform">
                            <div class="12u 12u$">
                                <spring:message code='MSG-VW046' text="Please enter a member's information." />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="memberName" id="memberName" value="" required="required" placeholder="*<spring:message code='WRD-MEMBNM' text='Member name' />(<spring:message code='WRD-MANDAT' text='Mandatory' />)" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <input type="email" name="memberEmail" id="memberEmail" value="" required="required" placeholder="*<spring:message code='WRD-MEMBEML' text='Member email' />(<spring:message code='WRD-MANDAT' text='Mandatory' />)" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="memberPhone" id="memberPhone" value="" placeholder="<spring:message code='WRD-MEMBPNO' text='Member phone number' />" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnAddMember" id="btnAddMember" value="<spring:message code='WRD-CREATE' text='Create' />" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeAddMemberPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
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
                                <input type="file" name="excelFile" id="excelFile" value="" required="required" placeholder="<spring:message code='WRD-ENTEXL' text='Enter excel' />" maxlength="200" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnExcelUpload" id="btnExcelUpload" value="<spring:message code='WRD-REG' text='Register' />" class="button special small fit" /></li>
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

<div id="mloader"><div class="masterkey_blink"><spring:message code='WRD-INPRGRS' text='In Progress' /> ...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvExistGroup = -1;
var gvApprovalCnt = 0;
var gvGroupUseYn = '';
$(document).ready(function(){
	fn_getGroupInfo();
});

function fn_getGroupInfo(pageNo) {
	var param = "";
	gvGroupUseYn = '';
    gf_send("<c:url value='/group/getGroupInfo' />", param, "fn_getGroupInfoCallback");
}

function fn_getGroupInfoCallback(data) {
	gvApprovalCnt = data.approvalCnt;
	
    if (gvApprovalCnt <= 0) {
    	var msg = "";
    	msg += "<p>First, register your KDC from the <a href=\"<c:url value='/kdc/registrationInfo' />\">[KDC Registration]</a> Menu.<br>";
    	msg += "<spring:message code='MSG-VW048' text='Please wait if you have already registered.' /> <spring:message code='MSG-VW049' text='Administrator is working on it.' /></p>";
		$("#divMessage").html("");
        $("#divMessage").html(msg);
        $("#divMessage").addClass("");
	}
    
	fn_getMemberList(1);
}

function fn_getMemberList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getMemberList";
    
    gf_send("<c:url value='/group/getMemberList' />", param, "fn_getMemberListCallback");
}

function fn_getMemberListCallback(data) {
	var memberList = data.memberList;
	var memberLimit = data.memberLimit;
	var memberCnt = data.memberCnt;
	var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeMemberTable(memberList, memberLimit, memberCnt, paginationHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnPopAddMember, #btnAddMember, #btnExcelDownload, #btnExcelRegistration, #btnExcelUpload";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

//key press event
var strKeypressEventNm  = "";
strKeypressEventNm += "#groupName, #memberName, #memberEmail";
$(document).on("keypress", strKeypressEventNm, function(e){
    var id = $(this).attr("id");
    
    if(e.keyCode == 13){
    	if (id === "groupName"){
    		return false;
    	} else {
    		fn_eventCallFunction(id);
    	}
    }
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnPopAddMember") {
    	gfn_clearForm("frmAddMember");
        fn_layerMemberPopup();
    } else if (args[0] === "btnAddMember") {
        fn_addMember();
    } else if (args[0] === "btnExcelDownload") {
        fn_excelDownload();
    } else if (args[0] === "btnExcelRegistration") {
    	fn_excelPopup();
    } else if (args[0] === "btnExcelUpload") {
    	fn_excelRegistration();
    }
    
    else if (args[0] === "memberName") {
    	$("#memberEmail").focus();
    } else if (args[0] === "memberEmail") {
    	return false;
    }
}

function fn_layerContentPopup(){
	gfn_customLayerPopup('dim-layer-cont', 'dimBgCont', 'content_layer', 'closeContentPopup');
}

function fn_layerMemberPopup(){
	gfn_customLayerPopup('dim-layer-add-member', 'dimBgAddMember', 'member_layer', 'closeAddMemberPopup');
};

function fn_makeTblGroupInfo(groupList, approvalCnt) {
    var bodyHtml = "";
    var footHtml = "";
    
    if (groupList != null && groupList.length > 0) {
    	bodyHtml += "<tr>";
        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(groupList[0].groupName) +"</td>";
        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(groupList[0].groupCode) +"</td>";
        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(groupList[0].ownerId) +"</td>";
        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(groupList[0].ownerName) +"</td>";
        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(groupList[0].ownerCompany) +"</td>";
        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(groupList[0].creationDate) +"</td>";
        bodyHtml += "</tr>";
    } else {
    	bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"6\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td>";
        bodyHtml += "</tr>";
        
        if (approvalCnt > 0) {
	        footHtml += "<tr>";
	        footHtml += "    <td colspan=\"6\" style=\"text-align:right;\">";
	        footHtml += "        <input type=\"button\" name=\"btnPopGrpCreation\" id=\"btnPopGrpCreation\" value=\"<spring:message code='WRD-GRPCREAT' text='Group Creation' />\" class=\"button special small\" />";
	        footHtml += "    </td>";
	        footHtml += "</tr>";
	        $("#divMessage").html("");
        } else {
        	var msg = "";
            msg += "<p><spring:message code='MSG-VW047' text='First, register your KDC from the' /> <a href=\"<c:url value='/kdc/registrationInfo' />\">[<spring:message code='WRD-KDCREG' text='KDC Registration' />]</a> <spring:message code='MENU-MENU' text='Menu' />.<br>";
            msg += "<spring:message code='MSG-VW048' text='Please wait if you have already registered.' /> <spring:message code='MSG-VW049' text='Administrator is working on it.' /></p>";
            $("#divMessage").html("");
            $("#divMessage").html(msg);
            $("#divMessage").addClass("");
        }
    }
    
    $("#tblGroupInfo tbody").html(bodyHtml);
    $("#tblGroupInfo tfoot").html(footHtml);
}

function fn_addMember() {
	var frmId = "frmAddMember";
	
	if (gfn_checkRequired(frmId) === true) {
    	if (gfn_checkFormat(frmId) == true) {
    		$("#mloader").css("display", "block");
            gf_sendForm(frmId, "<c:url value='/group/addMember' />", "fn_addMemberCallback");
            $('#dim-layer-add-member').fadeOut();
    	}
    }
}

function fn_addMemberCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
	if (data.flag === "success") {
    	fn_getMemberList(1);
    }
}

function fn_makeMemberTable(memberList, memberLimit, memberCnt, paginationHtml) {
	var bodyHtml = "";
    var pageHtml = "";
    var btnHtml = "";
    var msgHtml = "";
    var addableCnt = memberLimit - memberCnt;
    
    if (memberList != null && memberList.length > 0) {
    	for(var i=0; i<memberList.length; i++) {
	        bodyHtml += "<tr>";
	        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(memberList[i].memberId) +"</td>";
	        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(memberList[i].memberName) +"</td>";
	        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(memberList[i].memberEmail) +"</td>";
	        bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(memberList[i].memberCreationDate) +"</td>";
	        bodyHtml += "</tr>";
	    }
	    pageHtml = paginationHtml;
	    
	    if (memberCnt < memberLimit) {
	    	btnHtml += "<ul class=\"actions\">";
	    	btnHtml += "    <li><input type=\"button\" name=\"btnExcelDownload\" id=\"btnExcelDownload\" value=\"<spring:message code='WRD-EXLTMLDWN' text='Excel template download' />\" class=\"button special small\" /></li>";
	    	btnHtml += "    <li><input type=\"button\" name=\"btnExcelRegistration\" id=\"btnExcelRegistration\" value=\"<spring:message code='WRD-MEMBREGEXL' text='Member registration with excel' />\" class=\"button special small\" /></li>";
	    	btnHtml += "    <li><input type=\"button\" name=\"btnPopAddMember\" id=\"btnPopAddMember\" value=\"<spring:message code='WRD-ADDMEMB' text='Add member' />\" class=\"button special small\" /></li>";
	    	btnHtml += "</ul>";
	    	
	    	msgHtml += "<ul>";
	    	msgHtml += "    <li><spring:message code='MSG-VW050' text='You can add member ID(s).' arguments='"+addableCnt+"' /></li>";
	    	msgHtml += "    <li><spring:message code='MSG-VW051' text='You can add as many member IDs as you have registered and approved KDC.' /></li>";
	    	msgHtml += "</ul>";
	    } else {
	    	msgHtml += "<ul>";
            msgHtml += "    <li><spring:message code='MSG-VW072' text='You cannot add a member ID anymore.' /></li>";
            msgHtml += "    <li><spring:message code='MSG-VW051' text='You can add as many member IDs as you have registered and approved KDC.' /></li>";
            msgHtml += "</ul>";
	    }
    } else {
    	if (gvApprovalCnt > 0) {
    		if (gvGroupUseYn == '') {
	    		bodyHtml += "<tr><td colspan=\"4\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
	            msgHtml += "<ul>";
	            msgHtml += "    <li><spring:message code='MSG-VW052' text='The administrator is working on a related task.' /></li>";
	            msgHtml += "    <li><spring:message code='MSG-VW053' text='Once the task is finished, You can add as many member IDs as you have registered and approved KDC.' /></li>";
	            msgHtml += "</ul>";
    		} else if (gvGroupUseYn == 'N') {
    			bodyHtml += "<tr><td colspan=\"4\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
                msgHtml += "<ul>";
                msgHtml += "    <li><spring:message code='MSG-VW054' text='Your group is inactive.' /></li>";
                msgHtml += "    <li><spring:message code='MSG-VW055' text='You can only manage members when the group is active.' /></li>";
                msgHtml += "</ul>";
    		}
    	} else {
	    	bodyHtml += "<tr><td colspan=\"4\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
	    	msgHtml += "<ul>";
	        msgHtml += "    <li><spring:message code='MSG-VW056' text='You cannot add a member ID.' /></li>";
	        msgHtml += "    <li><spring:message code='MSG-VW053' text='You can add as many member IDs as you have registered and approved KDC.' /></li>";
	        msgHtml += "</ul>";
    	}
    }
    
    $("#tblGroupMember tbody").html(bodyHtml);
    $("#tblGroupMember tfoot #tdPagination").html(pageHtml);
    $("#tblGroupMember tfoot #tdButton").html(btnHtml);
    
    $("#divMessage2").html("");
    $("#divMessage2").html(msgHtml);
}

function fn_excelDownload() {
    var param = "";
    param += "flag="+"template";
    param += "&";
    param += "filename="+"Template_Member_Registration.xlsx";
    
    gf_genFileDownLoad(param);
}

function fn_excelPopup() {
    $("#excelFile").val("");
    
    gfn_customLayerPopup('dim-layer-excel', 'dimBgExcel', 'excel_layer', 'closeExcelPopup');
}

function fn_excelRegistration() {
    var frmId = "frmExcel";

    if (gfn_checkRequired(frmId) === true) {
        $('#dim-layer-excel').fadeOut();
        $("#mloader").css("display", "block");
        gf_sendFileForm(frmId, "<c:url value='/group/addMemberWithExcel' />", "fn_excelRegistrationCallback");
    }
}

function fn_excelRegistrationCallback(data) {
	$("#mloader").css("display", "none");
    gfn_layerPopup(data.msg);
    if (data.flag === "success") {
    	fn_getMemberList(1);
    }
}

</script>
</body>
</html>