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
        <%@ include file="../include/header_admin.jsp" %>
        <br>
			<%@ include file="../include/miniCalendar_admin.jsp"%>
        <div class="inner">
            
            <section>
                <header class="main">
                    <h2>강구선의 개쩌는 회원관리</h2>
                </header>
                
                <form id="frmMainFilter" name="frmMainFilter">
                    <input type="hidden" id="sKeyword" name="sKeyword" value=""/>
                    <div class="row">
                        <div class="2u 12u$(medium) select-wrapper">
                            <select id="cbSearchField" name="cbSearchField">
                                <option value="kdc.user_id">Owner ID</option>
                                <option value="grp.group_code">Group code</option>
                                <option value="kdc.product_name">Model name</option>
                                <option value="kdc.product_photo">Photo</option>
                                <option value="kdc.comment">Comment</option>
                            </select>
                        </div>
                        <div id="divSKeyword" class="2u 12u$(medium)">
                            <input type="text" name="txtKeyword" id="txtKeyword" value="" placeholder="keyword"/> 
                        </div>
                        <div id="divCbKeyword" class="2u 12u$(medium)">
                            <div class="select-wrapper">
                                <select id="cbKeyword" name="cbKeyword">
                                    <option value=""> -- Select model -- </option>
                                    <c:out value="${cbProductNameOptions }" escapeXml="false" />
                                </select>
                            </div>
                        </div>
                        <div class="1u 12u$(medium)"><h3>Approval</h3></div>
                        <div class="2u 12u$(medium) select-wrapper">
                            <select id="cbSearchApproval" name="cbSearchApproval">
                                <option value="">Select</option>
                                <option value="0">Not approved</option>
                                <option value="1">Approved</option>
                                <option value="2">Refused</option>
                            </select>
                        </div>
                    </div>
                </form>
                
                <div id="tblKDCApprovalList" class="table-wrapper">
                    <table class="alt">
                        <thead>
                            <tr>
                                <th width="10%" style="text-align:center;">순번</th>
                                <th width="10%" style="text-align:center;">요청일자</th>
                                <th width="15%" style="text-align:center;">법인</th>
                                <th width="15%" style="text-align:center;">부서</th>
                                <th width="15%" style="text-align:center;">이름</th>
                                <th width="10%" style="text-align:center;">이메일</th>
                                <th width="10%" style="text-align:center;">핸드폰 번호</th>
                                <th width="15%" style="text-align:center;">신청 사유</th>
                                <th width="15%" style="text-align:center;">회원 신청 상태</th>
                                <th width="15%" style="text-align:center;">관리자</th>
                                <th width="15%" style="text-align:center;">탈퇴 여부</th>
                            </tr>
                        </thead>
                        <tbody style="font-size:0.8em;">
                            <tr>
                                <td colspan="8" style="text-align:center;">There is no data.</td>
                            </tr>
                        </tbody>
                        <tfoot style="font-size:0.8em;">
                            <tr><td colspan="8" style="text-align:center;" id="tdPagination"></td></tr>
                        </tfoot>
                    </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- KDC Registration Approval popup layer -->
