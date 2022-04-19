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
    <title><spring:message code='MENU-APPLICATIONS' text='Applications' /> - KoamTacON</title>
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
                    <h2><spring:message code='MENU-INTRODUCTION' text='Introduction' /></h2>
                </header>
                
                <div id="divRequest" class="12u$ 12u$(small)"></div>
                
                <div id="divApproval" class="12u$ 12u$(small)" style="text-align:center;"></div>
                
                <div id="divBtn" class="12u$ 12u$(small)"></div>
                
                <div id="divIntroductionView" class="12u$ 12u$(small)"></div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvUserType = "";
var gvGroupCode = "";
var gvApplicationSeq = "";
var gvManualFiles = "";

$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gvUserType = "<c:out value='${__userType }' />";
    gvGroupCode = gfn_nullValue("<c:out value='${__groupCode }' />");
    gvApplicationSeq = gfn_nullValue("<c:out value='${applicationSeq }' />");
    if (gvApplicationSeq === "") {
    	gvApplicationSeq = "0";
    }
    
    fn_getApplicationMap(gvApplicationSeq);
});

function fn_getApplicationMap(applicationSeq) {
    var param = "";
    param += "applicationSeq="+applicationSeq;
    gf_send("<c:url value='/applications/getApplicationMap' />", param, "fn_getApplicationMapCallback");
}

function fn_getApplicationMapCallback(data) {
	var divBtnId = "";
	var applicationSeq = data.applicationMap.applicationSeq;
	console.log("seq="+applicationSeq);
	if (applicationSeq == "0") {
		divBtnId = "btnInventory";
	} else if (applicationSeq == "1") {
		divBtnId = "btnPurchase";
	} else if (applicationSeq == "2") {
		divBtnId = "btnRetail";
	}
	
	fn_makeDivBtn(divBtnId);
    fn_makeDivRequest(data.applicationMap, data.screenShots, data.manual);
}

function fn_makeDivRequest(applicationMap, screenShots, manual) {
    var divHtml = "";
    
    if (screenShots != null && screenShots.length > 0) {
        divHtml += "<div class=\"box alt\">";
        divHtml += "    <div class=\"row uniform\" style=\"text-align:center;\">";
        for(var i=0; i<4; i++) {
            divHtml += "        <div class=\"2u 12u$(small)\">";
            if(screenShots.length >= i+1) {
                divHtml += "            <span class=\"image fit\">";
                divHtml += "                <img src=\"/common/viewImage?fileClass=App&filename="+screenShots[i].filename+"\" style=\"max-width:250px;height:auto;\" />";
                divHtml += "            </span>";
            }
            divHtml += "        </div>";
        }
        divHtml += "    </div>";
        divHtml += "</div>";
    }
    divHtml += "    <div>"+applicationMap.applicationIntroduction+"</div>";
    //divHtml += "    <div>";
    //divHtml += "        <ul class=\"actions\">";
    //divHtml += "            <li><a href=\"<c:url value='"+applicationMap.tutorialUrl+"' />\" target=\"_blank\" class=\"button special\" >TUTORIAL</a></li>";
    //divHtml += "            <li><input type=\"button\" name=\"btnManual\" id=\"btnManual\" value=\"Manual\" class=\"button special\" /></li>";
    //divHtml += "        </ul>";
    //divHtml += "    </div>";
    divHtml += "    <h3><spring:message code='WRD-TUTORIAL' text='Tutorial' /></h3>";
    divHtml += "    <div id=\"divTutorial\">"+applicationMap.tutorialUrl+"</div>";
    
    if (manual != null && manual.length > 0) {
    	gvManualFiles = manual[0].filename;
    }
    
    $("#divIntroductionView").html("");
    $("#divIntroductionView").html(divHtml);
}

function fn_makeDivBtn(divBtnId) {
    var divHtml = "";

    divHtml += "<ul class=\"actions\">";
    divHtml += "    <li><input type=\"button\" name=\"btnInventory\" id=\"btnInventory\" value=\"<spring:message code='WRD-INVENTORY' text='Inventory' />\" class=\"button\" /></li>";
    divHtml += "    <li><input type=\"button\" name=\"btnPurchase\" id=\"btnPurchase\" value=\"<spring:message code='WRD-PURCHASEOD' text='Purchase Order' />\" class=\"button\" /></li>";
    divHtml += "    <li><input type=\"button\" name=\"btnRetail\" id=\"btnRetail\" value=\"<spring:message code='WRD-RETAIL' text='Retail' />\" class=\"button\" /></li>";
    divHtml += "    <li><input type=\"button\" name=\"btnDelivery\" id=\"btnDelivery\" value=\"<spring:message code='WRD-DELIVERY' text='Delivery' />\" class=\"button\" /></li>";
    divHtml += "    <li><input type=\"button\" name=\"btnRental\" id=\"btnRental\" value=\"<spring:message code='WRD-RENTAL' text='Rental' />\" class=\"button\" /></li>";
    divHtml += "    <li><input type=\"button\" name=\"btnFieldService\" id=\"btnFieldService\" value=\"<spring:message code='WRD-FIELDSVC' text='Field Service' />\" class=\"button\" /></li>";
    divHtml += "    <li><input type=\"button\" name=\"btnTicketValidation\" id=\"btnTicketValidation\" value=\"<spring:message code='WRD-TICKETVALID' text='Ticket Validation' />\" class=\"button\" /></li>";
    divHtml += "</ul>";
    
    $("#divBtn").html("");
    $("#divBtn").html(divHtml);
    
    if (!$("#"+divBtnId).hasClass("special")) {
        $("#"+divBtnId).toggleClass("special");
    }
}

var strClickEventNm  = "";
strClickEventNm += "#btnInventory, #btnPurchase, #btnRetail";
strClickEventNm += ", #btnDelivery, #btnRental, #btnFieldService, #btnTicketValidation";
strClickEventNm += ", #btnManual";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction(id) {
    if (id === "btnInventory") {
    	fn_getApplicationMap("0");
    } else if (id === "btnPurchase") {
        fn_getApplicationMap("1");
    } else if (id === "btnRetail") {
    	fn_getApplicationMap("2");
    } else if (id === "btnDelivery") {
        fn_getApplicationMap("3");
    } else if (id === "btnRental") {
        fn_getApplicationMap("4");
    } else if (id === "btnFieldService") {
        fn_getApplicationMap("5");
    } else if (id === "btnTicketValidation") {
        fn_getApplicationMap("6");
    } else if ( id === "btnManual") {
    	fn_manualDownload();
    }
}

function fn_manualDownload() {
    var param = "";
    param += "flag="+"manual";
    param += "&";
    param += "filename="+gvManualFiles;
    
    gf_genFileDownLoad(param);
}
</script>
</body>
</html>