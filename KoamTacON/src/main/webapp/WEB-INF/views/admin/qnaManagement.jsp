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
    <title>Board Management - KoamTacON</title>
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
                    <h2>Q&#38;A Management</h2>
                </header>
                
                <div class="row 200%">
                    <div class="12u$">
                        <div class="row uniform">
                            <div class="6u 12u$(small)">
                                <h4>Question</h4>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <h4>Answer</h4>
                            </div>
                            <div id="divQnaList" class="12u$ row uniform" style="font-size:0.8em;">
	                            <div class="6u 12u$(small)">
	                                <div class="qbox" style="text-align:center;">
	                                   <p>There is no question.</p>
	                                </div>
	                            </div>
	                            <div class="6u$ 12u$(small)">
	                                <div class="abox" style="text-align:center;">
	                                    <p>There is no answer.</p>
	                                </div>
	                            </div>
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

<!-- Answer popup layer -->
<div id="dim-layer-answer" class="dim-layer">
    <div id="dimBgAnswer" class="dimBg"></div>
    <div id="answer_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="answerDiv">
                    <form id="frmAnswerPop" name="frmAnswerPop" method="post" >
                        <input type="hidden" id="boardType" name="boardType" value="02">
                        <input type="hidden" id="parentSeq" name="parentSeq" value="">
                        <input type="hidden" id="writerMail" name="writerMail" value="">
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="text" id="answerTitle" name="answerTitle" value="" placeholder="Enter title" required="required" maxlength="200" >
                            </div>
                            <div class="12u 12u$(small)">
                                <textarea name="answerContents" id="answerContents" placeholder="Enter contents" required="required" rows="10" maxlength="2000"></textarea>
                            </div>
                            <div class="12u 12u$(small)" style="text-align:center;">
                                <ul class="actions">
                                    <li><input type="button" name="btnSaveAnswer" id="btnSaveAnswer" value="Send" class="button special" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeAnswerPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mloader"><div class="masterkey_blink">Sending mail...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.boardMgmt');
    
    fn_getQnaList(1);
});

function fn_getQnaList(pageNo) {
	var param = "";
	param += "boardType=02";
	param += "&";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getQnaList";
    
	gf_send("<c:url value='/admin/boardManagement/getQnaList' />", param, "fn_getQnaListCallback");
}

function fn_getQnaListCallback(data) {
	var qnaList = data.qnaList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeDivQnaList(qnaList, paginationHtml);
}

