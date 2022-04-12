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
    <title><spring:message code='WRD-SUPPORT' text='Support' /> - KoamTacON</title>
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
                    <h2><spring:message code='MENU-FAQ' text='FAQ' /></h2>
                </header>
                
                <section>
                    <h4><spring:message code='WRD-FILTERS' text='Filters' /></h4>
                    <form id="frmMainFilter" name="frmMainFilter">
                        <div class="row">
                            <div class="3u 12u$(medium)">
                                <input type="text" name="searchParam" id="searchParam" value="" placeholder="<spring:message code='WRD-ENTKW' text='Enter Keyword' />"/> 
                            </div>
                        </div>
                    </form>
                </section>
                
                <h4><spring:message code='WRD-FAQLIST' text='FAQ List' /></h4>
                <div id="divFaqList">
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
    
    gfn_toggleMenu('.sprt');
    
    fn_getFaqList(1);
});

function fn_getFaqList(pageNo) {
    var param = "";
    param += "boardType=01";
    param += "&";
    param += "searchParam="+$("#searchParam").val();
    param += "&";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getFaqList";
    
    gf_send("<c:url value='/board/getFaqList' />", param, "fn_getFaqListCallback");
}

function fn_getFaqListCallback(data) {
    var faqList = data.faqList;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeDivFaqList(faqList, paginationHtml);
}

function fn_makeDivFaqList(faqList, paginationHtml) {
    var bodyHtml = "";
    var pageHtml = "";
    
    if (faqList != null && faqList.length > 0) {
        for(var i=0; i<faqList.length; i++) {
            if (i > 0) {
                bodyHtml += "<div style=\"padding:0.2em;\" />";
            }
            bodyHtml += "<div class=\"qbox row\" style=\"font-size:0.8em;\">";
            bodyHtml += "    <div class=\"11u 12u$(medium)\">";
            bodyHtml += "        <p><b>Q.</b> "+faqList[i].qBoardContents+"</p>";
            bodyHtml += "    </div>";
            if (faqList[i].aBoardSeq != null && faqList[i].aBoardSeq != "" && faqList[i].aBoardSeq != "undefined") {
                bodyHtml += "<div class=\"abox 12u 12u$(medium)\" >";
                bodyHtml += "    <div class=\"row\">";
                bodyHtml += "        <div class=\"11u 12u$(medium)\">";
                bodyHtml += "            <p><b>A.</b> "+faqList[i].aBoardContents+"</p>";
                bodyHtml += "        </div>";
                bodyHtml += "    </div>";
                bodyHtml += "</div>";
            } else {
                bodyHtml += "<div class=\"12u$ 12u$(medium)\">";
                bodyHtml += "    <input type=\"hidden\" id=\"deleteFlag-"+i+"\" name=\"deleteFlag-"+i+"\" value=\"Y\" >";
                bodyHtml += "</div>";
            }
            bodyHtml += "</div>";
        }
        bodyHtml += "<div style=\"padding:0.5em;text-align:center;\">";
        bodyHtml += paginationHtml;
        bodyHtml += "</div>";
    } else {
        bodyHtml += "<div class=\"abox\" style=\"text-align:center;\">";
        bodyHtml += "    <p><spring:message code='MSG-VW039' text='There is no data.' /></p>";
        bodyHtml += "</div>";
    }
    
    $("#divFaqList").html(bodyHtml);
}

var strInputEventNm  = "";
strInputEventNm += "#searchParam";
// mouse click event
$(document).on("input", strInputEventNm, function(e){
    e.preventDefault();

    fn_getFaqList(1);
});
</script>
</body>
</html>