<div id="dim-layer-kdc-reg-approval" class="dim-layer">
    <div id="dimBgKDCRegistrationApproval" class="dimBg"></div>
    <div id="kdc_reg_approval_layer" class="popcont-layer" style="width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="kdcRegApprovalDiv" >
                    <form id="frmKDCRegistrationApproval" method="post">
                        <div class="row uniform">
                            <input type="hidden" name="kdcSeq" id="kdcSeq" value="" />
                            <div class="12u$ 12u$ row">
                                <div class="3u 12u$(small)" style="text-align:right;"><h5>Owner ID</h5></div>
                                <div class="9u$ 12u$(small)"><input type="text" name="userId" id="userId" value="" readonly="readonly"/></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="3u 12u$(small)" style="text-align:right;"><h5>Serial Number</h5></div>
                                <div class="9u$ 12u$(small)"><input type="text" name="serialNo" id="serialNo" value=""/></div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="3u 12u$(small)" style="text-align:right;"><h5>Model name</h5></div>
                                <div class="9u$ 12u$(small)">
                                    <div class="select-wrapper">
		                                <select id="cbProductName" name="cbProductName">
		                                    <option value=""> -- Select model -- </option>
		                                    <c:out value="${cbProductNameOptions }" escapeXml="false" />
		                                </select>
                                    </div>
                                </div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="3u 12u$(small)" style="text-align:right;"><h5>Approval</h5></div>
                                <div class="9u$ 12u$(small)">
	                            <div class="select-wrapper">
	                                <select name="cbApproval" id="cbApproval">
	                                    <option value="0"> --- Approval --- </option>
	                                    <option value="1">Approve</option>
	                                    <option value="2">Refuse</option>
	                                </select>
	                            </div>
	                            </div>
                            </div>
                            <div class="12u$ 12u$ row">
                                <div class="3u 12u$(small)" style="text-align:right;"><h5>Comment</h5></div>
                                <div class="9u$ 12u$(small)">
                                    <textarea name="comment" id="comment" placeholder="Enter your comment" rows="6"></textarea>
                                </div>
                            </div>
                            <div class="12u$ 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnKDCRegistrationApproval" id="btnKDCRegistrationApproval" value="Submit" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeKDCRegistrationApprovalPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- KDC Photo popup layer -->
<div id="dim-layer-kdc-photo" class="dim-layer">
    <div id="dimBgKDCPhoto" class="dimBg"></div>
    <div id="kdc_photo_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="kdcPhotoDiv" >
                    <form id="frmKDCPhoto" method="post">
                        <div class="row uniform">
                            <div id="kdcImage" class="12u 12u$"></div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeKDCPhotoPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Owner Info popup layer -->
<div id="dim-layer-OwnerInfo" class="dim-layer">
    <div id="dimBgOwnerInfo" class="dimBg"></div>
    <div id="OwnerInfo_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="OwnerInfoDiv" >
                    <form id="frmOwnerInfo" method="post">
                        <div class="row uniform">
                            <div class="6u 12u$(small)">
                                <input type="text" name="ownerId" id="ownerId" value="" placeholder="ID" readonly="readonly"/>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="ownerName" id="ownerName" value="" placeholder="Name" readonly="readonly" />
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="ownerEmail" id="ownerEmail" value="" placeholder="E-mail" readonly="readonly"/>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="ownerPhoneNo" id="ownerPhoneNo" value="" placeholder="Phone number" readonly="readonly" />
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="company" id="company" value="" placeholder="Company" readonly="readonly"/>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="country" id="country" value="" placeholder="Country" readonly="readonly" />
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeOwnerInfoPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Confirm user creation popup layer -->
<div id="dim-layer-confirm" class="dim-layer">
    <div id="dimBgConfirm" class="dimBg"></div>
    <div id="confirm_layer" class="pop-layer 12u$" style="width:400px;">
        <div class="pop-container">
            <div class="pop-conts">
            	<form id="frmConfirmLayer" method="post">
            		<input type="hidden" name="paramString" id="paramString" value="" />
            		
	                <!--// content-->
	                <div class="row uniform">
		                <div id="confirmDiv" class="12u 12u$">
		                    <p class="ctxt mb20">The user creation process proceeds.</p>
		                </div>
		                
		                <div class="12u 12u$">
		                    <ul class="actions vertical">
		                        <li><input type="button" name="btnConfirmOk" id="btnConfirmOk" value="OK" class="button special small fit" /></li>
		                    </ul>
		                </div>
		            </div>
                </form>
                
                <div class="btn-r" style="display:none;">
                    <a href="#" id="closeConfirmPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
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
                                <input type="text" name="newOwnerId" id="newOwnerId" value="" readonly="readonly" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="areaName" id="areaName" value="" required="required" placeholder="*Area(Mandatory)" maxlength="50" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnCreateGroup" id="btnCreateGroup" value="Create Mobile User" class="button special small fit" /></li>
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

<div id="mloader"><div class="masterkey_blink">In progress ...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    $("#divCbKeyword").css("display","none");
    fn_getKDCApprovalList(1);
});

