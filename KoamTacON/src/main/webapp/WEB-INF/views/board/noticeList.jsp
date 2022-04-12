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
                
                <div id="tblNoticeList" class="table-wrapper">
                    <table class="alt">
                        <thead style="text-align:center;font-size:0.8em;">
                            <tr>
                                <td width="5%"><h4><spring:message code='WRD-NO' text='No' /></h4></td>
                                <td><h4><spring:message code='WRD-TITEL' text='Title' /></h4></td>
                            </tr>
                        </thead>
                        <tbody style="text-align:center;font-size:0.7em;">
                            <tr>
                                <td colspan="2" style="text-align:center;"><spring:message code='MSG-VW039' text='There is no data.' /></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr><td colspan="2" style="text-align:center;font-size:0.7em;" id="tdPagination"></td></tr>
                        </tfoot>
                    </table>
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
    param += "callFunction=fn_getNoticeList";
    
    gf_send("<c:url value='/board/getNoticeList' />", param, "fn_getNoticeListCallback");
}

function fn_getNoticeListCallback(data) {
    var noticeList = data.noticeList;
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
            bodyHtml += "    </td>";
            bodyHtml += "    <td style=\"text-align:left;\">"+gfn_nullValue(noticeList[i].title)+"</td>";
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
    } else {
        bodyHtml += "<tr><td colspan=\"6\" style=\"text-align:center;\"><spring:message code='MSG-VW039' text='There is no data.' /></td></tr>";
    }
    
    $("#tblNoticeList tbody").html(bodyHtml);
    $("#tblNoticeList tfoot #tdPagination").html(pageHtml);
}

$(document).on("click", "#tblNoticeList tbody tr", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];      
    
    fn_moveNoticeDetail(no);
});

function fn_moveNoticeDetail(no) {
    var boardSeq = $("#boardSeq-"+no).val();
    var param = "";
    param += "boardSeq="+boardSeq;
    
    gf_submitMovePage("<c:url value='/board/noticeDetail' />", param);
}
</script>
</body>
</html>