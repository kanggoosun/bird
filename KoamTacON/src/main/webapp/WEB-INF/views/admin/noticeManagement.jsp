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
                    <h2>Notice Management</h2>
                </header>
                
                <form id="frmMainFilter" name="frmMainFilter">
                    <div class="row">
                        <div class="2u 12u$(medium)">
                            <input type="text" name="sKeyword" id="sKeyword" value="" placeholder="keyword"/> 
                        </div>
                        <div class="8u 12u$(medium) row">
                            <div class="2u 12u$(small)" style="text-align:right;">
                                <h3>Posting Date</h3>
                            </div>
                            <div class="3u 12u$(small)">
                                <input type="text" name="sFromDate" id="sFromDate" value="" placeholder="From"/>
                            </div>
                            <div class="3u 12u$(small)"> 
                                <input type="text" name="sToDate" id="sToDate" value="" placeholder="To"/>
                            </div>
                            <div class="4u$ 12u$(small)"> 
                                <ul class="actions">
                                    <li><input type="button" name="btnInitSearch" id="btnInitSearch" value="Initialize Search" class="button special" /></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </form>
                    
                <div id="tblNoticeList" class="table-wrapper">
                    <table class="alt">
                        <thead style="text-align:center;font-size:0.8em;">
                            <tr>
                                <td width="5%">No</td>
                                <td>Title</td>
                                <td width="10%">Writer</td>
                                <td width="15%">Written date</td>
                                <td colspan="2" width="30%">Posting date</td>
                            </tr>
                        </thead>
                        <tbody style="text-align:center;font-size:0.7em;">
                            <tr>
                                <td colspan="6" style="text-align:center;">There is no data.</td>
                            </tr>
                        </tbody>
                        <tfoot style="font-size:0.7em;">
                            <tr><td colspan="6" style="text-align:center;" id="tdPagination"></td></tr>
                            <tr>
                                <td colspan="6" style="text-align:right;">
                                    <ul class="actions">
                                        <li><input type="button" name="btnNewNotice" id="btnNewNotice" value="New" class="button small special" /></li>
                                    </ul>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Notice popup layer -->
<div id="dim-layer-notice" class="dim-layer">
    <div id="dimBgNotice" class="dimBg"></div>
    <div id="notice_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="noticeDiv">
                    <form id="frmNoticePop" method="post">
                        <input type="hidden" name="saveFlag" id="saveFlag" value="" />
                        <input type="hidden" name="boardType" id="boardType" value="00" />
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="text" name="boardSeq" id="boardSeq" value="" placeholder="Board Sequence" readonly="readonly" maxlength="11" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="hidden" name="writerId" id="writerId" value="" />
                                <input type="text" name="writerName" id="writerName" value="" placeholder="Writer Name" readonly="readonly" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="boardTitle" id="boardTitle" value="" placeholder="Title" required="required" maxlength="200" />
                            </div>
                            
                            <div class="12u 12u$(small)">
                                <textarea name="boardContents" id="boardContents" placeholder="Enter contents" required="required" rows="6" maxlength="2000"></textarea>
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="postingStartDate" id="postingStartDate" value="" required="required" readonly="readonly"/>
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="postingEndDate" id="postingEndDate" value="" readonly="readonly"/>
                            </div>
                            <div id="divPopButtons" class="12u 12u$" style="text-align:center;">
                                <ul class="actions">
                                    <li><input type="button" name="btnSaveNotice" id="btnSaveNotice" value="Submit" class="button special" /></li>
                                    <li><input type="button" name="btnDeleteNotice" id="btnDeleteNotice" value="Delete" class="button special" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeNoticePopup" class="btn-layerClose">Close</a>
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
    
    fn_getNoticeList(1);
});

$("#sFromDate").flatpickr({
    onClose: function(selectedDate, dateStr, instance) {
        if ($("#sToDate").val()) {
            var iSDateTime = gfn_dateToInteger(dateStr);
            var iEDateTime = gfn_dateToInteger($("#sToDate").val());
            
            if (iSDateTime >= iEDateTime) {
                gfn_layerPopup("<spring:message code='MSG-VW081' text='The start date must be before the end date.' />");
                $("#sFromDate").val("");
            }
        }
    }
});