function fn_getKDCApprovalList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getKDCApprovalList";
    var searchField = gfn_nullValue($("#cbSearchField").val());
    var sKeyword = gfn_nullValue($("#sKeyword").val());
    if (searchField != "" && sKeyword != "") {
        param += "&";
        param += "cbSearchField="+searchField;
        param += "&";
        param += "sKeyword="+sKeyword;
    }
    var searchApproval = gfn_nullValue($("#cbSearchApproval").val());
    if (searchApproval != "") {
        param += "&";
        param += "cbSearchApproval="+searchApproval;
    }
    
    gf_send("<c:url value='/manager/adminManagement/getKdcApprovalList' />", param, "fn_getKDCApprovalListCallback");
}

function fn_getKDCApprovalListCallback(data) {
    var list = data.kdcApprovalList;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblKDCApprovalList(list, paginationHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnKDCRegistrationApproval, #btnConfirmOk, #btnCreateGroup";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

$(document).on("click", "#tblKDCApprovalList tbody td div", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];
    
    if (sId === "divPhoto") {
    	fn_popImage($("#ownerId-"+no).val(),$("#kdcSeq-"+no).val());
    } else if (sId === "divApprovalText") {
    	gfn_clearForm("frmKDCRegistrationApproval");
        fn_layerKDCRegistrationApprovalPopup($("#kdcSeq-"+no).val(),$("#ownerId-"+no).val(),$("#tdGroupCode-"+no).text(),$("#tdSerialNo-"+no).text(),$("#productCode-"+no).val(),$("#divApproval-"+no).val(),$("#tdComment-"+no).text());
    } else if (sId === "divOwnerId") {
    	fn_getOwnerInfo($("#ownerId-"+no).val());
    }
});

//key press event
var strKeypressEventNm  = "";
strKeypressEventNm += "#serialNo, #productPhoto";
$(document).on("keypress", strKeypressEventNm, function(e){
    var id = $(this).attr("id");
    
    if(e.keyCode == 13){
        return false;
    }
});

function fn_testCallback() {
	
}
function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnKDCRegistrationApproval") {
        fn_kdcRegistrationApproval();
    	//gf_send("<c:url value='/WSApi/wsTest' />", "area=marketingtest", "fn_testCallbak");
    }
    
    if (args[0] === "btnConfirmOk") {
    	$('#dim-layer-confirm').fadeOut();
    	fn_setAreaPopup($("#paramString").val());
    }
    
    if (args[0] === "btnCreateGroup") {
    	fn_createMobileUser($("#newOwnerId").val(), $("#areaName").val());
    }
}

function fn_layerKDCRegistrationApprovalPopup(kdcSeq, userId, groupCode, serialNo, productCode, approval, comment){
	$("#kdcSeq").val(kdcSeq);
	$("#userId").val(userId);
	$("#groupCode").val(groupCode);
    $("#serialNo").val(serialNo);
    $("#cbProductName").val(productCode);
    $("#cbProductName option:eq("+productCode+")").attr('selected', 'selected');
    $("#cbApproval").val(approval);
    $("#cbApproval option:eq("+approval+")").attr('selected', 'selected');
    $("#comment").val(comment);
    
    gfn_customLayerPopup('dim-layer-kdc-reg-approval', 'dimBgKDCRegistrationApproval', 'kdc_reg_approval_layer', 'closeKDCRegistrationApprovalPopup');
}

function fn_kdcRegistrationApproval() {
    var frmId = "frmKDCRegistrationApproval";
    
    if ($("#cbApproval").val() === "0") {
    	gfn_layerPopup("Approval is required.");
    	return false;
    }
    
    if ($("#cbApproval").val() === "2" && !$("#comment").val()) {
    	gfn_layerPopup("Please enter reason for refusal.");
        return false;
    }
    
    var reg = /^[0-9]*$/;
    var sNo = gfn_nullValue($("#serialNo").val()).trim();
    var pName = gfn_nullValue($("#cbProductName").val()).trim();
    //console.log('sNo='+sNo+', pNmae='+pName);
    
    var cbParam = {
    		approvalFlag: $("#cbApproval").val(),
    		userId: $("#userId").val()
    };
    //console.log('cbParam.approvalFlag='+cbParam.approvalFlag+', cbParam.userId='+cbParam.userId);
    $('#dim-layer-kdc-reg-approval').fadeOut();
	$("#mloader").css("display", "block");
	gf_sendFormWithParamForCallback(frmId, "<c:url value='/manager/adminManagement/kdcApproval' />", "fn_kdcRegistrationApprovalCallback", cbParam);
	/*
    if (sNo == "" || sNo.length != 6 || !reg.test(sNo)) {
    	gfn_layerPopup("You have entered the wrong serial number.");
    	return false;
    } else if (pName == "") {
    	gfn_layerPopup("Please enter the product name.");
        return false;
    }  else {
    	$('#dim-layer-kdc-reg-approval').fadeOut();
    	$("#mloader").css("display", "block");
    	gf_sendForm(frmId, "<c:url value='/manager/adminManagement/kdcApproval' />", "fn_kdcRegistrationApprovalCallback");
    }
	*/
}

