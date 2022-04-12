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
                    <h2>Menu Management</h2>
                </header>
                
                <div class="row 200%">
                    <div class="6u 12u$(medium)">
                        <h3>Menu</h3>
                        <div id="tblMenuList" class="table-wrapper">
                            <table class="alt">
                                <thead style="text-align:center;">
                                    <tr>
                                        <td>Division</td>
                                        <td>Name</td>
                                        <td>Sequence</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="3" style="text-align:center;">There is no data.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="6u 12u$(medium)">
                        <h3>Info</h3>
                        <form name="frmMenuInfo" id="frmMenuInfo">
	                        <div class="table-wrapper">
	                            <table>
	                                <thead>
	                                    <tr>
	                                        <td width="30%">Title</td>
	                                        <td>Content</td>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <th>Sequence</th>
	                                        <td>
	                                            <input type="text" name="menuSeq" id="menuSeq" value="" readonly="readonly" />
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Division</th>
	                                        <td>
	                                            <input type="text" name="menuDivision" id="menuDivision" value="" required="required" maxlength="1"/>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>level</th>
	                                        <td>
	                                            <input type="text" name="menuLevel" id="menuLevel" value="" required="required" maxlength="3" />
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Parent menu sequence</th>
	                                        <td>
	                                            <input type="text" name="parentMenuSeq" id="parentMenuSeq" value="" maxlength="11" />
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Order</th>
	                                        <td>
	                                            <input type="text" name="menuOrder" id="menuOrder" value="" maxlength="5" />
	                                        </td>
	                                    </tr>
	                                    <tr>
                                            <th>Menu type</th>
                                            <td>
                                                <input type="text" name="menuType" id="menuType" value="" maxlength="1" />
                                            </td>
                                        </tr>
	                                    <tr>
	                                        <th>URI</th>
	                                        <td>
	                                            <input type="text" name="uri" id="uri" value="" maxlength="200" />
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Menu name</th>
	                                        <td>
	                                            <input type="text" name="menuName" id="menuName" value="" required="required" maxlength="200" />
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Opener Class</th>
	                                        <td>
	                                            <input type="text" name="openerClass" id="openerClass" value="" maxlength="200" />
	                                        </td>
	                                    </tr><tr>
	                                        <th>Description</th>
	                                        <td>
	                                            <input type="text" name="description" id="description" value="" maxlength="200" />
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Use YN</th>
	                                        <td>
	                                            <select name="cbUseYn" id="cbUseYn" required="required">
	                                               <option value=""> -- select -- </option>
	                                               <option value="Y">Yes</option>
	                                               <option value="N">No</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                </tbody>
	                                <tfoot>
	                                    <tr style="text-align:right;">
	                                        <td colspan="2">
	                                            <ul class="actions">
	                                                <li><input type="button" name="btnInitialize" id="btnInitialize" value="Initialize" class="button special" /></li>
				                                    <li><input type="button" name="btnSaveMenu" id="btnSaveMenu" value="Save" class="button special" /></li>
				                                </ul>
	                                        </td>
	                                    </tr>
	                                </tfoot>
	                            </table>
	                        </div>
                        </form>
                    </div>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
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
    
    fn_intializeForm("frmMenuInfo");
    
    fn_getMenuList();
});

var strClickEventNm  = "";
strClickEventNm += "#btnInitialize, #btnSaveMenu";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnInitialize") {
    	fn_intializeForm("frmMenuInfo");
    } else if (args[0] === "btnSaveMenu") {
    	fn_saveMenu();
    }
}

$(document).on("click", "#tblMenuList tbody tr", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var no = id.split("-")[1];

    fn_setMenuInfoValue($("#tdMenuSeq-"+no).text());
});

function fn_intializeForm(frmId) {
	$("#"+frmId).find("input[type=text]").val("");
	$("#"+frmId).find("select").val("Y");
	$("#"+frmId).find("select option:eq(Y)").attr('selected', 'selected');
}

function fn_getMenuList() {
	gf_send("<c:url value='/admin/systemManagement/getMenuList' />", "", "fn_getMenuListCallback");
}

function fn_getMenuListCallback(data) {
	var menuList = data.tblMenuList;
	
	fn_makeTblMenuList(menuList);
}

function fn_makeTblMenuList(menuList) {
	var bodyHtml = "";
	
	if (menuList != null && menuList.length > 0) {
		for(var i=0; i<menuList.length; i++) {
			var img = "<img src=\"/resources/images/folder-16.jpg\" alt=\"\" />&nbsp;&nbsp;";
			var menuDivision = gfn_nullValue(menuList[i].menuDivision);
			var menuName = gfn_nullValue(menuList[i].menuName);
			var menuSeq = menuList[i].menuSeq;
			var menuLevelChar = gfn_nullValue(menuList[i].menuLevelChar);
			
			bodyHtml+= "<tr id=\"trMenu-"+i+"\">";
			bodyHtml+= "    <td style=\"text-align:center;\">"+menuDivision+"</td>";
			bodyHtml+= "    <td>"+menuLevelChar+img+menuName+"</td>";
			bodyHtml+= "    <td id=\"tdMenuSeq-"+i+"\" style=\"text-align:right;\">"+menuSeq+"</td>";
			bodyHtml+= "</tr>";
		}
	} else {
		bodyHtml += "<tr><td colspan=\"3\" style=\"text-align:center;\">There is no data.</td></tr>";
	}
	
	$("#tblMenuList tbody").html(bodyHtml);
}

function fn_saveMenu() {
	var frmId = "frmMenuInfo";
	
	if(!$("#menuSeq").val()) {
		gf_sendForm(frmId, "<c:url value='/admin/systemManagement/insertMenu' />", "fn_saveMenuCallback");
	} else {
		gf_sendForm(frmId, "<c:url value='/admin/systemManagement/updateMenu' />", "fn_saveMenuCallback");
	}
}

function fn_saveMenuCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getMenuList();
	}
}

function fn_setMenuInfoValue(seq) {
	gf_send("<c:url value='/admin/systemManagement/getMenuInfo' />", "menuSeq="+seq, "fn_setMenuInfoValueCallback");
}

function fn_setMenuInfoValueCallback(data) {
	var menuInfo = data.menuInfoMap;
	
	$("#menuSeq").val(menuInfo.menuSeq);
	$("#menuDivision").val(gfn_nullValue(menuInfo.menuDivision));
	$("#menuLevel").val(menuInfo.menuLevel);
	$("#parentMenuSeq").val(menuInfo.parentMenuSeq);
	$("#menuOrder").val(menuInfo.menuOrder);
	$("#menuType").val(menuInfo.menuType);
	$("#uri").val(gfn_nullValue(menuInfo.uri));
	$("#menuName").val(gfn_nullValue(menuInfo.menuName));
	$("#openerClass").val(gfn_nullValue(menuInfo.openerClass));
	$("#description").val(gfn_nullValue(menuInfo.description));
	
	$("#cbUseYn").val(gfn_nullValue(menuInfo.useYn));
    $("#cbUseYn option:eq("+gfn_nullValue(menuInfo.useYn)+")").attr('selected', 'selected');
}
</script>
</body>
</html>