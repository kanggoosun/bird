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
    <title>System Management - KoamTacON</title>
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
                    <h2>Application Management</h2>
                </header>
                
                <h4>Application List</h4>
                <div id="tblApplicationList" class="table-wrapper">
                    <table class="alt">
                        <thead style="text-align:center;font-size:0.8em;">
                            <tr>
                                <td width="10%">Sequence</td>
                                <td>Name</td>
                                <td width="10%">Usable</td>
                                <td width="10%">Order</td>
                                <td width="10%">Edit</td>
                            </tr>
                        </thead>
                        <tbody style="text-align:center;font-size:0.8em;">
                            <tr>
                                <td colspan="7" style="text-align:center;">There is no data.</td>
                            </tr>
                        </tbody>
                        <tfoot style="font-size:0.7em;">
                            <tr><td colspan="7" style="text-align:center;" id="tdPaginationApplication"></td></tr>
                            <tr>
                                <td colspan="7" style="text-align:right;">
                                    <ul class="actions">
                                        <li><input type="button" name="btnNewApplication" id="btnNewApplication" value="New Application" class="button small special" /></li>
                                    </ul>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                
                <h4>File List</h4>
                <div id="tblFileList" class="table-wrapper">
                    <input type="hidden" name="sLinkedSeq" id="sLinkedSeq" value="" />
                    <input type="hidden" name="sLinkedTable" id="sLinkedTable" value="tb_applications" />
                    <table class="alt">
                        <thead style="text-align:center;font-size:0.8em;">
                            <tr>
                                <td width="10%">Sequence</td>
                                <td>Name</td>
                                <td width="15%">Type</td>
                                <td width="15%">Usage</td>
                                <td width="20%">Action</td>
                            </tr>
                        </thead>
                        <tbody style="text-align:center;font-size:0.8em;">
                            <tr>
                                <td colspan="5" style="text-align:center;">There is no data.</td>
                            </tr>
                        </tbody>
                        <tfoot style="font-size:0.7em;">
                            <tr><td colspan="5" style="text-align:center;" id="tdPaginationFile"></td></tr>
                            <tr>
                                <td colspan="5" style="text-align:right;">
                                    <ul class="actions">
                                        <li><input type="button" name="btnNewFile" id="btnNewFile" value="New File" class="button small special" /></li>
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

<!-- Application popup layer -->
<div id="dim-layer-app" class="dim-layer">
    <div id="dimBgApp" class="dimBg"></div>
    <div id="app_layer" class="popcont-layer" style="overflow:auto;max-width:600px;height:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="appDiv">
                    <form id="frmAppPop" method="post">
                        <input type="hidden" id="saveFlag" name="saveFlag" value="" >
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="text" name="applicationSeq" id="applicationSeq" value="" readonly="readonly" placeholder="Application sequence" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="applicationName" id="applicationName" value="" placeholder="Application name" required="required" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <textarea name="applicationDescription" id="applicationDescription" placeholder="Enter Application description" rows="3" maxlength="2000"></textarea>
                            </div>
                            <div class="12u 12u$(small)">
                                <textarea name="applicationIntroduction" id="applicationIntroduction" placeholder="Enter Application Introduction" rows="6" maxlength="2000"></textarea>
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="applicationUrl" id="applicationUrl" value="" placeholder="Application url" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="tutorialUrl" id="tutorialUrl" value="" placeholder="Tutorial url" maxlength="200" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="displayOrder" id="displayOrder" value="" placeholder="Display order" maxlength="3" />
                            </div>
                            <!-- iv class="12u 12u$(small)">
                                <input type="text" name="idq" id="idq" value="" placeholder="idq" maxlength="11" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="codiceq" id="codiceq" value="" placeholder="codiceq" maxlength="20" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="tabgenName" id="tabgenName" value="" placeholder="Tabgen table name" maxlength="20" />
                            </div -->
                            <div class="12u 12u$(small)">
                                <div class="select-wrapper">
                                    <select id="cbUseYn" name="cbUseYn">
                                      <option value=""> -- select -- </option>
                                      <option value="Y">Yes</option>
                                      <option value="N">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnSaveApplication" id="btnSaveApplication" value="Submit" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeAppPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- File popup layer -->
