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
                    <h2>FAQ Management</h2>
                </header>
                
                <section>
                    <h4>Filters</h4>
                    <form id="frmMainFilter" name="frmMainFilter">
                        <div class="row">
                            <div class="3u 12u$(medium)">
                                <input type="text" name="searchParam" id="searchParam" value="" placeholder="Enter key word"/> 
                            </div>
                        </div>
                    </form>
                </section>
                <section>
	                <div id="divFaqList">
		                <div class="qbox" id="question-1">
		                    <p>There is no data.</p>
		                    <div class="abox" id="answer-1" style="display:none;">
		                        <p>321</p>
		                    </div>
		                </div>
	                </div>
	                <div style="text-align:right;padding-top:0.5em;">
	                    <ul class="actions" style="text-align:right;padding-right:0.8em;">
	                        <li><input type="button" name="btnNewQuestion" id="btnNewQuestion" value="New Question" class="button small special" /></li>
	                    </ul>
	                </div>
                </section>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- FAQ popup layer -->
<div id="dim-layer-faq" class="dim-layer">
    <div id="dimBgFaq" class="dimBg"></div>
    <div id="faq_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="divHeader"></div>
                <div id="faqDiv">
                    <input type="hidden" name="saveFlag" id="saveFlag" value="" />
                    <input type="hidden" name="deleteFlag" id="deleteFlag" value="" />
                    <input type="hidden" name="qaFlag" id="qaFlag" value="" />
                    <form id="frmFaqPop" method="post">
                        <input type="hidden" name="boardType" id="boardType" value="01" />
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="hidden" name="parentSeq" id="parentSeq" value="" />
                                <input type="text" name="boardSeq" id="boardSeq" value="" placeholder="Board Sequence" readonly="readonly" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="hidden" name="writerId" id="writerId" value="" />
                                <input type="text" name="writerName" id="writerName" value="" placeholder="Writer Name" readonly="readonly" />
                            </div>
                            <div class="12u 12u$(small)">
                                <textarea name="boardContents" id="boardContents" placeholder="Enter contents" required="required" rows="6"></textarea>
                            </div>
                            <div class="12u 12u$" style="text-align:center;">
                                <ul class="actions">
                                    <li><input type="button" name="btnSaveFaq" id="btnSaveFaq" value="Submit" class="button special" /></li>
                                    <li><input type="button" name="btnDeleteFaq" id="btnDeleteFaq" value="Delete" class="button special" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeFaqPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
    var msg = "<c:out value='${msg}' />";
    if (msg != null && msg != "") { gfn_layerPopup(msg); }
    
    gfn_toggleMenu('.boardMgmt');
    
    fn_getFaqList(1);
});

function fn_getFaqList(pageNo) {
	var param = "";
	param += "boardType=01";
	param += "&";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getFaqList";
    param += "&";
    param += "searchParam="+$("#searchParam").val();
    
	gf_send("<c:url value='/admin/boardManagement/getFaqList' />", param, "fn_getFaqListCallback");
}

function fn_getFaqListCallback(data) {
	var faqList = data.faqList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeDivFaqList(faqList, paginationHtml);
}

function fn_makeDivFaqList(faqList, paginationHtml) {
	var bodyHtml = "";
	
	if (faqList != null && faqList.length > 0) {
		for(var i=0; i<faqList.length; i++) {
			if (i > 0) {
				bodyHtml += "<div style=\"padding:0.2em;\" />";
			}
			bodyHtml += "<div class=\"qbox row\" style=\"font-size:0.8em;\">";
			bodyHtml += "    <div class=\"11u 12u$(medium)\">";
			bodyHtml += "        <input type=\"hidden\" id=\"qBoardSeq-"+i+"\" name=\"qBoardSeq-"+i+"\" value=\""+faqList[i].qBoardSeq+"\" >";
			bodyHtml += "        <p><b>Q.</b> "+faqList[i].qBoardContents+"</p>";
			bodyHtml += "    </div>";
			bodyHtml += "    <div class=\"1u$ 12u$(medium)\">";
			bodyHtml += "        <ul class=\"actions\" style=\"text-align:right;padding-right:0.5em;\">";
			bodyHtml += "            <li><input type=\"button\" name=\"btnEditQuestion-"+i+"\" id=\"btnEditQuestion-"+i+"\" value=\"Edit\" class=\"button small special btnDynamic\" /></li>";
			bodyHtml += "        </ul>";
			bodyHtml += "    </div>";
			if (faqList[i].aBoardSeq != null && faqList[i].aBoardSeq != "" && faqList[i].aBoardSeq != "undefined") {
				bodyHtml += "<div class=\"abox 12u 12u$(medium)\" >";
				bodyHtml += "    <div class=\"row\">";
				bodyHtml += "        <div class=\"11u 12u$(medium)\">";
				bodyHtml += "            <input type=\"hidden\" id=\"deleteFlag-"+i+"\" name=\"deleteFlag-"+i+"\" value=\"N\" >";
				bodyHtml += "            <input type=\"hidden\" id=\"aBoardSeq-"+i+"\" name=\"aBoardSeq-"+i+"\" value=\""+faqList[i].aBoardSeq+"\" >";
				bodyHtml += "            <p><b>A.</b> "+faqList[i].aBoardContents+"</p>";
				bodyHtml += "        </div>";
	            bodyHtml += "        <div class=\"1u 12u$(medium)\">";
	            bodyHtml += "            <ul class=\"actions\" style=\"text-align:right;\">";
	            bodyHtml += "                <input type=\"button\" name=\"btnEditAnswer-"+i+"\" id=\"btnEditAnswer-"+i+"\" value=\"Edit\" class=\"button small special btnDynamic\" />";
	            bodyHtml += "            </ul>";
	            bodyHtml += "        </div>";
				bodyHtml += "    </div>";
				bodyHtml += "</div>";
			} else {
				bodyHtml += "<div class=\"12u$ 12u$(medium)\">";
				bodyHtml += "    <input type=\"hidden\" id=\"deleteFlag-"+i+"\" name=\"deleteFlag-"+i+"\" value=\"Y\" >";
				bodyHtml += "    <ul class=\"actions\" style=\"text-align:right;padding-right:0.5em;\">";
				bodyHtml += "        <li><input type=\"button\" name=\"btnNewAnswer-"+i+"\" id=\"btnNewAnswer-"+i+"\" value=\"Answer\" class=\"button small special btnDynamic\" /></li>";
				bodyHtml += "    </ul>";
				bodyHtml += "</div>";
			}
			bodyHtml += "</div>";
		}
		bodyHtml += "<div style=\"padding:0.5em;text-align:center;\">";
        bodyHtml += paginationHtml;
        bodyHtml += "</div>";
	} else {
		bodyHtml += "<div class=\"abox\" style=\"text-align:center;\">";
		bodyHtml += "    <p>There is no data.</p>";
		bodyHtml += "</div>";
	}
	
	$("#divFaqList").html(bodyHtml);
}

