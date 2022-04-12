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
                    <h2><spring:message code='MENU-NOTICE' text='Notice' /></h2>
                </header>
                
                <div style="text-align:right;padding-bottom:0.5em;">
                    <input type="button" name="btnMoveToNoticeList" id="btnMoveToNoticeList" value="<spring:message code='WRD-MORE' text='More' />" class="button special small" />
                </div>
                <div id="divNoticeList" class="row">
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
    
    fn_getNoticeList(1);
});

function fn_getNoticeList(pageNo) {
	var param = "";
	param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getCodeMasterList";
    
	gf_send("<c:url value='/board/getNoticeList' />", param, "fn_getNoticeListCallback");
}

function fn_getNoticeListCallback(data) {
	var noticeList = data.noticeList;
	
	fn_makeDivNoticeList(noticeList);
}

function fn_makeDivNoticeList(noticeList) {
	var bodyHtml = "";
	
	if (noticeList != null && noticeList.length > 0) {
		if (noticeList.length <= 6) {
			$("#btnMoveToNoticeList").hide();
		}
		for(var i=0; i<noticeList.length; i++) {
			var title = noticeList[i].title;
			if (noticeList[i].title.length > 30) {
				title = noticeList[i].title.substr(0,27) + "...";
			}
			var contents = noticeList[i].contents;
			if (noticeList[i].contents.length > 200) {
				contents = noticeList[i].contents.substr(0,197) + "...";
			}
			
			if (i%3 == 2) {
				bodyHtml += "<div class=\"4u$ 12u$(small)\">";
			} else {
				bodyHtml += "<div class=\"4u 12u$(small)\">";
			}
			bodyHtml += "    <div id=\"divNoticeSeq-"+i+"\" name=\"divNoticeSeq-"+i+"\" class=\"box divNotice\" style=\"word-wrap:break-word;\">";
			bodyHtml += "        <input type=\"hidden\" id=\"noticeSeq-"+i+"\" name=\"noticeSeq-"+i+"\" value=\""+noticeList[i].boardSeq+"\" >";
			bodyHtml += "        <h4>"+title+"</h4>";
			bodyHtml += contents.replace(/(<([^>]+)>)/gi, "");
			bodyHtml += "    </div>";
			bodyHtml += "</div>";
			if (i==5) {
				break;
			}
		}
	} else {
		$("#btnMoveToNoticeList").hide();
		bodyHtml += "";
	}
	
	$("#divNoticeList").html(bodyHtml);
}

$(document).on("click", ".divNotice, #btnMoveToNoticeList", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    if (id != "btnMoveToNoticeList") {
	    var sId = id.split("-")[0];
	    var no = id.split("-")[1];
	    
	    fn_moveNoticeDetail(no);
    } else {
    	fn_moveNoticeList();
    }
});

function fn_moveNoticeDetail(no) {
	var boardSeq = $("#noticeSeq-"+no).val();
	var param = "";
	param += "boardSeq="+boardSeq;
	
	gf_submitMovePage("<c:url value='/board/noticeDetail' />", param);
}

function fn_moveNoticeList() {
	gf_submitMovePage("<c:url value='/board/noticeList' />");
}
</script>
</body>
</html>