<div id="dim-layer-file" class="dim-layer">
    <div id="dimBgFile" class="dimBg"></div>
    <div id="file_layer" class="popcont-layer" style="max-width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="fileDiv">
                    <form id="frmFilePop" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="fileSaveFlag" name="fileSaveFlag" value="" >
                        <input type="hidden" id="linkedSeq" name="linkedSeq" value="" >
                        <input type="hidden" id="linkedTable" name="linkedTable" value="" >
                        <input type="hidden" id="curPage" name="curPage" value="" >
                        <input type="hidden" id="callFunction" name="callFunction" value="" >
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="text" name="filesSeq" id="filesSeq" value="" readonly="readonly" placeholder="File sequence" />
                            </div>
                            <div class="12u 12u$(small)">
                                <div class="select-wrapper">
                                    <select id="cbFileType" name="cbFileType">
                                      <option value=""> -- Select File Type -- </option>
                                      <c:out value="${cbFileTypeOptions }" escapeXml="false" />
                                    </select>
                                </div>
                            </div>
                            <div class="12u 12u$(small)">
                                <div class="select-wrapper">
                                    <select id="cbFileUsage" name="cbFileUsage">
                                      <option value=""> -- Select File Usage -- </option>
                                      <c:out value="${cbFileUsageOptions }" escapeXml="false" />
                                    </select>
                                </div>
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="originalName" id="originalName" value="" placeholder="Original Name" maxlength="11" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="filename" id="filename" value="" placeholder="File name" maxlength="20" />
                            </div>
                            <div class="12u 12u$(small)">
                                <input type="text" name="filesize" id="filesize" value="" placeholder="File size" maxlength="20" />
                            </div>
                            <div class="12u 12u$">
                                <input type="file" name="uploadFile" id="uploadFile" value="" required="required" placeholder="File for upload" maxlength="200" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnSaveFile" id="btnSaveFile" value="Submit" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeFilePopup" class="btn-layerClose">Close</a>
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
    
    gfn_toggleMenu('.systemMgmt');
    
    fn_getApplicationList(1);
});

function fn_getApplicationList(pageNo) {
	var param = "";
	param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getApplicationList";
    
	gf_send("<c:url value='/admin/systemManagement/getApplicationList' />", param, "fn_getApplicationListCallback");
}

function fn_getApplicationListCallback(data) {
	var applicationList = data.applicationList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblApplicationList(applicationList, paginationHtml);
}

function fn_makeTblApplicationList(applicationList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	
	if (applicationList != null && applicationList.length > 0) {
		for(var i=0; i<applicationList.length; i++) {
			bodyHtml += "<tr id=\"trApplicationList-"+i+"\">";
			bodyHtml += "    <td id=\"tdApplicationSeq-"+i+"\">"+applicationList[i].applicationSeq+"</td>";
			bodyHtml += "    <td id=\"tdApplicationName-"+i+"\">"+applicationList[i].applicationName+"</td>";
			//bodyHtml += "    <td id=\"tdIdq-"+i+"\">"+gfn_nullValue(applicationList[i].idq)+"</td>";
			//bodyHtml += "    <td id=\"tdCodiceq-"+i+"\">"+gfn_nullValue(applicationList[i].codiceq)+"</td>";
			//bodyHtml += "    <td id=\"tdTabgen-"+i+"\">"+gfn_nullValue(applicationList[i].tabgenName)+"</td>";
			bodyHtml += "    <td id=\"tdUsable-"+i+"\">"+applicationList[i].useYnNm+"</td>";
			bodyHtml += "    <td id=\"tdDisplayOrder-"+i+"\">"+applicationList[i].displayOrder+"</td>";
			bodyHtml += "    <td id=\"tdButton-"+i+"\"><input type=\"button\" id=\"btnEdit-"+i+"\" value=\"Edit\" class=\"button small special\" /></td>";
			bodyHtml += "</tr>";
		}
		pageHtml = paginationHtml;
	} else {
		bodyHtml += "<tr><td colspan=\"7\" style=\"text-align:center;\">There is no data.</td></tr>";
	}
	
	$("#tblApplicationList tbody").html(bodyHtml);
	$("#tblApplicationList tfoot #tdPaginationApplication").html(pageHtml);
}

var strClickEventNm  = "";
strClickEventNm += "#btnNewApplication, #btnSaveApplication, #btnNewFile, #btnSaveFile";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    
    if (id === "btnNewApplication") {
    	fn_applicationPopup("");
    } else if (id === "btnSaveApplication") {
    	fn_saveApplication();
    } else if (id === "btnNewFile") {
    	fn_filePopup("");
    } else if (id === "btnSaveFile") {
    	fn_saveFile();
    }
});

$(document).on("click", "#tblApplicationList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];

    $("#applicationSeq").val($("#tdApplicationSeq-"+no).text());
    $("#sLinkedSeq").val($("#applicationSeq").val());
    $("#sLinkedTable").val("tb_applications");
    
    for(var i=0; i<$("#tblApplicationList tbody tr").length; i++) {
        if (!$("#btnEdit-"+i).hasClass("special")) {
            $("#btnEdit-"+i).toggleClass("special");
        }
    }
    $("#btnEdit-"+no).toggleClass("special");
    
    if (sId === "tdButton") {
    	fn_applicationPopup(no);
    } else {
        fn_getFileList(1);
    }
});