$(document).on("click", ".btnDynamic, #btnSaveFaq, #btnNewQuestion, #btnDeleteFaq", function(e) {
	e.preventDefault();
	
	var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    if (id === "btnNewQuestion") {
    	fn_faqPopup("", "Q", "I");
    } else if (id === "btnSaveFaq") {
        fn_saveFaq();
    } else if (sId === "btnNewAnswer") {
    	fn_faqPopup("", "A", "I", $("#qBoardSeq-"+no).val());
    } else if (sId === "btnEditQuestion") {
    	fn_faqPopup(no, "Q", "U");
    } else if (sId === "btnEditAnswer") {
    	fn_faqPopup(no, "A", "U");
    } else if (sId === "btnDeleteFaq") {
        fn_deleteFaq();
    }
});

function fn_faqPopup() {
	var args = fn_faqPopup.arguments;
	
	var no = -1;
	var qaFlag = "";
	var saveFlag = "";
	var parentSeq = -1;
	
	if (args.length > 0) {
		no = args[0];
		if (args.length > 1) {
			qaFlag = args[1];
			if (args.length > 2) {
				saveFlag = args[2];
				if (args.length > 3) {
					parentSeq = args[3];
				}
			}
		}
	}
	
    gfn_clearForm("frmFaqPop");
    $("#boardType").val("01");
    $("#saveFlag").val(saveFlag);
    $("#deleteFlag").val($("#deleteFlag-"+no).val());
    
    if (saveFlag === "I") {
        $("#btnDeleteFaq").hide();
    }
    
    if (qaFlag === "Q") {
    	$("#divHeader").html("<h2>Question</h2>");
	    if (no === "") {
	    	
	    } else {
	        fn_setFrmFaqPop($("#qBoardSeq-"+no).val());
	    }
    } else {
    	$("#divHeader").html("<h2>Answer</h2>");
        if (no === "") {
        	$("#parentSeq").val(parentSeq);
        } else {
            fn_setFrmFaqPop($("#aBoardSeq-"+no).val());
        }
    }
    
    gfn_customLayerPopup('dim-layer-faq', 'dimBgFaq', 'faq_layer', 'closeFaqPopup');
}

function fn_setFrmFaqPop(boardSeq) {
	var param = "";
    param += "boardSeq="+boardSeq;
    gf_send("<c:url value='/admin/boardManagement/getBoard' />", param, "fn_setFrmFaqPopCallback");
}

function fn_setFrmFaqPopCallback(data) {
    var faqMap = data.boardMap;
    
    $("#boardSeq").val(faqMap.boardSeq);
    $("#parentSeq").val(faqMap.parentSeq);
    $("#writerId").val(faqMap.writerId);
    $("#writerName").val(faqMap.writerName);
    $("#boardContents").val(faqMap.boardContents);
    
    if (!$("#parentSeq").val() && $("#deleteFlag").val() === "N") {
    	$("#btnDeleteFaq").css("display", "none");
    } else {
    	$("#btnDeleteFaq").css("display", "block");
    }
}

function fn_saveFaq() {
    var frmId = "frmFaqPop";
    
    if (gfn_checkRequired(frmId) === true) {
        if($("#saveFlag").val() === "I") {
            gf_sendForm(frmId, "<c:url value='/admin/boardManagement/insertBoard' />", "fn_saveFaqCallback");
        } else {
            gf_sendForm(frmId, "<c:url value='/admin/boardManagement/updateBoard' />", "fn_saveFaqCallback");
        }
        $('#dim-layer-faq').fadeOut();
    }
}

function fn_saveFaqCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getFaqList(1);
	}
}

function fn_deleteFaq() {
    var param = "";
    param += "boardSeq="+$("#boardSeq").val();
    
    gf_send("<c:url value='/admin/boardManagement/deleteBoard' />", param, "fn_deleteFaqCallback");
    $('#dim-layer-faq').fadeOut();
}

function fn_deleteFaqCallback(data) {
    gfn_layerPopup(data.msg);
    
    if (data.flag === "success") {
        fn_getFaqList(1);
    }
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