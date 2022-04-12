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
                    <h2>Admin Management</h2>
                </header>
                
                <section>
                    <h4>Filters</h4>
                    
                    <form id="frmMainFilter" name="frmMainFilter">
                        <div class="row">
                            <div class="3u 12u$(medium)">
                                <input type="text" name="sUser" id="sUser" value="" placeholder="user id or user name"/> 
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
                                    <th style="text-align:center;">ID</th>
                                    <th style="text-align:center;">Name</th>
                                    <th style="text-align:center;">E-mail</th>
                                    <th style="text-align:center;">Country</th>
                                    <th style="text-align:center;">Creation date</th>
                                </tr>
                            </thead>
                            <tbody style="text-align:center;font-size:0.8em;">
                            </tbody>
                            <tfoot style="font-size:0.8em;">
                                <tr>
                                    <td colspan="5" style="text-align:right;">
                                        <ul class="actions vertical">
		                                    <li><input type="button" name="btnCreateAdmin" id="btnCreateAdmin" value="Create" class="button special" /></li>
		                                </ul>
                                    </td>
                                </tr>
                                <tr><td colspan="5" style="text-align:center;" id="tdPagination"></td></tr>
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

<!-- Admin Information popup layer -->
<div id="dim-layer-admin-info" class="dim-layer">
    <div id="dimBgAdminInfo" class="dimBg"></div>
    <div id="admin_info_layer" class="popcont-layer 12u$" style="width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="adminInfoDiv">
                    <form id="frmAdminInfoPop" method="post">
                        <div class="row uniform">
                            <div class="6u 12u$(small)">
                                <input type="text" name="userId" id="userId" value="" placeholder="User id" required="required" maxlength="15" />
                                <input type="hidden" name="flagIdDupeChk" id="flagIdDupeChk" value="false" />
                                <input type="hidden" name="flagSave" id="flagSave" value="" />
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="button" name="btnIdDupeChk" id="btnIdDupeChk" value="ID Duplication Check" class="button"/>
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="name" id="name" value="" placeholder="Name" required="required" maxlength="50" />
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="email" name="email" id="email" value="" placeholder="Email" required="required" maxlength="50" />
                            </div>
                            <div class="6u 12u$(small)">
                                <div class="select-wrappecr" id="divForCBCountry">
                                    <select id="cbCountry" name="cbCountry">
                                      <option value=""> -- Select country -- </option>
                                      <c:out value="${listCountryCode}" escapeXml="false" />
                                    </select>
                                </div>
                            </div>
                            <div class="6u$ 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnSaveAdminInfo" id="btnSaveAdminInfo" value="Save" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeAdminInfoPopup" class="btn-layerClose">Close</a>
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
    
    gfn_toggleMenu('.userMgmt');
    
    $("#flagIdDupeChk").val("false");
    
    fn_getAdminInfoList(1);
});

var strClickEventNm  = "";
strClickEventNm += "#btnSaveAdminInfo, #btnCreateAdmin, #btnIdDupeChk";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

//key press event
var strKeypressEventNm  = "";
strKeypressEventNm += "#groupName, #mdcId, #deviceCode, #activationCode";
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
    
    if (args[0] === "btnSaveAdminInfo") {
        fn_submitAdminInfo();
    } else if (args[0] === "btnCreateAdmin") {
    	fn_AdminInfoPop("");
    } else if (args[0] === "btnIdDupeChk") {
        fn_isExist();
    }
    
    else if (args[0] === "groupName") {
        $("#mdcId").focus();
    } else if (args[0] === "mdcId") {
        $("#deviceCode").focus();
    } else if (args[0] === "deviceCode") {
        $("#activationCode").focus();
    } else if (args[0] === "activationCode") {
        return false;
    }
}

$(document).on("click", "#tblAdminList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var no = id.split("-")[1];

    fn_AdminInfoPop(no);
});

$("#sUser").on("input", function() {
	fn_getAdminInfoList(1);
});

function fn_isExist() {
    if (!$("#userId").val()) {
        gfn_layerPopup("Please input ID.", "userId");
    } else {
    	var param = "userId="+$("#userId").val();
        gf_send("<c:url value='/sign/isExist' />", param, "fn_isExistCallback");
    }
}

