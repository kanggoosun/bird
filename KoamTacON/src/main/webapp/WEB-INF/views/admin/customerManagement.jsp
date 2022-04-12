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
    <title>User Management</title>
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
                    <h2>Customer Management</h2>
                </header>
                
                <form id="frmMainFilter" name="frmMainFilter">
                    <div class="row">
                        <div class="2u 12u$(medium) select-wrapper">
                            <select id="cbSearchField" name="cbSearchField">
                                <option value="grp.owner_id">Owner ID</option>
                                <option value="own.name">Owner name</option>
                                <option value="own.company">Company</option>
                                <option value="grp.group_code">Group code</option>
                                <option value="grp.group_name">Group name</option>
                            </select>
                        </div>
                        <div class="2u 12u$(medium)">
                            <input type="text" name="sKeyword" id="sKeyword" value="" placeholder="keyword"/> 
                        </div>
                    </div>
                </form>
                
                <h4>Group List</h4>
                <div id="tblGroupList" class="table-wrapper">
                 <table class="alt">
                     <thead>
                         <tr>
                             <th style="text-align:center;">Code</th>
                             <th style="text-align:center;">Owner(ID/name)</th>
                             <th style="text-align:center;">Company</th>
                             <th style="text-align:center;">Country</th>
                             <th style="text-align:center;" title="Total / Not arrpoved / Approved / Refused">No of KDC</th>
                             <th style="text-align:center;">No of Members</th>
                             <th style="text-align:center;">No of Activation Code</th>
                             <th style="text-align:center;">Creation date</th>
                         </tr>
                     </thead>
                     <tbody style="text-align:center;font-size:0.8em;">
                     </tbody>
                     <tfoot style="font-size:0.8em;">
                      <tr><td colspan="8" style="text-align:center;" id="tdPagination"></td></tr>
                      <tr><td colspan="8" style="text-align:right;" id="tdButton"></td></tr>
                     </tfoot>
                 </table>
                </div>
                
                <h4>Member List</h4>
                <div id="divGroupCode"></div>
                <div id="tblMemberList" class="table-wrapper">
                 <table class="alt">
                     <thead>
                         <tr>
                             <th style="text-align:center;">ID</th>
                             <th style="text-align:center;">Name</th>
                             <th style="text-align:center;">E-mail</th>
                             <th style="text-align:center;">Type</th>
                             <th style="text-align:center;">Area</th>
                             <th style="text-align:center;">Activation code</th>
                             <th style="text-align:center;">Sync user</th>
                             <th style="text-align:center;">Device code</th>
                             <th style="text-align:center;">Creation date</th>
                             <th style="text-align:center;">Send mail</th>
                             <th style="text-align:center;">Change as Member</th>
                         </tr>
                     </thead>
                     <tbody style="text-align:center;font-size:0.8em;">
                     </tbody>
                     <tfoot style="font-size:0.8em;">
                      <tr><td colspan="11" style="text-align:center;" id="tdPagination"></td></tr>
                      <tr><td colspan="11" style="text-align:right;" id="tdButton"></td></tr>
                     </tfoot>
                 </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<div id="mloader"><div class="masterkey_blink">Sending mail...</div></div>

<!-- User Information popup layer -->
<div id="dim-layer-user-info" class="dim-layer">
    <div id="dimBgUserInfo" class="dimBg"></div>
    <div id="user_info_layer" class="popcont-layer 12u$" style="width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="userInfoDiv">
                    <form id="frmUserInfoPop" method="post">
                        <div class="row uniform">
                            <div class="6u 12u$(small)">
                                <input type="text" name="userId" id="userId" value="" placeholder="ID" readonly="readonly"/>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="userName" id="userName" value="" placeholder="Name" readonly="readonly" />
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="groupCode" id="groupCode" value="" placeholder="Group code" readonly="readonly"/>
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="syncUser" id="syncUser" value="" placeholder="SyncUser" maxlength="1000" />
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="deviceCode" id="deviceCode" value="" placeholder="Device Code" readonly="readonly" maxlength="30" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="button" name="btnCheckSyncUser" id="btnCheckSyncUser" value="Check Sync user" class="button small fit" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="hidden" name="activationYn" id="activationYn" value="" />
                                <input type="text" name="activationCode" id="activationCode" value="" placeholder="Activation Code" maxlength="50" />
                            </div>
                            <div class="12u$ 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnSaveMemberInfo" id="btnSaveMemberInfo" value="Save" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeUserInfoPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Change as member popup layer -->
