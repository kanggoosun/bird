<% response.setStatus(HttpServletResponse.SC_OK); %>
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
    <title><spring:message code='WRD-ERROR' text='Error' /> - KoamTacON</title>
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
            <section style="max-width:400px;margin:auto;">
                <header class="main">
                    <h2><spring:message code='WRD-INFO' text='Information' /></h2>
                </header>
                
                <div class="row">
                    <div class="12u$">
                        <div class="12u 12u$">
                            <h4><c:out value="${msg }" /></h4>
                            <p><spring:message code='MSG-VW057' text='Press the button below to go to the main page.' /></p>
                        </div>
                        <div class="12u$ 12u$">
                            <ul class="actions vertical" style="text-align:center;">
                                <li><input type="button" id="btnMain" value="<spring:message code='WRD-MAIN' text='Main' />" class="button special fit" /></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
    
});

var strClickEventNm  = "";
strClickEventNm += "#btnMain";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();
    
    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnMain") {
    	gf_submitMovePage("<c:url value='/main' />");
    } 
}
</script>
</body>
</html>