$("#sToDate").flatpickr({
    onClose: function(selectedDate, dateStr, instance) {
        if ($("#sFromDate").val()) {
            var iSDateTime = gfn_dateToInteger($("#sFromDate").val());
            var iEDateTime = gfn_dateToInteger(dateStr);
            
            if (iSDateTime >= iEDateTime) {
                gfn_layerPopup<spring:message code='MSG-VW080' text='The end date must be after the start date.' />");
                $("#sToDate").val("");
            }
        }
    }
});

$("#postingStartDate").flatpickr({
	"enableTime" : true,
	"minDate" : "today",
	"plugins": [new confirmDatePlugin({
		confirmIcon: "<i class='fa fa-check'></i>", // your icon's html, if you wish to override
	    confirmText: "OK ",
	    showAlways: false,
	    theme: "light" // or "dark"
	})],
	onClose: function(selectedDate, dateStr, instance) {
		if ($("#postingEndDate").val()) {
			var iSDateTime = gfn_datetimeToInteger(dateStr);
			var iEDateTime = gfn_datetimeToInteger($("#postingEndDate").val());
			
			if (iSDateTime >= iEDateTime) {
				gfn_layerPopup("The start date must be before the end date.");
				$("#postingStartDate").val("");
			}
		}
	}
});

$("#postingEndDate").flatpickr({
    "enableTime" : true,
    "minDate" : "today",
    "plugins": [new confirmDatePlugin({
        confirmIcon: "<i class='fa fa-check'></i>", // your icon's html, if you wish to override
        confirmText: "OK ",
        showAlways: false,
        theme: "light" // or "dark"
    })],
    onClose: function(selectedDate, dateStr, instance) {
        if ($("#postingStartDate").val()) {
        	var iSDateTime = gfn_datetimeToInteger($("#postingStartDate").val());
        	var iEDateTime = gfn_datetimeToInteger(dateStr);
            
            if (iSDateTime >= iEDateTime) {
                gfn_layerPopup("The end date must be after the start date.");
                $("#postingEndDate").val("");
            }
        }
    }
});

function fn_getNoticeList(pageNo) {
	var param = "";
	param += "boardType=00";
	param += "&";
	param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getNoticeList";
    if (gfn_nullValue($("#sKeyword").val()) != "") {
    	param += "&";
    	param += "sKeyword="+$("#sKeyword").val();
    }
    if (gfn_nullValue($("#sFromDate").val()) != "") {
    	param += "&";
        param += "sFromDate="+gfn_dateToInteger($("#sFromDate").val());
        if (gfn_nullValue($("#sToDate").val()) != "") {
        	param += "&";
            param += "sToDate="+gfn_dateToInteger($("#sToDate").val());
        }
    }
    console.log('param='+param);
	gf_send("<c:url value='/admin/boardManagement/getBoardList' />", param, "fn_getNoticeListCallback");
}

function fn_getNoticeListCallback(data) {
	var noticeList = data.boardList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblNoticeList(noticeList, paginationHtml);
}

function fn_makeTblNoticeList(noticeList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";

	if (noticeList != null && noticeList.length > 0) {
		for(var i=0; i<noticeList.length; i++) {
			bodyHtml += "<tr id=\"trNotice-"+i+"\">";
			bodyHtml += "    <td id=\"tdNoticeNo-"+i+"\">"+(i+1);
			bodyHtml += "        <input type=\"hidden\" name=\"boardSeq-"+i+"\" id=\"boardSeq-"+i+"\" value=\""+noticeList[i].boardSeq+"\" >";
			bodyHtml += "        <input type=\"hidden\" name=\"writerId-"+i+"\" id=\"writerId-"+i+"\" value=\""+noticeList[i].writerId+"\" >";
			bodyHtml += "    </td>";
			bodyHtml += "    <td style=\"text-align:left;\">"+gfn_nullValue(noticeList[i].boardTitle)+"</td>";
			bodyHtml += "    <td>"+gfn_nullValue(noticeList[i].writerName)+"</td>";
			bodyHtml += "    <td>"+gfn_nullValue(noticeList[i].writtenDate)+"</td>";
			bodyHtml += "    <td>"+gfn_nullValue(noticeList[i].postingStartDate)+"</td>";
			bodyHtml += "    <td>"+gfn_nullValue(noticeList[i].postingEndDate)+"</td>";
			bodyHtml += "</tr>";
		}
		pageHtml = paginationHtml;
	} else {
		bodyHtml += "<tr><td colspan=\"6\" style=\"text-align:center;\">There is no data.</td></tr>";
	}
	
	$("#tblNoticeList tbody").html(bodyHtml);
	$("#tblNoticeList tfoot #tdPagination").html(pageHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnNewNotice, #btnSaveNotice, #btnDeleteNotice, #btnInitSearch";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");

    fn_eventCallFunction(id);
});

