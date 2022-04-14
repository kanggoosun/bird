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
            <!-- Content -->
            <section>
                
                <header class="main">
                    <h2><spring:message code='MENU-APPLICATIONS' text='Applications' /></h2>
                </header>
                <div id="divApplicationList" class="posts"></div>
                
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvGroupCode = '';
$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gvGroupCode = "<c:out value='${__groupCode }' />";
    fn_getApplicationList();
});

function fn_getApplicationList() {
    var param = "";
    
    gf_send("<c:url value='/main/getApplicationList' />", param, "fn_getApplicationListCallback");
}

function fn_getApplicationListCallback(data) {
    var applicationList = data.applicationList;
    
    fn_makeTblApplicationList(applicationList);
}

function fn_makeTblApplicationList(applicationList) {
	var divHtml = "";
	
	if (applicationList != null && applicationList.length > 0) {
		for(var i=0; i<applicationList.length; i++) {
			divHtml += "<article>";
            divHtml += "    <input type=\"hidden\" id=\"applicationSeq-"+i+"\" name=\"applicationSeq-"+i+"\" value=\""+applicationList[i].applicationSeq+"\">";
            divHtml += "    <div class=\"12u$ 12u$(small)\">";
            divHtml += "        <h3>"+applicationList[i].applicationName+"</h3>";
            
			var param = "";
			var cUrl = "";
            var imgHtml = "";
            if(applicationList[i].filename != null && applicationList[i].filename.length > 0) {
				param += "?fileClass=App";
			    param += "&filename="+applicationList[i].filename;
			    cUrl = "<c:url value='/common/viewImage"+param+"' />";
			    imgHtml = "<img src='"+cUrl+"' style='width:auto;max-height:100px;' />";
			    divHtml += "        <span class=\"image left\">"+imgHtml+"</span>";
			}
            
			divHtml += "        <p style=\"word-wrap:break-all;\">"+applicationList[i].applicationDescription+"</p>";
			divHtml += "    </div>";
			divHtml += "    <div class=\"12u$ 12u$(small)\" style=\"text-align:right;\">";
			divHtml += "        <ul class=\"actions\">";
			//divHtml += "            <li><input type=\"button\" name=\"btnToAppIntro-"+i+"\" id=\"btnToAppIntro-"+i+"\" value=\"More\" class=\"button small btnDynamic\" /></li>";
			if (gfn_nullValue(gvGroupCode) != '') {
			    divHtml += "            <li><input type=\"button\" name=\"btnToAppPage-"+i+"\" id=\"btnToAppPage-"+i+"\" value=\"<spring:message code='WRD-VIEWDATA' text='View Data' />\" class=\"button small special btnDynamic\" /></li>";
			}
			divHtml += "        </ul>";
			divHtml += "    </div>";
			divHtml += "</article>";
		}
	} else {
		divHtml += "<article><spring:message code='MSG-VW026=' text='There is no application.' /></article>";
	}
	
	$("#divApplicationList").html(divHtml);
}

var strClickEventNm  = "";
strClickEventNm += ".btnDynamic ";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = "";
    var no = "";
    if (id.indexOf("-") > -1) {
    	sId = id.split("-")[0];
    	no = id.split("-")[1];
    } else {
    	sId = id;
    }
    
    fn_eventCallFunction(sId, no);
});

function fn_eventCallFunction(id, no) {
	if (id === "btnToAppPage") {
		fn_moveToAppPage(no);
	} else if (id === "btnToAppIntro") {
		fn_moveToAppInfo(no);
	}
}

function fn_moveToAppPage(no) {
	var param = "";
	param += "applicationSeq="+$("#applicationSeq-"+no).val();
	
	gf_submitMovePage("<c:url value='/applications/application' />", param);
}

function fn_moveToAppInfo(no) {
	var param = "";
    param += "applicationSeq="+$("#applicationSeq-"+no).val();
    
    gf_submitMovePage("<c:url value='/applications/introduction' />", param);
}
</script>
</body>
</html>