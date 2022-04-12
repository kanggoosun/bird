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
    <title><spring:message code='WRD-KDCREG' text='KDC Registration' /> - KoamTacON</title>
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
                    <h2><spring:message code='WRD-KDCREG' text='KDC Registration' /></h2>
                </header>
                <ul class="actions">
                	<li><input type="button" name="btnPopKDCRegistration" id="btnPopKDCRegistration" value="<spring:message code='WRD-KDCREG' text='KDC Registration' />" class="button special small" /></li>
                	<li><input type="button" name="btnExcelDownload" id="btnExcelDownload" value="<spring:message code='WRD-EXLTMLDWN' text='Excel template download' />" class="button special small" /></li>
                    <li><input type="button" name="btnExcelRegistration" id="btnExcelRegistration" value="<spring:message code='WRD_KDCREGEXL' text='KDC Registration with excel' />" class="button special small" /></li>
                </ul>
                <div id="divGuide" class="12u$ 12u$(small)">
                    <ul>
                        <li><spring:message code='MSG-VW028' text='Click the KDC Registration button to register your KDC product.' /></li>
                        <li><spring:message code='MSG-VW029' text='Once you register the KDC, The KOAMTACON team will contact you once your devices have been reviewed regarding next steps.' /></li>
                        <li><spring:message code='MSG-VW030' text='If you have multiple KDCs you want to register, you can also register them using Excel.' /></li>
                        <li id="liHowTo"><spring:message code='MSG-VW031' text='How to register KDC products using Excel.' /> <div id="divClickTitle">(<spring:message code='WRD-CLKEXP' text='Click to expand' />)</div></li>
                        <ol id="divHowTo" style="display:none;">
                       		<li><spring:message code='MSG-VW032' text='Click the excel template download button above to download the Excel template file.' /></li>
                       		<li><spring:message code='MSG-VW033' text='When the download confirmation window appears, select Save File to download the template file.' /></li>
                       		<li><spring:message code='MSG-VW034' text='Please open the downloaded Excel file and enter the KDC product to register.' /></li>
                       		<li><spring:message code='MSG-VW035' text='Click the Select File button and select the Excel file you created above.' /></li>
                       		<li><spring:message code='MSG-VW036' text='Once you have selected the file, click the registration button.' /></li>
                       		<li><spring:message code='MSG-VW037' text='When registration is complete, a message is displayed.' /></li>
                    	</ol>
                    </ul>
                </div>
                
                <form id="frmMainFilter" name="frmMainFilter">
                    <input type="hidden" id="sKeyword" name="sKeyword" value=""/>
                    <div class="row">
                        <div class="2u 12u$(medium) select-wrapper">
                            <select id="cbSearchField" name="cbSearchField">
                                <option value="kdc.serial_no"><spring:message code='WRD-SN' text='S/N' /></option>
                                <option value="kdc.product_name"><spring:message code='WRD-MODLNM' text='Model name' /></option>
                                <option value="kdc.product_photo"><spring:message code='WRD-PHOTO' text='Photo' /></option>
                                <option value="kdc.comment"><spring:message code='WRD-COMMENT' text='Comment' /></option>
                            </select>
                        </div>
                        <div id="divSKeyword" class="2u 12u$(medium)">
                            <input type="text" name="txtKeyword" id="txtKeyword" value="" placeholder="keyword"/> 
                        </div>
                        <div id="divCbKeyword" class="2u 12u$(medium)">
                            <div class="select-wrapper">
                                <select id="cbKeyword" name="cbKeyword">
                                    <option value=""> <spring:message code='MSG-VW038' text='-- Select model --' /> </option>
                                    <c:out value="${cbProductNameOptions }" escapeXml="false" />
                                </select>
                            </div>
                        </div>
                        <div class="1u 12u$(medium)"><h3><spring:message code='WRD-APPRVL' text='Approval' /></h3></div>
                        <div class="2u 12u$(medium) select-wrapper">
                            <select id="cbSearchApproval" name="cbSearchApproval">
                                <option value=""><spring:message code='WRD-SELECT' text='Select' /></option>
                                <option value="0"><spring:message code='WRD-NTAPPRVD' text='Not approved' /></option>
                                <option value="1"><spring:message code='WRD-APPRVD' text='Approved' /></option>
                                <option value="2"><spring:message code='WRD-REFUSED' text='Refused' /></option>
                            </select>
                        </div>
                    </div>
                </form>
                
                <div id="tblKDCList" class="table-wrapper">
                    <table class="alt">
                        <thead>
                            <tr>
                                <th width="20%" style="text-align:center;"><spring:message code='WRD-SN' text='S/N' /></th>
                                <th width="10%" style="text-align:center;"><spring:message code='WRD-MODLNM' text='Model Name' /></th>
                                <th width="20%" style="text-align:center;"><spring:message code='WRD-PHOTO' text='Photo' /></th>
                                <th width="20%" style="text-align:center;"><spring:message code='WRD-REGDATE' text='Registration Date' /></th>
                                <th width="10%" style="text-align:center;"><spring:message code='WRD-APPRVL' text='Approval' /></th>
                                <th width="20%" style="text-align:center;"><spring:message code='WRD-COMMENT' text='Comment' /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="6" style="text-align:center;"><spring:message code='MSG-VW039' text='There is no data.' /></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="6" style="text-align:center;" id="tdPagination"></td>
                            </tr>
                            <!--
                            <tr>
                                <td colspan="6" style="text-align:right;" id="tdButton">
                                    <ul class="actions">
                                        <li><input type="button" name="btnExcelDownload" id="btnExcelDownload" value="Excel template download" class="button special small" /></li>
	                                    <li><input type="button" name="btnExcelRegistration" id="btnExcelRegistration" value="KDC Registration with excel" class="button special small" /></li>
	                                    <li><input type="button" name="btnPopKDCRegistration" id="btnPopKDCRegistration" value="KDC Registration" class="button special small" /></li>
                                    </ul>
                                </td>
                            </tr>
                            -->
                        </tfoot>
                    </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- KDC Registration popup layer -->