function fn_applicationPopup(no) {
	gfn_clearForm("frmAppPop");
	
	if (no === "") {
		$("#saveFlag").val("I");
	} else {
		$("#saveFlag").val("U");
		fn_setFrmAppPop(no);
	}
	
	gfn_customLayerPopup('dim-layer-app', 'dimBgApp', 'app_layer', 'closeAppPopup');
}

function fn_setFrmAppPop(no) {
	var param = "";
	param += "applicationSeq="+$("#tdApplicationSeq-"+no).text();
	
	gf_send("<c:url value='/admin/systemManagement/getApplicationInfo' />", param, "fn_setFrmAppPopCallback");
}

function fn_setFrmAppPopCallback(data) {
	var applicationInfo = data.applicationInfo;
	
	$("#applicationSeq").val(applicationInfo.applicationSeq);
	$("#applicationName").val(applicationInfo.applicationName);
	$("#applicationDescription").val(applicationInfo.applicationDescription);
	$("#applicationIntroduction").val(applicationInfo.applicationIntroduction);
	$("#applicationUrl").val(applicationInfo.applicationUrl);
	$("#tutorialUrl").val(applicationInfo.tutorialUrl);
	$("#idq").val(applicationInfo.idq);
	$("#codiceq").val(applicationInfo.codiceq);
	$("#tabgenName").val(applicationInfo.tabgenName);
	$("#cbUseYn").val(applicationInfo.useYn);
    $("#cbUseYn option:eq("+applicationInfo.useYn+")").attr('selected', 'selected');
    $("#displayOrder").val(applicationInfo.displayOrder);
}

function fn_saveApplication() {
	var frmId = "frmAppPop";
    if (gfn_checkRequired(frmId) === true) {
        if($("#saveFlag").val() === "I") {
            gf_sendForm(frmId, "<c:url value='/admin/systemManagement/insertApplication' />", "fn_saveApplicationCallback");
        } else {
            gf_sendForm(frmId, "<c:url value='/admin/systemManagement/updateApplication' />", "fn_saveApplicationCallback");
        }
        $('#dim-layer-app').fadeOut();
    }
}

function fn_saveApplicationCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getApplicationList(1);
	}
}

function fn_getFileList(pageNo) {
	var frmId = "frmFilePop";

	if (!$("#sLinkedSeq").val()) {
		gfn_layerPopup("Choose application name to upload files.");
		return false;
	}
	
	$("#linkedSeq").val($("#sLinkedSeq").val());
	$("#linkedTable").val("tb_applications");
	$("#curPage").val(pageNo);
	$("#callFunction").val("fn_getFileList");
	
	gf_sendForm(frmId, "<c:url value='/admin/systemManagement/getApplicationFileList' />", "fn_getFileListCallback")
}

function fn_getFileListCallback(data) {
	var fileList = data.fileList;
	var paginationHtml = data.pageInfo.paginationHtml;
	
	fn_makeTblFileList(fileList, paginationHtml);
}

function fn_makeTblFileList(fileList, paginationHtml) {
	var bodyHtml = "";
	var pageHtml = "";
	
	if (fileList != null && fileList.length > 0) {
		for(var i=0; i<fileList.length; i++) {
			bodyHtml += "<tr>";
			bodyHtml += "    <td id=\"tdFileSeq-"+i+"\">"+fileList[i].filesSeq+"</td>";
			bodyHtml += "    <td id=\"tdOriginalName-"+i+"\">";
			bodyHtml += "        <input type=\"hidden\" id=\"listFilename-"+i+"\" name=\"listFilename-"+i+"\" value=\""+fileList[i].filename+"\" />";
			bodyHtml += fileList[i].originalName+"</td>";
			bodyHtml += "    <td id=\"tdFileType-"+i+"\">"+fileList[i].fileTypeNm+"</td>";
			bodyHtml += "    <td id=\"tdFileUsage-"+i+"\">"+fileList[i].fileUsageNm+"</td>";
			bodyHtml += "    <td id=\"tdAction-"+i+"\">";
			bodyHtml += "        <input type=\"button\" id=\"btnEditFile-"+i+"\" value=\"Edit\" class=\"button small special btnDynamic\" />";
			bodyHtml += "        <input type=\"button\" id=\"btnDeleteFile-"+i+"\" value=\"Delete\" class=\"button small special btnDynamic\" />";
			bodyHtml += "    </td>";
			bodyHtml += "</tr>";
		}
		pageHtml = paginationHtml;
	} else {
		bodyHtml += "<tr><td colspan=\"5\" style=\"text-align:center;\">There is no data.</td></tr>";
	}
	
	$("#tblFileList tbody").html(bodyHtml);
	$("#tblFileList tfoot #tdPaginationFile").html(pageHtml);
}

