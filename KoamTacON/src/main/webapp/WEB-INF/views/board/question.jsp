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
                    <h2><spring:message code='WRD-CONTACT' text='Contact' /></h2>
                </header>
                
                <div id="divButton" class="row 200%">
                    <p><spring:message code='MSG-VW058' text='Need help? Click the button below to ask a question.' /></p>
                    <div class="12u 12u$">
                        <ul class="actions">
                            <li><input type="button" name="btnOpenQuestion" id="btnOpenQuestion" value="<spring:message code='WRD-ENTCONT' text='Enter Contents' />" class="button special fit" /></li>
                        </ul>
                    </div>
                </div>
                
                <div id="divQuestion" class="row 200%">
                    <p><spring:message code='MSG-VW059' text='Your questions will be forwarded to the administrator.' /> <spring:message code='MSG-VW060' text='Responses will be sent to the email address associated with your account.' /> </p>
                    <div class="12u$">
	                    <form id="frmQuestion" name="frmQuestion" method="POST" >
	                        <input type="hidden" id="boardType" name="boardType" value="02">
	                        <div class="row uniform">
		                        <div class="12u 12u$">
		                            <input type="text" id="questionTitle" name="questionTitle" value="" placeholder="<spring:message code='WRD-ENTTTL' text='Enter Title' />" required="required" maxlength="200" >
		                        </div>
		                        <div class="12u 12u$">
		                            <textarea name="questionContents" id="questionContents" placeholder="<spring:message code='WRD-ENTCONT' text='Enter contents' />" required="required" rows="10" maxlength="2000"></textarea>
		                        </div>
		                        <div class="12u 12u$">
	                                <ul class="actions vertical">
	                                    <li><input type="button" name="btnSaveQuestion" id="btnSaveQuestion" value="<spring:message code='WRD-SEND' text='Send' />" class="button special fit" /></li>
	                                </ul>
	                            </div>
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

<div id="mloader"><div class="masterkey_blink"><spring:message code='WRD-SENDGML' text='Sending mail' />...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.sprt');
    
    $("#mloader").css("display", "none");
    
    $("#divButton").css("display", "block");
    $("#divQuestion").css("display", "none");
});

$(document).on("click", "#btnSaveQuestion, #btnOpenQuestion", function(e) {
    e.preventDefault();
    
    var id = $(this).attr("id");
    
    if (id === "btnSaveQuestion") {
    	fn_saveQuestion();
    } else if (id === "btnOpenQuestion") {
    	$("#divButton").css("display", "none");
        $("#divQuestion").css("display", "block");
    }
});

function fn_saveQuestion() {
	var frmId = "frmQuestion";
	
	if (gfn_checkRequired(frmId) === true) {
		$("#mloader").css("display", "block");
		gf_sendForm(frmId, "<c:url value='/board/saveQuestion' />", "fn_saveQuestionCallback");
	}
}

function fn_saveQuestionCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		gfn_clearForm("frmQuestion");
		$("#boardType").val("02");
		$("#divButton").css("display", "block");
	    $("#divQuestion").css("display", "none");
	}
}
</script>
</body>
</html>