<div id="dim-layer-chg" class="dim-layer">
    <div id="dimBgChg" class="dimBg"></div>
    <div id="chg_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="chglDiv" >
                    <form id="frmChg" method="post">
                        <div class="row uniform">
                        	<div class="12u 12u$">
                                <input type="text" name="chArea" id="chArea" value="" required="required" readonly="readonly" />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="chGroupCode" id="chGroupCode" value="" required="required" placeholder="Enter Group Code" maxlength="3" />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="chUserId" id="chUserId" value="" required="required" readonly="readonly" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnChange" id="btnChange" value="Change" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeChgPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvGroupCode = "";
var gvMemberCount = 0;
$(document).ready(function(){
	fn_getGroupList(1);
});

function fn_getGroupList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getGroupList";
    
    var searchField = gfn_nullValue($("#cbSearchField").val());
    var sKeyword = gfn_nullValue($("#sKeyword").val());
    if (searchField != "" && sKeyword != "") {
        param += "&";
        param += "cbSearchField="+searchField;
        param += "&";
        param += "sKeyword="+sKeyword;
    }
    
    gf_send("<c:url value='/admin/userManagement/getGroupList' />", param, "fn_getGroupListCallback");
}

function fn_getGroupListCallback(data) {
	var groupList = data.groupList;
	var paginationHtml = data.pageInfo.paginationHtml;

    fn_makeTblGroupList(groupList, paginationHtml);
}

function fn_makeTblGroupList(groupList, paginationHtml) {
	var bodyHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    gvGroupCode = "";
    if (groupList != null && groupList.length > 0) {
    	gvGroupCode = gfn_nullValue(groupList[0].groupCode);
        for(var i=0; i<groupList.length; i++) {
            bodyHtml += "<tr>";
            bodyHtml += "    <td id=\"tdGroupCode-"+i+"\">"+gfn_nullValue(groupList[i].groupCode)+"</td>";
            bodyHtml += "    <td id=\"tdOwner-"+i+"\">"+gfn_nullValue(groupList[i].ownerId)+" / "+gfn_nullValue(groupList[i].ownerName)+"</td>";
            bodyHtml += "    <td id=\"tdCompany-"+i+"\">"+gfn_nullValue(groupList[i].company)+"</td>";
            bodyHtml += "    <td id=\"tdCountryName-"+i+"\">"+gfn_nullValue(groupList[i].countryName)+"</td>";
            bodyHtml += "    <td id=\"tdKDCNo-"+i+"\">";
            bodyHtml +=          groupList[i].totalKdc+" / "+groupList[i].notApprovedKdc+" / "+groupList[i].approvedKdc+" / "+groupList[i].refusedKdc;
            bodyHtml += "    </td>";
            bodyHtml += "    <td id=\"tdMemberCnt-"+i+"\">"+groupList[i].memberCnt+"</td>";
            bodyHtml += "    <td id=\"tdActivationCnt-"+i+"\">"+groupList[i].activationCnt+"</td>";
            bodyHtml += "    <td id=\"tdCreationDate-"+i+"\">"+gfn_nullValue(groupList[i].creationDate)+"</td>";
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportGroup\" id=\"btnExcelExportGroup\" value=\"Export\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"8\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblGroupList tbody").html(bodyHtml);
    $("#tblGroupList tfoot #tdPagination").html(pageHtml);
    $("#tblGroupList tfoot #tdButton").html(buttonHtml);
    
    fn_getMemberList(1);
}

$(document).on("click", "#tblGroupList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var no = id.split("-")[1];
    gvGroupCode = $("#tdGroupCode-"+no).text();
    gvMemberCount = $("#tdMemberCnt-"+no).text();
    
    fn_getMemberList(1);
});

function fn_getMemberList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "groupCode="+gvGroupCode;
    param += "&";
    param += "callFunction=fn_getMemberList";
    
    gf_send("<c:url value='/admin/userManagement/getMemberList' />", param, "fn_getMemberListCallback");
}