<div id="dim-layer-kdc-reg" class="dim-layer">
    <div id="dimBgKDCRegistration" class="dimBg"></div>
    <div id="kdc_reg_layer" class="popcont-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="kdcRegDiv" >
                    <form id="frmKDCRegistration" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="sUserId" id="sUserId" value="" />
                        <input type="hidden" name="sEmail" id="sEmail" value="" />
                        <div class="row uniform">
                            <div class="12u 12u$">
                            	<ul>
                            		<li><spring:message code='MSG-VW040' text='Please enter serial number, model name and photo file of your KDC.' /></li>
                            		<li><spring:message code='MSG-VW041' text='S/N and model name is mandatory, but not a photo.' /></li>
                            		<li><spring:message code='MSG-VW042' text='Please enter only the last 6 digits of the serial number.' /></li>
                            	</ul>
                            </div>
                            <div class="12u 12u$">
                                <input type="text" name="serialNo" id="serialNo" value="" placeholder="*<spring:message code='WRD-SERLNO' text='Serial Number' />" maxlength="50" />
                            </div>
                            <div class="12u 12u$(small)">
                                <div class="select-wrapper">
                                    <select id="cbProductName" name="cbProductName">
                                      <option value=""> -- <spring:message code='MSG-VW038' text='Select model' /> -- </option>
                                      <c:out value="${cbProductNameOptions }" escapeXml="false" />
                                    </select>
                                </div>
                            </div>
                            <div class="12u 12u$">
                                <input type="file" name="productPhoto" id="productPhoto" value="" placeholder="<spring:message code='WRD-PHOTOKDC' text='Photo of KDC' />" maxlength="200" accept="image/*" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnKDCRegistration" id="btnKDCRegistration" value="<spring:message code='WRD-REG' text='Register' />" class="button special small fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeKDCRegistrationPopup" class="btn-layerClose">Close</a>
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
                        <input type="hidden" name="eUserId" id="eUserId" value="" />
                        <input type="hidden" name="eEmail" id="eEmail" value="" />
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
                    <a href="#" id="closeExcelPopup" class="btn-layerClose">Close</a>
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
                    <a href="#" id="closeKDCPhotoPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mloader"><div class="masterkey_blink"><spring:message code='WRD-INPRGRS' text='In progress' /> ...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvUserId = "";
