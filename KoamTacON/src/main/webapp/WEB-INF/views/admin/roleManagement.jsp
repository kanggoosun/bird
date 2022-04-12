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
        <%@ include file="../include/header.jsp" %>
        <div class="inner">
            
            <section>
                <header class="main">
                    <h2>Role Management</h2>
                </header>
                
                <h4>Role List</h4>
                <div id="tblRoleList" class="table-wrapper">
                    <input type="hidden" name="sRoleSeq" id="sRoleSeq" value="" />
                    <table class="alt">
                        <thead style="text-align:center;font-size:0.8em;">
                            <tr>
                                <td width="15%">Role Sequence</td>
                                <td width="15%">Role Name</td>
                                <td width="60%">Description</td>
                                <td width="10%">Edit</td>
                            </tr>
                        </thead>
                        <tbody style="text-align:center;font-size:0.7em;">
                            <tr>
                                <td colspan="5" style="text-align:center;">There is no data.</td>
                            </tr>
                        </tbody>
                        <tfoot style="font-size:0.7em;">
                            <tr><td colspan="5" style="text-align:center;" id="tdPaginationRole"></td></tr>
                            <tr>
                                <td colspan="5" style="text-align:right;">
                                    <ul class="actions">
                                        <li><input type="button" name="btnNewRole" id="btnNewRole" value="New role" class="button small special" /></li>
                                    </ul>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                
                <section>
                    <div class="row">
                        <div class="6u 12u$(medium)">
                            <h4>User List</h4>
                            <div id="tblRoleUserList" class="table-wrapper">
		                        <table class="alt">
		                            <thead style="text-align:center;font-size:0.8em;">
		                                <tr>
		                                    <td width="20%">ID</td>
		                                    <td width="20%">Name</td>
		                                    <td width="40%">Email</td>
		                                    <td width="20%">Remove</td>
		                                </tr>
		                            </thead>
		                            <tbody style="text-align:center;font-size:0.7em;">
		                                <tr>
		                                    <td colspan="4" style="text-align:center;">There is no data.</td>
		                                </tr>
		                            </tbody>
		                            <tfoot style="font-size:0.7em;">
		                                <tr><td colspan="4" style="text-align:center;" id="tdPaginationUser"></td></tr>
		                                <tr>
		                                    <td colspan="4" style="text-align:right;">
		                                        <ul class="actions vertical">
		                                            <li><input type="button" name="btnAddUser" id="btnAddUser" value="Add user" class="button small special" /></li>
		                                        </ul>
		                                    </td>
		                                </tr>
		                            </tfoot>
		                        </table>
		                    </div>
                        </div>
                        <div class="6u 12u$(medium)">
                            <h4>Menu List</h4>
                            <div id="tblRoleMenuList" class="table-wrapper">
                                <table class="alt">
                                    <thead style="text-align:center;font-size:0.8em;">
                                        <tr>
                                            <td width="15%">Division</td>
                                            <td>Name</td>
                                            <td width="10%">Level</td>
                                            <td width="15%">Sequence</td>
                                            <td width="20%">Remove</td>
                                        </tr>
                                    </thead>
                                    <tbody style="font-size:0.7em;">
                                        <tr>
                                            <td colspan="5" style="text-align:center;">There is no data.</td>
                                        </tr>
                                    </tbody>
                                    <tfoot style="font-size:0.7em;">
                                        <tr><td colspan="5" style="text-align:center;" id="tdPaginationMenu"></td></tr>
                                        <tr>
                                            <td colspan="5" style="text-align:right;">
                                                <ul class="actions vertical">
                                                    <li><input type="button" name="btnAddMenu" id="btnAddMenu" value="Add menu" class="button small special" /></li>
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