function fn_makeDivQnaList(qnaList, paginationHtml) {
	var bodyHtml = "";
	
	if (qnaList != null && qnaList.length > 0) {
		for(var i=0; i<qnaList.length; i++) {
			bodyHtml += "<div class=\"6u 12u$(medium)\">";
            bodyHtml += "    <div class=\"qbox\">";
            bodyHtml += "        <input type=\"hidden\" id=\"qBoardSeq-"+i+"\" name=\"qBoardSeq-"+i+"\" value=\""+qnaList[i].qBoardSeq+"\" >";
            bodyHtml += "        <input type=\"hidden\" id=\"qWriterEmail-"+i+"\" name=\"qWriterEmail-"+i+"\" value=\""+qnaList[i].qWriterEmail+"\" >";
            bodyHtml += "        1. Writer : "+qnaList[i].qWriterName+"("+qnaList[i].qWriterId+")<br/>";
            bodyHtml += "        2. Writer mail : "+qnaList[i].qWriterEmail+"<br/>";
            bodyHtml += "        3. Written Date : "+qnaList[i].qWrittenDate+"<br/>";
            bodyHtml += "        <blockquote>["+qnaList[i].qBoardTitle+"]<br/>";
            bodyHtml += "        "+qnaList[i].qBoardContents+"</blockquote>";
            bodyHtml += "    </div>";
            bodyHtml += "</div>";
            if (qnaList[i].aBoardSeq == null || qnaList[i].aBoardSeq == "" || qnaList[i].aBoardSeq == "undefined") {
		        bodyHtml += "<div class=\"6u$ 12u$(medium)\">";
		        bodyHtml += "    <div class=\"abox\">";
		        bodyHtml += "    <div class=\"row 12u$\">";
		        bodyHtml += "        <div class=\"10u 12u$(small)\">There is no answer.</div>";
		        bodyHtml += "        <div class=\"2u$ 12u$(small)\" style=\"text-align:right;\"><input type=\"button\" name=\"btnAnswer-"+i+"\" id=\"btnAnswer-"+i+"\" value=\"Answer\" class=\"button small special btnDynamic\" /></div>";
		        bodyHtml += "    </div>";
		        bodyHtml += "    </div>";
		        bodyHtml += "</div>";
			} else {
				bodyHtml += "<div class=\"6u$ 12u$(medium)\">";
	            bodyHtml += "    <div class=\"abox\">";
	            bodyHtml += "    <input type=\"hidden\" id=\"aBoardSeq-"+i+"\" name=\"aBoardSeq-"+i+"\" value=\""+qnaList[i].aBoardSeq+"\" >";
                bodyHtml += "    <input type=\"hidden\" id=\"aParentSeq-"+i+"\" name=\"aParentSeq-"+i+"\" value=\""+qnaList[i].aParentSeq+"\" >";
	            bodyHtml += "        1. Writer : "+qnaList[i].aWriterName+"("+qnaList[i].aWriterId+")<br/>";
	            bodyHtml += "        2. Written Date : "+qnaList[i].aWrittenDate+"<br/>";
	            bodyHtml += "        <blockquote>["+qnaList[i].aBoardTitle+"]<br/>";
	            bodyHtml += "        "+qnaList[i].aBoardContents+"</blockquote>";
	            bodyHtml += "    </div>";
	            bodyHtml += "</div>";
			}
		}
		bodyHtml += "<div class=\"12u$ 12u$\" style=\"padding:0.5em;text-align:center;\">";
        bodyHtml += paginationHtml;
        bodyHtml += "</div>";
	} else {
		bodyHtml += "<div class=\"6u 12u$(small)\">";
		bodyHtml += "    <div class=\"qbox\" style=\"text-align:center;\">";
		bodyHtml += "        <p>There is no question.</p>";
		bodyHtml += "    </div>";
		bodyHtml += "</div>";
		bodyHtml += "<div class=\"6u$ 12u$(small)\">";
		bodyHtml += "    <div class=\"abox\" style=\"text-align:center;\">";
		bodyHtml += "        <p>There is no answer.</p>";
		bodyHtml += "    </div>";
		bodyHtml += "</div>";
	}
	
	$("#divQnaList").html(bodyHtml);
}

$(document).on("click", ".btnDynamic, #btnSaveAnswer", function(e) {
    e.preventDefault();
    
    var id = $(this).attr("id");
    var cls = $(this).attr("class");
    
    if (cls.indexOf("btnDynamic") > -1) {
    	var sId = id.split("-")[0];
        var no = id.split("-")[1];
        
        fn_answerPopup(no);
    } else if (id === "btnSaveAnswer") {
    	fn_saveAnswer();
    }
});

function fn_answerPopup(no) {
    gfn_clearForm("frmAnswerPop");
    
    $("#boardType").val("02");
    $("#parentSeq").val($("#qBoardSeq-"+no).val());
    
    gfn_customLayerPopup('dim-layer-answer', 'dimBgAnswer', 'answer_layer', 'closeAnswerPopup');
}

function fn_saveAnswer() {
    var frmId = "frmAnswerPop";
    
    if (gfn_checkRequired(frmId) === true) {
        $("#mloader").css("display", "block");
        gf_sendForm(frmId, "<c:url value='/admin/boardManagement/saveAnswer' />", "fn_saveAnswerCallback");
        $('#dim-layer-answer').fadeOut();
    }
}

function fn_saveAnswerCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
    
    if (data.flag === "success") {
    	fn_getQnaList(1);
    }
}
</script>
</body>
</html>