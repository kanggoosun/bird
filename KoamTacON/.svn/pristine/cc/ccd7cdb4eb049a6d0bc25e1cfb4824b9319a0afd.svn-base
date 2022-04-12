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
                    <h2>Group Management</h2>
                </header>
                
                <form id="frmMainFilter" name="frmMainFilter">
                    <div class="row">
                        <div class="2u 12u$(medium) select-wrapper">
                            <select id="cbSearchField" name="cbSearchField">
                                <option value="usr.user_id">Owner ID</option>
                                <option value="usr.name">Owner name</option>
                                <option value="usr.company">Company</option>
                                <option value="grp.group_code">Group code</option>
                                <option value="grp.area">Area</option>
                            </select>
                        </div>
                        <div class="2u 12u$(medium)">
                            <input type="text" name="sKeyword" id="sKeyword" value="" placeholder="keyword"/> 
                        </div>
                    </div>
                </form>
                
                <h4>Owner List</h4>
                <div id="tblOwnerList" class="table-wrapper">
	                <table class="alt">
	                    <thead>
	                        <tr>
	                            <th style="text-align:center;">Owner ID</th>
	                            <th style="text-align:center;">Owner name</th>
	                            <th style="text-align:center;">Company</th>
	                            <th style="text-align:center;">Country</th>
	                            <th style="text-align:center;">No of approved KDC</th>
	                            <th style="text-align:center;">Area</th>
	                            <th style="text-align:center;">Group code</th>
	                            <th style="text-align:center;">Usable</th>
	                            <th style="text-align:center;">Group creation</th>
	                        </tr>
	                    </thead>
	                    <tbody style="text-align:center;font-size:0.8em;">
	                    </tbody>
	                    <tfoot style="font-size:0.8em;">
	                        <tr><td colspan="9" style="text-align:center;" id="tdPagination"></td></tr>
	                        <tr><td colspan="15" style="text-align:right;" id="tdButton"></td></tr>
	                    </tfoot>
	                </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Set Area popup layer -->
<div id="dim-layer-set-area" class="dim-layer">
    <div id="dimBgSetArea" class="dimBg"></div>
    <div id="set_area_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="areaDiv" >
                    <form id="frmSetArea" method="post">
                        <input type="hidden" id="mode" name="mode" value="" />
                        <div class="row uniform">
                            <div class="12u 12u$">
                                <input type="text" name="groupCode" id="groupCode" value="" required="required" placeholder="*Group code(Matatory)" maxlength="3" />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="ownerId" id="ownerId" value="" required="required" readonly="readonly" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="areaName" id="areaName" value="" required="required" placeholder="*Area(Mandatory)" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnCreateGroup" id="btnCreateGroup" value="Create" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeSetAreaPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvCurPage = 1;

$(document).ready(function(){
    fn_getOwnerList(1);
});

function fn_getOwnerList(pageNo) {
	gvCurPage = pageNo;
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getOwnerList";
    
    var searchField = gfn_nullValue($("#cbSearchField").val());
    var sKeyword = gfn_nullValue($("#sKeyword").val());
    if (searchField != "" && sKeyword != "") {
        param += "&";
        param += "cbSearchField="+searchField;
        param += "&";
        param += "sKeyword="+sKeyword;
    }
    
    gf_send("<c:url value='/admin/userManagement/getOwnerList' />", param, "fn_getOwnerListCallback");
}

function fn_getOwnerListCallback(data) {
	var ownerList = data.ownerList;
    var paginationHtml = data.pageInfo.paginationHtml;

    fn_makeTblOwnerList(ownerList, paginationHtml);
}