function fn_getMemberListCallback(data) {
	var memberList = data.memberList;
    var paginationHtml = data.pageInfo.paginationHtml;
    
	fn_makeTblMemberList(memberList, paginationHtml);
}

function fn_makeTblMemberList(memberList, paginationHtml) {
    var bodyHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    var grpCodeHtml = "";
    
    if (memberList != null && memberList.length > 0) {
    	grpCodeHtml = "<h5>Group code: "+gvGroupCode+"</h5>";
        for(var i=0; i<memberList.length; i++) {
        	var activationCode = gfn_nullValue(memberList[i].activationCode);
        	var syncUser = gfn_nullValue(memberList[i].syncUser);
        	var deviceCode = gfn_nullValue(memberList[i].deviceCode);
        	var sendYn = gfn_nullValue(memberList[i].sendYn);
        	var userType = gfn_nullValue(memberList[i].userType);
        	var area = gfn_nullValue(memberList[i].area);
        	var batchYn = gfn_nullValue(memberList[i].batchYn, "N");
        	
        	bodyHtml += "<tr>";
        	bodyHtml += "    <input type=\"hidden\" id=\"userType-"+i+"\" name=\"userType-"+i+"\" value=\""+userType+"\" />";
            bodyHtml += "    <td id=\"tdMemberId-"+i+"\">"+gfn_nullValue(memberList[i].userId)+"</td>";
            bodyHtml += "    <td id=\"tdMemberName-"+i+"\">"+gfn_nullValue(memberList[i].userName)+"</td>";
            bodyHtml += "    <td id=\"tdMemberEMail-"+i+"\">"+gfn_nullValue(memberList[i].userEmail)+"</td>";
            bodyHtml += "    <td id=\"tdType-"+i+"\">"+gfn_nullValue(memberList[i].userTypeNm)+"</td>";
            bodyHtml += "    <td id=\"tdArea-"+i+"\">"+area+"</td>";
            /* Mobile user creation
            if (userType == "1" && activationCode == "" && syncUser == "" && deviceCode == "" && area != "") {
            	bodyHtml += "    <td id=\"tdBtnResist-"+i+"\">";
            	bodyHtml += "        <input type=\"button\" name=\"btnRegistUser-"+i+"\" id=\"btnRegistUser-"+i+"\" value=\"Regist\" class=\"button special small\" />";
            	bodyHtml += "    </td>";
        	} else {
        		bodyHtml += "    <td id=\"tdActivationCode-"+i+"\">"+activationCode+"</td>";
        	}
            */
            bodyHtml += "    <td id=\"tdActivationCode-"+i+"\">"+activationCode+"</td>";
            bodyHtml += "    <td id=\"tdSyncUser-"+i+"\">"+syncUser+"</td>";
            bodyHtml += "    <td id=\"tdDeviceCode-"+i+"\">"+deviceCode+"</td>";
            bodyHtml += "    <td id=\"tdCreationDate-"+i+"\">"+gfn_nullValue(memberList[i].creationDate)+"</td>";
            if (sendYn == 'N' && activationCode != "" && syncUser != "" && deviceCode != "" && batchYn == "N") {
            	bodyHtml += "    <td id=\"tdBtnSend-"+i+"\">";
            	bodyHtml += "        <input type=\"button\" name=\"btnSendMail-"+i+"\" id=\"btnSendMail-"+i+"\" value=\"Send\" class=\"button special small\" />";
            	bodyHtml += "    </td>";
            } else {
            	bodyHtml += "    <td id=\"tdBtnSend-"+i+"\" onclick=\"event.cancelBubble=true;\"></td>";
            }
            if (userType == "0" && gvMemberCount == 1) {
            	bodyHtml += "    <td id=\"tdBtnChgAsMem-"+i+"\">";
            	bodyHtml += "        <input type=\"button\" name=\"btnChgAsMem-"+i+"\" id=\"btnChgAsMem-"+i+"\" value=\"Change\" class=\"button special small\" />";
            	bodyHtml += "    </td>";
            } else {
            	bodyHtml += "    <td id=\"tdBtnChgAsMem-"+i+"\" onclick=\"event.cancelBubble=true;\"></td>";
            }
            
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        //buttonHtml += "    <li><input type=\"button\" name=\"btnSendAll\" id=\"btnSendAll\" value=\"Send mail\" class=\"button special fit\" /></li>";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExportMember\" id=\"btnExcelExportMember\" value=\"Export\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"11\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblMemberList tbody").html(bodyHtml);
    $("#tblMemberList tfoot #tdPagination").html(pageHtml);
    $("#tblMemberList tfoot #tdButton").html(buttonHtml);
    $("#divGroupCode").html(grpCodeHtml);
}

$(document).on("click", "#tblMemberList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];
    
    if (sId == 'tdBtnSend') {
    	fn_sendMail(no);
    } else if (sId == 'tdBtnChgAsMem') {
    	fn_popChgAsMem(no);
    }  else {
    	fn_memberInfoPop(no);
    }
    
    /* Mobile User Creation
    if (sId == 'tdBtnResist') {
    	fn_createMobileUser(no);
    }
    */
});

function fn_clearFrmMemberInfoPop() {
    $("#userId").val("");
    $("#userName").val("");
    $("#groupCode").val("");
    $("#groupName").val("");
    $("#syncUser").val("");
    $("#deviceCode").val("");
    $("#activationCode").val("");
    $("#activationYn").val("");
}

function fn_memberInfoPop(no) {
	fn_clearFrmMemberInfoPop();
    
    $("#userId").val($("#tdMemberId-"+no).text());
    $("#userName").val($("#tdMemberName-"+no).text());
    $("#groupCode").val(gvGroupCode);
    $("#syncUser").val($("#tdSyncUser-"+no).text());
    $("#deviceCode").val($("#tdDeviceCode-"+no).text());
    $("#activationCode").val($("#tdActivationCode-"+no).text());
    
    if ($("#activationCode").val()) {
        $("#activationYn").val("Y");
    } else {
        $("#activationYn").val("N");
    }
    
    gfn_customLayerPopup('dim-layer-user-info', 'dimBgUserInfo', 'user_info_layer', 'closeUserInfoPopup');
}

var strClickEventNm  = "";
strClickEventNm += "#btnSaveMemberInfo, #btnCheckSyncUser, #btnExcelExportGroup, #btnExcelExportMember, #btnSendAll, #btnChange";
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    
    if (id === "btnSaveMemberInfo") {
        fn_submitMemberInfo();
    } else if (id === "btnCheckSyncUser") {
    	fn_checkSyncUser();
    } else if (id === "btnExcelExportGroup") {
        fn_excelExportGroup();
    } else if (id === "btnExcelExportMember") {
        fn_excelExportMember();
    } else if (id === "btnSendAll") {
    	fn_sendAll();
    } else if (id === "btnChange") {
    	fn_changeAsMember();
    }
});

