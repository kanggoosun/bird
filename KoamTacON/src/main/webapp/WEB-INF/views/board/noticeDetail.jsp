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
    <title><spring:message code='MENU-SUPPORT' text='Support' /> - KoamTacON</title>
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
                    <h2><spring:message code='WRD-NOTICE' text='Notice' /></h2>
                </header>
                
                <div style="text-align:right;padding-bottom:0.5em;">
                    <input type="button" name="btnMoveToNoticeList" id="btnMoveToNoticeList" value="<spring:message code='WRD-LIST' text='List' />" class="button special small" />
                </div>
                
                <div id="divNoticeDetail" class="row">
                    <div class="12u$ 12u$(small)" style="padding-bottom:0.5em;">
                        <div class="qbox">
                            <h4><spring:message code='WRD-TITEL' text='Title' /></h4>
                            <c:out value="${noticeDetailMap.title }" />
                        </div>
                    </div>
                    <div class="12u$ 12u$(small)">
                        <div class="abox">
                            <h4><spring:message code='WRD-CONTENT' text='Content' /></h4>
                            <div style="max-width:1200px;word_break:break-all;">
                                <c:out value="${noticeDetailMap.contents }" escapeXml="false"/>
                            </div>
                        </div>
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
});

$(document).on("click", "#btnMoveToNoticeList", function(e){
    e.preventDefault();

    fn_moveNoticeList();
});

function fn_moveNoticeList() {
    gf_submitMovePage("<c:url value='/board/noticeList' />");
}
</script>
</body>
</html>