function fn_makeTblOwnerList(ownerList, paginationHtml) {
	var bodyHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    if (ownerList != null && ownerList.length > 0) {
    	for(var i=0; i<ownerList.length; i++) {
    		var area = gfn_nullValue(ownerList[i].area);
    		var groupCode = gfn_nullValue(ownerList[i].groupCode);
    		var kdcCnt = Number(ownerList[i].kdcCnt);
    		var usable = gfn_nullValue(ownerList[i].useYn);
            bodyHtml += "<tr>";
            bodyHtml += "    <td id=\"tdUserId-"+i+"\">"+gfn_nullValue(ownerList[i].userId)+"</td>";
            bodyHtml += "    <td id=\"tdUserName-"+i+"\">"+gfn_nullValue(ownerList[i].userName)+"</td>";
            bodyHtml += "    <td id=\"tdCompany-"+i+"\">"+gfn_nullValue(ownerList[i].company)+"</td>";
            bodyHtml += "    <td id=\"tdCountry-"+i+"\">"+gfn_nullValue(ownerList[i].country)+"</td>";
            bodyHtml += "    <td id=\"tdKdcCnt-"+i+"\">"+kdcCnt+"</td>";
            bodyHtml += "    <td id=\"tdArea-"+i+"\">";
            if (area != "") {
            	bodyHtml += "        <input type=\"button\" id=\"btnPopEditArea-"+i+"\" value=\""+area+"\" class=\"button small special btnPopEditArea\" />";
            }
            bodyHtml += "    </td>";
            bodyHtml += "    <td id=\"tdGroupCode-"+i+"\">"+groupCode+"</td>";
            bodyHtml += "    <td id=\"tdUseYn-"+i+"\">"+usable+"</td>";
            bodyHtml += "    <td id=\"tdBtnCreate-"+i+"\">";
            if (groupCode === "" && kdcCnt > 0) {
                bodyHtml += "        <input type=\"button\" id=\"btnCreate-"+i+"\" value=\"Create\" class=\"button small special btnCreate\" />";
            } else if (groupCode != "" && usable == "Y") {
            	bodyHtml += "        <input type=\"button\" id=\"btnDisable-"+i+"\" value=\"Disable\" class=\"button small special btnDisable\" />";
            } else if (groupCode != "" && usable == "N") {
            	bodyHtml += "        <input type=\"button\" id=\"btnUsable-"+i+"\" value=\"Usable\" class=\"button small special btnUsable\" />";
            }
            bodyHtml += "    </td>";
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExport\" id=\"btnExcelExport\" value=\"Export\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"9\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblOwnerList tbody").html(bodyHtml);
    $("#tblOwnerList tfoot #tdPagination").html(pageHtml);
    $("#tblOwnerList tfoot #tdButton").html(buttonHtml);
}

var strClickEventNm = "";
strClickEventNm += ".btnCreate, .btnDisable, .btnUsable, .btnPopEditArea, #btnCreateGroup, #btnExcelExport";
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    if (sId == "btnCreate") {
    	gfn_clearForm("frmSetArea");
        fn_setAreaPopup(no, "I");
    } else if (sId == "btnDisable") {
    	fn_updateGroupUsable(no, "N");
    } else if (sId == "btnUsable") {
    	fn_updateGroupUsable(no, "Y");
    } else if (sId == "btnPopEditArea") {
    	gfn_clearForm("frmSetArea");
    	fn_setAreaPopup(no, "U");
    } else if (sId == "btnCreateGroup") {
    	if ($("#mode").val() === "I") {
    		fn_createGroup(no);
    	} else {
    		fn_updateGroupArea(no);
    	}
    } else if (sId == "btnExcelExport") {
    	fn_excelExport();
    }
});

function fn_createGroup(no) {
	var frmId = "frmSetArea";
	if (gfn_checkRequired(frmId) === true) {
		var param = "";
		param += "groupCode="+$("#groupCode").val().toUpperCase();
		param += "&"+"userId="+$("#ownerId").val();
		param += "&"+"area="+$("#areaName").val();
		
		$('#dim-layer-set-area').fadeOut();
	    gf_send("<c:url value='/group/createGroup' />", param, "fn_createGroupCallback");
	}
}

function fn_createGroupCallback(data) {
	fn_getOwnerList(gvCurPage);
	
	gfn_layerPopup(data.msg);
}

function fn_updateGroupArea(no) {
    var frmId = "frmSetArea";
    if (gfn_checkRequired(frmId) === true) {
        var param = "";
        param += "groupCode="+$("#groupCode").val();
        param += "&"+"ownerId="+$("#ownerId").val();
        param += "&"+"area="+$("#areaName").val();
        
        $('#dim-layer-set-area').fadeOut();
        gf_send("<c:url value='/group/updateGroupArea' />", param, "fn_updateGroupAreaCallback");
    }
}

function fn_updateGroupAreaCallback(data) {
    fn_getOwnerList(gvCurPage);
    
    gfn_layerPopup(data.msg);
}

function fn_updateGroupUsable(no, usable) {
	var param = "";
	param += "groupCode="+$("#tdGroupCode-"+no).text();
	param += "&"+"ownerId="+$("#tdUserId-"+no).text();
	param += "&"+"usable="+usable;
	gf_send("<c:url value='/group/updateGroupUsable' />", param, "fn_updateGroupUsableCallback");
}

function fn_updateGroupUsableCallback(data) {
	fn_getOwnerList(gvCurPage);
    gfn_layerPopup(data.msg);
}

function fn_setAreaPopup(no, flag){
	$("#groupCode").val($("#tdGroupCode-"+no).text());
	$("#ownerId").val($("#tdUserId-"+no).text());
	$("#areaName").val($("#btnPopEditArea-"+no).val());
	$("#mode").val(flag);
	
	if (flag === 'U') {
		$("#groupCode").attr('readonly', true);
	} else {
		$("#groupCode").attr('readonly', false);
	}
	
    gfn_customLayerPopup('dim-layer-set-area', 'dimBgSetArea', 'set_area_layer', 'closeSetAreaPopup');
}

function fn_setArea(no) {
    var param = "area="+$("#areaName").val();
}

$(document).on("input", "#sKeyword", function(e){
    e.preventDefault();
    
    fn_getOwnerList(gvCurPage);
});

function fn_excelExport() {
    var param = "";
    param += "filename=owner-list";
    
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
</script>
</body>
</html>