function fn_checkSyncUser() {
    var param = "mdcId="+$("#syncUser").val();
    gf_send("<c:url value='/mdc/mdcKoamtac/getSyncUser' />", param, "fn_checkSyncUserCallback");
}

function fn_checkSyncUserCallback(data) {
    if (data != null && data.syncUserMap != null && data.syncUserMap.mdcId != null) {
        gfn_layerPopup("The id "+data.syncUserMap.mdcId+" exists.");
        $("#deviceCode").val(data.syncUserMap.deviceCode);
    } else {
        gfn_layerPopup("The id "+$("#syncUser").val()+" doess not exist.");
    }
}

function fn_submitMemberInfo() {
    gf_sendForm("frmUserInfoPop", "<c:url value='/admin/userManagement/updateMemberInfo' />", "fn_submitMemberInfoCallback");
}

function fn_submitMemberInfoCallback(data) {
	$('#dim-layer-user-info').fadeOut();
    gfn_layerPopup(data.msg);
    
    fn_getMemberList(1);
}

$(document).on("change", "#cbSearchField", function(e){
    e.preventDefault();
    
    fn_getGroupList(1);
});

$(document).on("input", "#sKeyword", function(e){
    e.preventDefault();
    
    fn_getGroupList(1);
});

function fn_excelExportGroup() {
    var param = "";
    param += "filename=group-list";
    
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

function fn_excelExportMember() {
    var param = "";
    param += "filename=group-member-list";
    param += "&";
    param += "groupCode="+gvGroupCode;
    
    document.location.href = "/common/excelExport?"+param;
}

function fn_sendMail(no) {
	var param = "";
	param += "groupCode="+gvGroupCode;
	param += "&" + "userId="+$("#tdMemberId-"+no).text();
	$("#mloader").css("display", "block");
	//gf_send("<c:url value='/admin/userManagement/sendMail' />", param, "fn_sendMailCallback");
	gf_send("<c:url value='/admin/userManagement/sendWelcomeMail' />", param, "fn_sendMailCallback");
}

function fn_sendMailCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
	fn_getMemberList(1);
}