function fn_kdcRegistrationApprovalCallback(data, cbParam) {
	$("#mloader").css("display", "none");
	
    if (data.flag === "success") {
    	fn_getKDCApprovalList(1);
    	
    	if (cbParam.approvalFlag === '1' && data.activated === 'N') {
    		fn_confirmPopup(data.msg, cbParam.userId);
    	} else {
    		gfn_layerPopup(data.msg);
    	}
    } else {
    	gfn_layerPopup(data.msg);
    }
    
    cbParam.approvalFlag = '';
    cbParam.userId = '';
}

function fn_makeTblKDCApprovalList(list, paginationHtml) {
    var bodyHtml = "";
    var pageHtml = "";
    if (list != null && list.length > 0) {
        for(var i=0; i<list.length; i++) {
            bodyHtml += "<tr>";
            bodyHtml += "    <input type=\"hidden\" id=\"kdcSeq-"+i+"\" name=\"kdcSeq-"+i+"\" value=\""+list[i].kdcSeq+"\" />";
            bodyHtml += "    <input type=\"hidden\" id=\"productCode-"+i+"\" name=\"productCode-"+i+"\" value=\""+list[i].productCode+"\" />";
            bodyHtml += "    <input type=\"hidden\" id=\"divSerialNo-"+i+"\" name=\"divSerialNo-"+i+"\" value=\""+gfn_nullValue(list[i].serialNo)+"\" />";
            bodyHtml += "    <input type=\"hidden\" id=\"divApproval-"+i+"\" name=\"divApproval-"+i+"\" value=\""+gfn_nullValue(list[i].approval)+"\" />";
            bodyHtml += "    <input type=\"hidden\" id=\"ownerId-"+i+"\" name=\"ownerId-"+i+"\" value=\""+gfn_nullValue(list[i].userId)+"\" />";
            bodyHtml += "    <td id=\"tdUserId-"+i+"\" style=\"text-align:center;\">";
            bodyHtml += "        <div id=\"divOwnerId-"+i+"\">"+gfn_nullValue(list[i].userId)+"</div>";
            bodyHtml += "    </td>";
            bodyHtml += "    <td id=\"tdGroupCode-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].groupCode)+"</td>";
            bodyHtml += "    <td id=\"tdSerialNo-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].serialNo)+"</td>";
            bodyHtml += "    <td id=\"tdProductName-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].productName)+"</td>";
            bodyHtml += "    <td style=\"text-align:center;\">";
            bodyHtml += "        <div id=\"divPhoto-"+i+"\">"+gfn_nullValue(list[i].productPhoto)+"</div>";
            bodyHtml += "    </td>";
            bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(list[i].registrationDate)+"</td>";
            bodyHtml += "    <td id=\"tdApproval-"+i+"\" style=\"text-align:center;\">";
            bodyHtml += "        <div id=\"divApprovalText-"+i+"\">"+gfn_nullValue(list[i].approvalText)+"</div>";
            bodyHtml += "    </td>";
            bodyHtml += "    <td id=\"tdComment-"+i+"\" >"+gfn_nullValue(list[i].comment)+"</td>";
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
    } else {
        bodyHtml += "<tr><td colspan=\"8\" style=\"text-align:center;\">There is no data.</td></tr>";
    }
    
    $("#tblKDCApprovalList tbody").html(bodyHtml);
    $("#tblKDCApprovalList tfoot #tdPagination").html(pageHtml);
}

function fn_popImage(userId, kdcSeq) {
	var param = "";
	param += "userId="+userId;
	param += "&";
	param += "kdcSeq="+kdcSeq;
	
    gf_send("<c:url value='/manager/adminManagement/getKDCPhoto' />", param, "fn_popImageCallbak");
}

function fn_popImageCallbak(data) {
	var param = "";
	param += "?fileClass=KDC";
	param += "&filename="+data.kdcPhoto.filename;
    var cUrl = "<c:url value='/common/viewImage"+param+"' />";
    var imgHtml = "<img src='"+cUrl+"' style='max-height:600px;width:auto;' />";

    $("#kdcImage").html("");
    $("#kdcImage").html(imgHtml);
    
    gfn_customLayerPopup('dim-layer-kdc-photo', 'dimBgKDCPhoto', 'kdc_photo_layer', 'closeKDCPhotoPopup');
}

$(document).on("change", "#cbSearchApproval, #cbSearchField, #cbKeyword", function(e){
    e.preventDefault();
    
    var id = $(this).attr("id");
    var val = gfn_nullValue($(this).val());
    
    if (id === "cbSearchApproval") {
        //fn_getKDCApprovalList(1);
    } else if (id === "cbSearchField") {
        if (val === "kdc.product_name") {
            $("#divSKeyword").css("display","none");
            $("#divCbKeyword").css("display","block");
            $("#sKeyword").val($("#cbKeyword").val());
        } else {
            $("#divSKeyword").css("display","block");
            $("#divCbKeyword").css("display","none");
            $("#sKeyword").val($("#txtKeyword").val());
        }
    } else if (id === "cbKeyword") {
        $("#sKeyword").val(val);
    }
    fn_getKDCApprovalList(1);
});

$(document).on("input", "#txtKeyword", function(e){
    e.preventDefault();
    
    $("#sKeyword").val($(this).val());
    fn_getKDCApprovalList(1);
});

function fn_getOwnerInfo(ownerId) {
	var param = "";
	param += "ownerId="+ownerId;
	
	gf_send("<c:url value='/manager/adminManagement/getOwnerInfo' />", param, "fn_getOwnerInfoCallbak");
}

function fn_getOwnerInfoCallbak(data){
	if (data.flag == 'success') {
		var ownerInfo = data.ownerMap;
		
		$("#ownerId").val(ownerInfo.userId);
		$("#ownerName").val(ownerInfo.userName);
		$("#ownerEmail").val(ownerInfo.userEmail);
	    $("#ownerPhoneNo").val(ownerInfo.phone);
	    $("#company").val(ownerInfo.company);
	    $("#country").val(ownerInfo.countryName);
	    
	    gfn_customLayerPopup('dim-layer-OwnerInfo', 'dimBgOwnerInfo', 'OwnerInfo_layer', 'closeOwnerInfoPopup');
	} else {
		gfn_layerPopup(data.msg);
	}
}

function fn_createMobileUser(userId, area) {
	if (userId == null || userId == '' || userId =='undefined') {
		gfn_layerPopup("Error occured. Please contact administrator.");
		return false;
	}
	
	if (area == null || area == '' || area =='undefined') {
		gfn_layerPopup("Please enter the area.");
		return false;
	}
	
	var param = "";
	param += "userId="+userId;
	param += "&area="+area;
	param += "&userType=0";
	
	gf_send("<c:url value='/admin/userManagement/createMobileUser' />", param, "fn_createMobileUserCallbak");
}

function fn_createMobileUserCallbak(data) {
	$('#dim-layer-set-area').fadeOut();
	
	gfn_layerPopup(data.msg);
}

function fn_setAreaPopup(userId){
	$("#newOwnerId").val(userId);
	$("#areaName").val('');
	
    gfn_customLayerPopup('dim-layer-set-area', 'dimBgSetArea', 'set_area_layer', 'closeSetAreaPopup');
}

function fn_confirmPopup(msg, userId) {
	var msgHtml = msg + '<br>The user creation process proceeds.<br>';
	$("#confirmDiv").html("");
	$("#confirmDiv").html(msgHtml);
	
	$("#paramString").val('');
	$("#paramString").val(userId);
	
	gfn_customLayerPopup('dim-layer-confirm', 'dimBgConfirm', 'confirm_layer', 'closeConfirmPopup');
}
</script>
</body>
</html>