function fn_isExistCallback(data) {
    var isExist = data.isExist;
    
    if (isExist === 0) {
        $("#flagIdDupeChk").val("true");
        gfn_layerPopup("ID is available.");
        return true;
    } else {
        $("#flagIdDupeChk").val("false");
        gfn_layerPopup("ID already exists.");
        return false;
    }
}

function fn_getAdminInfoList(pageNo) {
	var param = "";
    param += "sUser="+$("#sUser").val();
    param += "&";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getAdminInfoList";
    
    gf_send("<c:url value='/admin/userManagement/getAdminInfoList' />", param, "fn_getAdminInfoListCallback");
}

function fn_getAdminInfoListCallback(data) {
    var adminInfoList = data.adminInfoList;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblAdminInfoList(adminInfoList, paginationHtml);
}

function fn_makeTblAdminInfoList(adminInfoList, paginationHtml) {
    var bodyHtml = "";
    var pageHtml = "";

    if (adminInfoList != null && adminInfoList.length > 0) {
        for(var i=0; i<adminInfoList.length; i++) {
            bodyHtml += "<tr>";
            bodyHtml += "    <td id=\"tdUserId-"+i+"\">"+gfn_nullValue(adminInfoList[i].userId);
            bodyHtml += "        <input type=\"hidden\" name=\"userId-"+i+"\" id=\"userId-"+i+"\" value=\""+gfn_nullValue(adminInfoList[i].userId)+"\" />";
            bodyHtml += "        <input type=\"hidden\" name=\"countryCode-"+i+"\" id=\"countryCode-"+i+"\" value=\""+gfn_nullValue(adminInfoList[i].countryCode)+"\" />";
            bodyHtml += "    </td>";
            bodyHtml += "    <td id=\"tdUserName-"+i+"\">"+gfn_nullValue(adminInfoList[i].userName)+"</td>";
            bodyHtml += "    <td id=\"tdUserEmail-"+i+"\">"+gfn_nullValue(adminInfoList[i].userEmail)+"</td>";
            bodyHtml += "    <td id=\"tdCountryName-"+i+"\">"+gfn_nullValue(adminInfoList[i].countryName)+"</td>";
            bodyHtml += "    <td id=\"tdCreatioinDate-"+i+"\">"+gfn_nullValue(adminInfoList[i].creationDate)+"</td>";
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"5\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblAdminList tbody").html(bodyHtml);
    $("#tblAdminList tfoot #tdPagination").html(pageHtml);
}

function fn_clearFrmAdminInfoPop() {
    $("#userId").val("");
    $("#name").val("");
    $("#email").val("");
    $("#cbCountry").val("");
    $('#cbCountry option:eq(0)').attr('selected', 'selected');
    $("#flagIdDupeChk").val("false");
    $("#flagSave").val("");
}

function fn_AdminInfoPop(no) {
	fn_clearFrmAdminInfoPop();
	
	if (no === null || no === "") {
		$("#flagSave").val("I");
	} else {
		$("#flagSave").val("U");
		$("#userId").val($("#userId-"+no).val());
	    $("#name").val($("#tdUserName-"+no).text());
	    $("#email").val($("#tdUserEmail-"+no).text());
	    $("#cbCountry").val($("#countryCode-"+no).val()).prop("selected",true);
	}
    
    gfn_customLayerPopup('dim-layer-admin-info', 'dimBgAdminInfo', 'admin_info_layer', 'closeAdminInfoPopup');
}

function fn_submitAdminInfo() {
	var frmId = "frmAdminInfoPop";
	
	if ($("#flagSave").val() === "I" && eval($("#flagIdDupeChk").val()) === false) {
        gfn_layerPopup("Click the ID Duplication Check button to check whether id exists already, if not, you can create the id.");
        return false;
    }
    
    if (gfn_checkRequired(frmId) === true) {
        if (gfn_checkFormat(frmId) === true) {
        	if ($("#flagSave").val() === "I") {
        		gf_sendForm(frmId, "<c:url value='/admin/userManagement/insertAdminInfo' />", "fn_submitAdminInfoCallback");
        	} else {
        		gf_sendForm(frmId, "<c:url value='/admin/userManagement/updateAdminInfo' />", "fn_submitAdminInfoCallback");
        	}
        }
    }
}

function fn_submitAdminInfoCallback(data) {
	$('#dim-layer-admin-info').fadeOut();
    gfn_layerPopup(data.msg);
    
    fn_getAdminInfoList(1);
}
</script>
</body>
</html>