function fn_sendAll() {
	var param = "";
	param += "groupCode="+gvGroupCode;
	$("#mloader").css("display", "block");
    gf_send("<c:url value='/admin/userManagement/sendMailAll' />", param, "fn_sendMailCallback");
}

function fn_createMobileUser(no) {
	var param = "";
	param += "groupCode="+gvGroupCode;
	param += "&userId="+$("#tdMemberId-"+no).text();
	param += "&area="+$("#tdArea-"+no).text();
	param += "&userType=1";
	
	gf_send("<c:url value='/admin/userManagement/createMobileUserAsMember' />", param, "fn_createMobileUserCallbak");
}

function fn_createMobileUserCallbak(data) {
	gfn_layerPopup(data.msg);
	fn_getMemberList(1);
}

function fn_popChgAsMem(no) {
	$("#chArea").val($("#tdArea-"+no).text());
	$("#chGroupCode").val("");
	$("#chUserId").val($("#tdMemberId-"+no).text());
	
	gfn_customLayerPopup('dim-layer-chg', 'dimBgChg', 'chg_layer', 'closeChgPopup');
}

function fn_changeAsMember() {
	if ($("#chGroupCode").val() === gvGroupCode) {
		gfn_layerPopup("You can not change to a member of the same group.");
		return false;
	}
	
	var param = "";
	param += "groupCode="+$("#chGroupCode").val();
	param += "&userId="+$("#chUserId").val();
	param += "&area="+$("#chArea").val();
	param += "&curGroupCode="+gvGroupCode;
	
	gf_send("<c:url value='/admin/userManagement/changeAsMember' />", param, "fn_changeAsMemberCallbak");
}

function fn_changeAsMemberCallbak(data) {
	if (data.flag === "success") {
		$('#dim-layer-chg').fadeOut();
		fn_getGroupList(1);
	}
	gfn_layerPopup(data.msg);
}
</script>
</body>
</html>