<!-- Role popup layer -->
<div id="dim-layer-role" class="dim-layer">
    <div id="dimBgRole" class="dimBg"></div>
    <div id="role_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="roleDiv">
                    <form id="frmRolePop" method="post">
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="text" name="roleSeq" id="roleSeq" value="" readonly="readonly" placeholder="Role sequence" maxlength="11" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="roleName" id="roleName" value="" placeholder="Role name" required="required" maxlength="50" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="roleDescription" id="roleDescription" value="" placeholder="Role description" maxlength="200" />
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
                                    <li><input type="button" name="btnSaveRole" id="btnSaveRole" value="Submit" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeRolePopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- User popup layer -->
<div id="dim-layer-user" class="dim-layer">
    <div id="dimBgUser" class="dimBg"></div>
    <div id="user_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="userDiv">
                    <form id="frmUserPop" method="post">
                        <div id="tblUserList" class="table-wrapper" style="height:300px;overflow-y:scroll;">
                            <table class="alt">
                                <thead style="text-align:center;">
                                    <tr>
                                        <td width="20%">ID</td>
                                        <td width="20%">Name</td>
                                        <td width="20%">Email</td>
                                        <td width="30%">Country</td>
                                        <td>Choose</td>
                                    </tr>
                                </thead>
                                <tbody style="text-align:center;font-size:0.7em;">
                                    <tr>
                                        <td colspan="5" style="text-align:center;">There is no data.</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeUserPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Menu popup layer -->
<div id="dim-layer-menu" class="dim-layer">
    <div id="dimBgMenu" class="dimBg"></div>
    <div id="menu_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="menuDiv">
                    <form id="frmMenuPop" method="post">
                        <div id="tblMenuList" class="table-wrapper" style="height:300px;overflow-y:scroll;">
                            <table class="alt">
                                <thead style="text-align:center;font-size:0.7em;">
                                    <tr>
                                        <td width="20%">Division</td>
                                        <td width="40%">Name</td>
                                        <td width="20%">Sequence</td>
                                        <td>Choose</td>
                                    </tr>
                                </thead>
                                <tbody style="text-align:center;font-size:0.7em;">
                                    <tr>
                                        <td colspan="4" style="text-align:center;">There is no data.</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeMenuPopup" class="btn-layerClose">Close</a>
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
    
    fn_getRoleList(1);
});

function fn_getRoleList(pageNo) {
	var param = "";
	param += "curPage="+pageNo;
	param += "&";
	param += "callFunction=fn_getRoleList";
	
	gf_send("<c:url value='/admin/systemManagement/getRoleList' />", param, "fn_getRoleListCallback");
}

function fn_getRoleListCallback(data) {
	var roleList = data.roleList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblRoleList(roleList, paginationHtml);
}

function fn_makeTblRoleList(roleList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	
	if (roleList != null && roleList.length > 0) {
		for(var i=0; i<roleList.length; i++) {
			bodyHtml += "<tr id=\"trRole-"+i+"\">";
			bodyHtml += "    <td id=\"tdRoleSeq-"+i+"\">"+roleList[i].roleSeq+"</td>";
			bodyHtml += "    <td id=\"tdRoleName-"+i+"\">"+roleList[i].roleName+"</td>";
			bodyHtml += "    <td id=\"tdRoleDescription-"+i+"\" style=\"text-align:left;\">"+roleList[i].roleDescription+"</td>";
			bodyHtml += "    <td id=\"tdRoleBtn-"+i+"\"><input type=\"button\" id=\"btnRoleBtn-"+i+"\" value=\"Edit\" class=\"button small special\" /></td>";
			bodyHtml += "</tr>";
		}
		pageHtml = paginationHtml;
	} else {
		bodyHtml += "<tr>";
		bodyHtml += "    <td colspan=\"4\" style=\"text-align:center;\">There is no data.</td>";
        bodyHtml += "</tr>";
	}
	
	$("#tblRoleList tbody").html(bodyHtml);
	$("#tblRoleList tfoot #tdPaginationRole").html(pageHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnNewRole, #btnAddUser, #btnAddMenu, #btnSaveRole";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

$(document).on("click", "#tblRoleList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    for(var i=0; i<$("#tblRoleList tbody tr").length; i++) {
        if (!$("#btnRoleBtn-"+i).hasClass("special")) {
            $("#btnRoleBtn-"+i).toggleClass("special");
        }
    }
    $("#btnRoleBtn-"+no).toggleClass("special");
    
    if (sId === "tdRoleBtn") {
    	fn_rolePopup(no);
    } else {
    	$("#sRoleSeq").val($("#tdRoleSeq-"+no).text());
    	fn_getRoleUserList(1);
    	fn_getRoleMenuList();
    }
});