function fn_filePopup(no) {
    if (!$("#sLinkedSeq").val()) {
        gfn_layerPopup("Choose application name to upload files.");
        return false;
    }
	   
	gfn_clearForm("frmFilePop");
	
	if (no === "") {
		$("#fileSaveFlag").val("I");
		$("#linkedSeq").val($("#sLinkedSeq").val());
	    $("#linkedTable").val($("#sLinkedTable").val());
	} else {
		$("#fileSaveFlag").val("U");
		$("#filesSeq").val($("#tdFileSeq-"+no).text());
		fn_setFrmFilePop();
	}
	
	gfn_customLayerPopup('dim-layer-file', 'dimBgFile', 'file_layer', 'closeFilePopup');
}

function fn_setFrmFilePop() {
	var param = "";
	param += "filesSeq="+$("#filesSeq").val();
	
	gf_send("<c:url value='/admin/systemManagement/getApplicationFileInfo' />", param, "fn_setFrmFilePopCallback");
}

function fn_setFrmFilePopCallback(data) {
	var fileInfo = data.fileInfo;
	
	$("#filesSeq").val(fileInfo.filesSeq);
	$("#linkedSeq").val(fileInfo.linkedSeq);
	$("#linkedTable").val(fileInfo.linkedTable);
	//$("#cbFileType").val(fileInfo.fileType);
	//$("#cbFileType option:eq("+fileInfo.fileType+")").attr('selected', 'selected');
	$("select[id=cbFileType]").val(fileInfo.fileType);
	//$("#cbFileUsage").val(fileInfo.fileUsage);
	//$("#cbFileUsage option:eq("+fileInfo.fileUsage+")").attr('selected', 'selected');
	$("select[id=cbFileUsage]").val(fileInfo.fileUsage);
	$("#originalName").val(fileInfo.originalName);
	$("#filename").val(fileInfo.filename);
	$("#filesize").val(fileInfo.filesize);
}

function fn_saveFile() {
	var frmId = "frmFilePop";
	
	if ($("#fileSaveFlag").val() === "I") {
		gf_sendFileForm(frmId, "<c:url value='/admin/systemManagement/insertApplicationFiles' />", "fn_saveFileCallback");
	} else {
		if (!$("#uploadFile").val()) {
			gf_sendFileForm(frmId, "<c:url value='/admin/systemManagement/updateApplicationFilesWithNofile' />", "fn_saveFileCallback");
		} else {
			gf_sendFileForm(frmId, "<c:url value='/admin/systemManagement/updateApplicationFiles' />", "fn_saveFileCallback");
		}
	}
	$('#dim-layer-file').fadeOut();
}

function fn_saveFileCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getFileList(1);
	}
}

$(document).on("click", "#tblFileList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];
    
    fn_toggleClass(no)
    
    
});

$(document).on("click", ".btnDynamic", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];
    
    fn_toggleClass(no)
    
    if (sId === "btnEditFile") {
    	fn_filePopup(no);
    } else if (sId === "btnDeleteFile") {
        fn_deleteFile($("#tdFileSeq-"+no).text(), $("#listFilename-"+no).val());
    }
});

function fn_toggleClass(no) {
	for(var i=0; i<$("#tblFileList tbody tr").length; i++) {
        if (!$("#btnEditFile-"+i).hasClass("special")) {
            $("#btnEditFile-"+i).toggleClass("special");
        }
        if (!$("#btnDeleteFile-"+i).hasClass("special")) {
            $("#btnDeleteFile-"+i).toggleClass("special");
        }
    }
    $("#btnEditFile-"+no).toggleClass("special");
    $("#btnDeleteFile-"+no).toggleClass("special");
}

function fn_deleteFile(filesSeq, filename) {
	var param = "";
	param += "filesSeq="+filesSeq;
	param += "&";
	param += "filename="+filename;
	
	gf_send("<c:url value='/admin/systemManagement/deleteApplicationFiles' />", param, "fn_deleteFileCallback");
}

function fn_deleteFileCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getFileList(1);
	}
}

function fn_editFile(filesSeq) {
	var param = "";
    param += "filesSeq="+filesSeq;
    
    gf_send("<c:url value='/admin/systemManagement/getApplicationFileInfo' />", param, "fn_editFileCallback");
    $('#dim-layer-file').fadeOut();
}

function fn_editFileCallback(data) {
	gfn_layerPopup(data.msg);
	
	if (data.flag === "success") {
		fn_getFileList(1);
	}
}
</script>
</body>
</html>