$(document).on("click", "#tblNoticeList tbody tr", function(e){
    e.preventDefault();
    
    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];
    
    fn_noticePopup(no);
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnNewNotice") {
        fn_noticePopup("");
    } else if (args[0] === "btnSaveNotice") {
        fn_saveNotice();
    } else if (args[0] === "btnDeleteNotice") {
        fn_deleteNotice();
    } else if (args[0] === "btnInitSearch") {
    	$("#sKeyword").val("");
    	$("#sFromDate").val("");
    	$("#sToDate").val("");
    	fn_getNoticeList(1);
    }
}

function fn_noticePopup(no) {
	var btnHtml = "";
	gfn_clearForm("frmNoticePop");
	$("#boardType").val("00");
    if (no === "") {
        $("#saveFlag").val("I");
        btnHtml += "<ul class=\"actions\">";
        btnHtml += "    <li><input type=\"button\" name=\"btnSaveNotice\" id=\"btnSaveNotice\" value=\"Submit\" class=\"button special\" /></li>";
        btnHtml += "</ul>";
    } else {
    	fn_setFrmNoticePop($("#boardSeq-"+no).val());
    	$("#saveFlag").val("U");
    	btnHtml += "<ul class=\"actions\">";
        btnHtml += "    <li><input type=\"button\" name=\"btnSaveNotice\" id=\"btnSaveNotice\" value=\"Submit\" class=\"button special\" /></li>";
        btnHtml += "    <li><input type=\"button\" name=\"btnDeleteNotice\" id=\"btnDeleteNotice\" value=\"Delete\" class=\"button special\" /></li>";
        btnHtml += "</ul>";
    }
    $("#divPopButtons").html("");
    $("#divPopButtons").html(btnHtml);
    gfn_customLayerPopup('dim-layer-notice', 'dimBgNotice', 'notice_layer', 'closeNoticePopup');
}

function fn_setFrmNoticePop(boardSeq) {
	var param = "";
	param += "boardSeq="+boardSeq;
	gf_send("<c:url value='/admin/boardManagement/getBoard' />", param, "fn_setFrmNoticePopCallback");
}

function fn_setFrmNoticePopCallback(data) {
	var noticeMap = data.boardMap;
	
	$("#boardSeq").val(noticeMap.boardSeq);
	$("#writerId").val(noticeMap.writerId);
	$("#writerName").val(noticeMap.writerName);
	$("#boardTitle").val(noticeMap.boardTitle);
	$("#boardContents").val(noticeMap.boardContents);
	$("#postingStartDate").val(noticeMap.postingStartDate);
	$("#postingEndDate").val(noticeMap.postingEndDate);
}

function fn_saveNotice() {
	var frmId = "frmNoticePop";
	
	if (gfn_checkRequired(frmId) === true) {
		if($("#saveFlag").val() === "I") {
			gf_sendForm(frmId, "<c:url value='/admin/boardManagement/insertBoard' />", "fn_saveNoticeCallback");
		} else {
			gf_sendForm(frmId, "<c:url value='/admin/boardManagement/updateBoard' />", "fn_saveNoticeCallback");
		}
		$('#dim-layer-notice').fadeOut();
	}
}

function fn_saveNoticeCallback(data) {
	gfn_layerPopup(data.msg);

	if (data.flag === "success") {
		fn_getNoticeList(1);
	}
}

function fn_deleteNotice() {
	var param = "";
	param += "boardSeq="+$("#boardSeq").val();
	
	gf_send("<c:url value='/admin/boardManagement/deleteBoard' />", param, "fn_deleteNoticeCallback");
	$('#dim-layer-notice').fadeOut();
}

function fn_deleteNoticeCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getNoticeList(1);
	}
}

$("#sKeyword").on("input", function() {
	fn_getNoticeList(1);
});

$("#sFromDate").on("change", function() {
    fn_getNoticeList(1);
});

$("#sToDate").on("change", function() {
	if ($("#sFromDate").val()) {
		fn_getNoticeList(1);
	}
});
</script>
</body>
</html>