$(document).on("click", "#tblRoleUserList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    if (sId === "tdRoleUserBtn") {
        fn_removeUser($("#tdRoleUserId-"+no).text());
    }
});

function fn_removeUser(userId) {
	var param = "roleSeq="+$("#sRoleSeq").val()+"&userId="+userId;
    gf_send("<c:url value='/admin/systemManagement/deleteRoleUser' />", param, "fn_removeUserCallback");
}

function fn_removeUserCallback(data) {
    gfn_layerPopup(data.msg);
    
    if (data.flag === "success") {
        fn_getRoleUserList(1);
    }
}

$(document).on("click", "#tblUserList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    if (sId === "tdUserBtn") {
    	fn_addUser($("#tdUserId-"+no).text());
    }
});

function fn_addUser(userId) {
	var param = "roleSeq="+$("#sRoleSeq").val()+"&userId="+userId;
	gf_send("<c:url value='/admin/systemManagement/insertRoleUser' />", param, "fn_addUserCallback");
}

function fn_addUserCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getRoleUserList(1);
		fn_getUserList();
	}
}

$(document).on("click", "#tblMenuList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    if (sId === "tdMenuBtn") {
        fn_addMenu($("#tdMenuSeq-"+no).text());
    }
});

function fn_addMenu(menuSeq) {
	var param = "roleSeq="+$("#sRoleSeq").val()+"&menuSeq="+menuSeq;
    gf_send("<c:url value='/admin/systemManagement/insertRoleMenu' />", param, "fn_addMenuCallback");
}

function fn_addMenuCallback(data) {
    gfn_layerPopup(data.msg);
    
    if (data.flag === "success") {
        fn_getRoleMenuList();
        fn_getMenuList();
    }
}

$(document).on("click", "#tblRoleMenuList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    if (sId === "tdRoleMenuBtn") {
        fn_removeMenu($("#tdRoleMenuSeq-"+no).text());
    }
});

function fn_removeMenu(menuSeq) {
	var param = "roleSeq="+$("#sRoleSeq").val()+"&menuSeq="+menuSeq;
	gf_send("<c:url value='/admin/systemManagement/deleteRoleMenu' />", param, "fn_removeMenuCallback");
}

function fn_removeMenuCallback(data) {
    gfn_layerPopup(data.msg);
    
    if (data.flag === "success") {
        fn_getRoleMenuList();
    }
}

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnNewRole") {
    	fn_rolePopup("");
    } else if (args[0] === "btnAddUser") {
        fn_userPopup();
    } else if (args[0] === "btnAddMenu") {
        fn_menuPopup("");
    } else if (args[0] === "btnSaveRole") {
        fn_saveRole();
    }
}

function fn_rolePopup(no) {
	gfn_clearForm("frmRolePop");
	
	if (no === "") {
		gfn_customLayerPopup('dim-layer-role', 'dimBgRole', 'role_layer', 'closeRolePopup');
	} else {
		fn_setFrmRolePop(no);
		gfn_customLayerPopup('dim-layer-role', 'dimBgRole', 'role_layer', 'closeRolePopup');
	}
}

function fn_setFrmRolePop(no) {
	$("#roleSeq").val($("#tdRoleSeq-"+no).text());
	$("#roleName").val($("#tdRoleName-"+no).text());
	$("#roleDescription").val($("#tdRoleDescription-"+no).text());
	$("#cbUseYn").val("Y");
    $("#cbUseYn option:eq(Y)").attr('selected', 'selected');
}

function fn_getUserList() {
	var param = "roleSeq="+$("#sRoleSeq").val();
    gf_send("<c:url value='/admin/systemManagement/getUserList' />", param, "fn_getUserListCallback");
}