var gvEmail = "";

$(document).ready(function(){
	var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    $("#divCbKeyword").css("display","none");
    gvUserId = "<c:out value='${userId}' />";
    gvEmail = "<c:out value='${email}' />";
    //console.log("log start gvUserId="+gvUserId+", gvEmail="+gvEmail);
    fn_getKDCList(1);
});

function fn_getKDCList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getKDCList";
    param += "&";
    param += "userId="+gvUserId;
    param += "&";
    param += "email="+gvEmail;
    
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
    
    gf_send("<c:url value='/kdc/getKDCList' />", param, "fn_getKDCListCallback");
}

function fn_getKDCListCallback(data) {
	var list = data.kdcList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblKDCList(list, paginationHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnPopKDCRegistration, #btnKDCRegistration, #btnExcelRegistration, #btnExcelDownload, #btnExcelUpload";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

$(document).on("click", "#tblKDCList tbody td div", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var no = id.split("-")[1];

    fn_popImage($("#kdcSeq-"+no).val());
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

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnPopKDCRegistration") {
    	$("#serialNo").focus();
    	gfn_clearForm("frmKDCRegistration");
    	fn_layerKDCRegistrationPopup();
    } else if (args[0] === "btnKDCRegistration") {
    	fn_kdcRegistration();
    } else if (args[0] === "btnExcelDownload") {
    	fn_excelDownload();
    } else if (args[0] === "btnExcelRegistration") {
    	fn_excelPopup();
    } else if (args[0] === "btnExcelUpload") {
    	fn_excelRegistration();
    }
}

function fn_layerKDCRegistrationPopup(){
	$("#sUserId").val(gvUserId);
    $("#sEmail").val(gvEmail);
	gfn_customLayerPopup('dim-layer-kdc-reg', 'dimBgKDCRegistration', 'kdc_reg_layer', 'closeKDCRegistrationPopup');
}

function fn_kdcRegistration() {
	var flag = gf_getBrowserCheck();
	
	var frmId = "frmKDCRegistration";
	var sNo = gfn_nullValue($("#serialNo").val());
	var pName = gfn_nullValue($("#cbProductName").val());
	var photo = gfn_nullValue($("#productPhoto").val());
	
	if (sNo === "" && pName === "" && photo === "") {
		gfn_layerPopup("<spring:message code='MSG-VW043' text='You must enter the serial number and model name or the photo of your kdc.' />");
	} else if ((sNo === "" && photo === "") || (pName === "" && photo === "")) {
		gfn_layerPopup("<spring:message code='MSG-VW043' text='You must enter the serial number and model name or the photo of your kdc.' />");
	} else {
		var reg = /^[0-9]*$/;

		if ((sNo != "" && sNo.length != 6) || !reg.test(sNo)){
			gfn_layerPopup("<spring:message code='MSG-VW044' text='You have entered the wrong serial number.' />");
		} else {
	        $('#dim-layer-kdc-reg').fadeOut();
	        $("#mloader").css("display", "block");
	        gf_sendFileForm(frmId, "<c:url value='/kdc/registKDC' />", "fn_kdcRegistrationCallback");
		}
	}
}

function fn_kdcRegistrationCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getKDCList(1);
	}
	
}