function fn_getUserListCallback(data) {
    var userList = data.userList;
    
    fn_makeTblUserList(userList);
}

function fn_userPopup() {
	if (!$("#sRoleSeq").val()) {
		gfn_layerPopup<spring:message code='MSG-VW079' text='Please select a row from role list to add.' />");
        return false;
	}
	
	var param = "roleSeq="+$("#sRoleSeq").val();
	gf_send("<c:url value='/admin/systemManagement/getUserList' />", param, "fn_userPopupCallback");
}

function fn_userPopupCallback(data) {
	var userList = data.userList;
	
	fn_makeTblUserList(userList);
	gfn_customLayerPopup('dim-layer-user', 'dimBgUser', 'user_layer', 'closeUserPopup');
}

function fn_makeTblUserList(userList) {
    var bodyHtml = "";
    
    if (userList != null && userList.length > 0) {
        for(var i=0; i<userList.length; i++) {
            bodyHtml += "<tr id=\"trUser-"+i+"\">";
            bodyHtml += "    <td id=\"tdUserId-"+i+"\">"+gfn_nullValue(userList[i].userId)+"</td>";
            bodyHtml += "    <td id=\"tdUserName-"+i+"\">"+gfn_nullValue(userList[i].userName)+"</td>";
            bodyHtml += "    <td id=\"tdUserEmail-"+i+"\" style=\"text-align:left;\">"+gfn_nullValue(userList[i].userEmail)+"</td>";
            bodyHtml += "    <td id=\"tdCountry-"+i+"\" style=\"text-align:left;\">"+gfn_nullValue(userList[i].countryName)+"</td>";
            bodyHtml += "    <td id=\"tdUserBtn-"+i+"\"><input type=\"button\" value=\"Choose\" class=\"button small special\" /></td>";
            bodyHtml += "</tr>";
        }
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"5\" style=\"text-align:center;\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblUserList tbody").html(bodyHtml);
}

function fn_getMenuList() {
    var param = "roleSeq="+$("#sRoleSeq").val();
    gf_send("<c:url value='/admin/systemManagement/getMenuListNotInRole' />", param, "fn_getMenuListCallback");
}

function fn_getMenuListCallback(data) {
    var menuList = data.tblMenuList;
    
    fn_makeTblMenuList(menuList);
}

function fn_menuPopup() {
	if (!$("#sRoleSeq").val()) {
        gfn_layerPopup("<spring:message code='MSG-VW079' text='Please select a row from role list to add.' />");
        return false;
    }
	
	var param = "roleSeq="+$("#sRoleSeq").val();
    gf_send("<c:url value='/admin/systemManagement/getMenuListNotInRole' />", param, "fn_menuPopupCallback");
}

function fn_menuPopupCallback(data) {
    var menuList = data.tblMenuList;
    
    fn_makeTblMenuList(menuList);
    gfn_customLayerPopup('dim-layer-menu', 'dimBgMenu', 'menu_layer', 'closeMenuPopup');
}

function fn_makeTblMenuList(menuList) {
    var bodyHtml = "";
    
    if (menuList != null && menuList.length > 0) {
        for(var i=0; i<menuList.length; i++) {
            bodyHtml += "<tr id=\"trMenu-"+i+"\">";
            bodyHtml += "    <td id=\"tdMenuDivision-"+i+"\">"+gfn_nullValue(menuList[i].menuDivisionName)+"</td>";
            bodyHtml += "    <td id=\"tdMenuName-"+i+"\" style=\"text-align:left;\">"+gfn_nullValue(menuList[i].menuName)+"</td>";
            bodyHtml += "    <td id=\"tdMenuSeq-"+i+"\" style=\"text-align:right;\">"+menuList[i].menuSeq+"</td>";
            bodyHtml += "    <td id=\"tdMenuBtn-"+i+"\" style=\"text-align:center;\"><input type=\"button\" value=\"Choose\" class=\"button small special\" /></td>";
            bodyHtml += "</tr>";
        }
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"4\" style=\"text-align:center;\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblMenuList tbody").html(bodyHtml);
}