function fn_makeTblKDCList(list, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	
    if (list != null && list.length > 0) {
    	for(var i=0; i<list.length; i++) {
    		var productPhoto = gfn_nullValue(list[i].productPhoto);
    		bodyHtml += "<tr>";
    		bodyHtml += "    <td id=\"tdSerialNo-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].serialNo)+"</td>";
    		bodyHtml += "    <td id=\"tdProductName-"+i+"\" style=\"text-align:center;\">"+gfn_nullValue(list[i].productName)+"</td>";
    		bodyHtml += "    <td style=\"text-align:center;\">";
    		bodyHtml += "        <div id=\"divPhoto-"+i+"\">"+gfn_nullValue(list[i].productPhoto);
    		if (productPhoto != null && productPhoto != "" && productPhoto != "undefined") {
    			bodyHtml += " <img src=\"/resources/images/icon/icon_document.png\" alt=\"\" style=\"max-height:20px;width:auto;\" />";
    		}
    		bodyHtml += "        </div>";
    		bodyHtml += "        <input type=\"hidden\" id=\"kdcSeq-"+i+"\" name=\"kdcSeq-"+i+"\" value=\""+list[i].kdcSeq+"\" />";
    		bodyHtml += "        <input type=\"hidden\" id=\"divSerialNo-"+i+"\" name=\"divSerialNo-"+i+"\" value=\""+gfn_nullValue(list[i].serialNo)+"\" />";
    		bodyHtml += "    </td>";
    		bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(list[i].registrationDate)+"</td>";
    		bodyHtml += "    <td style=\"text-align:center;\">"+gfn_nullValue(list[i].approvalText)+"</div></td>";
    		bodyHtml += "    <td>"+gfn_nullValue(list[i].comment)+"</div></td>";
    		bodyHtml += "</tr>";
    	}
    	pageHtml = paginationHtml;
    } else {
    	bodyHtml += "<tr><td colspan=\"6\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
    }
    
    $("#tblKDCList tbody").html(bodyHtml);
    $("#tblKDCList tfoot #tdPagination").html(pageHtml);
}

function fn_popImage(kdcSeq) {
	var param = "";
	param += "kdcSeq="+kdcSeq;
	param += "&";
    param += "userId="+gvUserId;
    
	gf_send("<c:url value='/kdc/getKDCPhoto' />", param, "fn_popImageCallbak");
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

function fn_excelDownload() {
	var param = "";
	param += "flag="+"template";
	param += "&";
	param += "filename="+"TemplateForKDCRegistration.xlsx";
	param += "&";
    param += "userId="+gvUserId;
    param += "&";
    param += "email="+gvEmail;
	
	gf_genFileDownLoad(param);
}

function fn_excelPopup() {
	$("#excelFile").val("");
	$("#eUserId").val(gvUserId);
    $("#eEmail").val(gvEmail);
	gfn_customLayerPopup('dim-layer-excel', 'dimBgExcel', 'excel_layer', 'closeExcelPopup');
}

function fn_excelRegistration() {
	var frmId = "frmExcel";

	if (gfn_checkRequired(frmId) === true) {
		$('#dim-layer-excel').fadeOut();
		$("#mloader").css("display", "block");
		gf_sendFileForm(frmId, "<c:url value='/kdc/registKDCWithExcel' />", "fn_excelRegistrationCallback");
	}
}

function fn_excelRegistrationCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
	if (data.flag === "success") {
		fn_getKDCList(1);
	}
}

$(document).on("change", "#cbSearchApproval, #cbSearchField, #cbKeyword", function(e){
	e.preventDefault();
	
	var id = $(this).attr("id");
	var val = gfn_nullValue($(this).val());
	
	if (id === "cbSearchApproval") {
		//fn_getKDCList(1);
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
	fn_getKDCList(1);
});

$(document).on("input", "#txtKeyword", function(e){
    e.preventDefault();
    
    $("#sKeyword").val($(this).val());
    fn_getKDCList(1);
});

$(document).on("click", "#liHowTo", function(e) {
	if ($("#divHowTo").css("display") == "none") {
	    $("#divHowTo").css("display", "block");
	    $("#divClickTitle").html("(Click to collapse)");
	} else if ($("#divHowTo").css("display") == "block") {
	    $("#divHowTo").css("display", "none");
	    $("#divClickTitle").html("(Click to expand)");
	}
});
</script>
</body>
</html>