function fn_saveRole() {
	var frmId = "frmRolePop";
	if (gfn_checkRequired(frmId) === true) {
		if(!$("#roleSeq").val()) {
			gf_sendForm(frmId, "<c:url value='/admin/systemManagement/insertRole' />", "fn_saveRoleCallback");
		} else {
			gf_sendForm(frmId, "<c:url value='/admin/systemManagement/updateRole' />", "fn_saveRoleCallback");
		}
		$('#dim-layer-role').fadeOut();
	}
}

function fn_saveRoleCallback(data) {
	gfn_layerPopup(data.msg);
	if (data.flag === "success") {
		fn_getRoleList(1);
	}
}

function fn_getRoleUserList(pageNo) {
	var param = "";
	param += "roleSeq="+$("#sRoleSeq").val();
	param += "&";
	param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getRoleUserList";
    
	gf_send("<c:url value='/admin/systemManagement/getRoleUserList' />", param, "fn_getRoleUserListCallback");
}

function fn_getRoleUserListCallback(data) {
	var roleUserList = data.roleUserList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblRoleUserList(roleUserList, paginationHtml);
}

function fn_makeTblRoleUserList(roleUserList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	
	if (roleUserList != null && roleUserList.length > 0) {
		for(var i=0; i<roleUserList.length; i++) {
            bodyHtml += "<tr id=\"trRoleUser-"+i+"\">";
            bodyHtml += "    <td id=\"tdRoleUserId-"+i+"\">"+roleUserList[i].userId+"</td>";
            bodyHtml += "    <td id=\"tdRoleUserName-"+i+"\">"+roleUserList[i].userName+"</td>";
            bodyHtml += "    <td id=\"tdRoleUserEmail-"+i+"\" style=\"text-align:left;\">"+roleUserList[i].userEmail+"</td>";
            bodyHtml += "    <td id=\"tdRoleUserBtn-"+i+"\"><input type=\"button\" value=\"Remove\" class=\"button small special\" /></td>";
            bodyHtml += "</tr>";
        }
		pageHtml = paginationHtml;
	} else {
		bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"4\" style=\"text-align:center;\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblRoleUserList tbody").html(bodyHtml);
    $("#tblRoleUserList tfoot #tdPaginationUser").html(pageHtml);
}

function fn_getRoleMenuList() {
	var param = "roleSeq="+$("#sRoleSeq").val();
	gf_send("<c:url value='/admin/systemManagement/getRoleMenuList' />", param, "fn_getRoleMenuListCallback");
}

function fn_getRoleMenuListCallback(data) {
	var menuList = data.menuList;
	
	fn_makeTblRoleMenuList(menuList);
}

function fn_makeTblRoleMenuList(menuList) {
    var bodyHtml = "";
    
    if (menuList != null && menuList.length > 0) {
        for(var i=0; i<menuList.length; i++) {
            bodyHtml += "<tr id=\"trRoleMenu-"+i+"\">";
            bodyHtml += "    <td id=\"tdRoleMenuDivision-"+i+"\">"+menuList[i].menuDivisionName+"</td>";
            bodyHtml += "    <td id=\"tdRoleMenuName-"+i+"\">"+gfn_nullValue(menuList[i].menuLevelChar)+menuList[i].menuName+"</td>";
            bodyHtml += "    <td id=\"tdRoleMenuLevel-"+i+"\" style=\"text-align:center;\">"+menuList[i].menuLevel+"</td>";
            bodyHtml += "    <td id=\"tdRoleMenuSeq-"+i+"\" style=\"text-align:right;\">"+menuList[i].menuSeq+"</td>";
            bodyHtml += "    <td id=\"tdRoleMenuBtn-"+i+"\" style=\"text-align:center;\"><input type=\"button\" value=\"Remove\" class=\"button small special\" /></td>";
            bodyHtml += "</tr>";
        }
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"5\" style=\"text-align:center;\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblRoleMenuList tbody").html(bodyHtml);
}
</script>
</body>
</html>