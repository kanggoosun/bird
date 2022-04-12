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
    <title>User Management</title>
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
                    <h2>Demo Accounts Management</h2>
                </header>
                
                <form id="frmMainFilter" name="frmMainFilter">
                    <div class="row">
                        <div class="2u 12u$(medium) select-wrapper">
                            <select id="cbSearchField" name="cbSearchField">
                                <option value="da.name">Name</option>
                                <option value="da.email">E-mail</option>
                                <option value="da.company">company</option>
                            </select>
                        </div>
                        <div class="2u 12u$(medium)">
                            <input type="text" name="sKeyword" id="sKeyword" value="" placeholder="keyword"/> 
                        </div>
                    </div>
                </form>
                
                <h4>Demo Account for Web console</h4>
                <div id="tblDemoAccount" class="table-wrapper">
	                <table class="alt">
	                     <thead>
	                         <tr>
	                             <th style="text-align:center;">Web ID</th>
	                             <th style="text-align:center;">Password</th>
	                             <th style="text-align:center;">Area</th>
	                             <th style="text-align:center;">Group Code</th>
	                         </tr>
	                     </thead>
	                     <tbody style="text-align:center;font-size:0.8em;">
	                     </tbody>
	                 </table>
                </div>
                
                <h4>User List</h4>
                <div id="tblDemoAccountsList" class="table-wrapper">
                 <table class="alt">
                     <thead>
                         <tr>
                             <th style="text-align:center;">Name</th>
                             <th style="text-align:center;">E-mail</th>
                             <th style="text-align:center;">Phone</th>
                             <th style="text-align:center;">Site</th>
                             <th style="text-align:center;">Company</th>
                             <th style="text-align:center;">Country</th>
                             <th style="text-align:center;">Start Date</th>
                             <th style="text-align:center;">Block YN</th>
                             <!-- 
                             <th style="text-align:center;">Web ID</th>
                             <th style="text-align:center;">PWD</th>
                             -->
                             <th style="text-align:center;">Area</th>
                             <th style="text-align:center;">Group Code</th>
                             <th style="text-align:center;">Mobile ID</th>
                             <th style="text-align:center;">Device Code</th>
                             <th style="text-align:center;">Activation Code</th>
                             <th style="text-align:center;">Creation Date</th>
                             <th style="text-align:center;">Send</th>
                         </tr>
                     </thead>
                     <tbody style="text-align:center;font-size:0.8em;">
                     </tbody>
                     <tfoot style="font-size:0.8em;">
                         <tr><td colspan="15" style="text-align:center;" id="tdPagination"></td></tr>
                         <tr><td colspan="15" style="text-align:right;" id="tdButton"></td></tr>
                     </tfoot>
                 </table>
                </div>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- User Information popup layer -->
<div id="dim-layer-demoAccount" class="dim-layer">
    <div id="dimBgDemoAccount" class="dimBg"></div>
    <div id="demoAccount_layer" class="popcont-layer 12u$" style="width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="demoAccountDiv">
                    <form id="frmDemoAccountPop" method="post">
                        <div class="row uniform">
                            <input type="hidden" name="rSeq" id="rSeq" value="" />
                            <input type="hidden" name="rWebId" id="rWebId" value="" />
                            <input type="hidden" name="rPassword" id="rPassword" value="" />
                            <div class="6u 12u$(small)">
                                <input type="text" name="rName" id="rName" value="" placeholder="NAME" readonly="readonly"/>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="rEmail" id="rEmail" value="" placeholder="E-mail" readonly="readonly" />
                            </div>
                            <!-- 
                            <div class="6u 12u$(small)">
                                <input type="text" name="rWebId" id="rWebId" value="" placeholder="Web ID" readonly="readonly" maxlength="50"/>
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="rPassword" id="rPassword" value="" placeholder="Password" readonly="readonly" maxlength="50"/>
                            </div>
                            -->
                            <div class="6u 12u$(small)">
                                <input type="text" name="rArea" id="rArea" value="" placeholder="Area" readonly="readonly" maxlength="50"/>
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="rGroupCode" id="rGroupCode" value="" placeholder="Group code" readonly="readonly" maxlength="50"/>
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="rMobileId" id="rMobileId" value="" placeholder="Mobile ID" maxlength="1000" />
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="rDeviceCode" id="rDeviceCode" value="" placeholder="Device Code" readonly="readonly" maxlength="30" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="button" name="btnCheckSyncUser" id="btnCheckSyncUser" value="Check Sync user" class="button small fit" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="text" name="rActivationCode" id="rActivationCode" value="" placeholder="Activation Code" maxlength="50" />
                            </div>
                            <div class="12u$ 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnSaveDemoAccount" id="btnSaveDemoAccount" value="Save" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeDemoAccountPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mloader"><div class="masterkey_blink">Sending mail...</div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvGroupCode = "";
$(document).ready(function(){
	fn_getDemoAccountsList(1);
});

function fn_getDemoAccountsList(pageNo) {
	var param = "";
    param += "curPage="+pageNo;
    param += "&";
    param += "callFunction=fn_getDemoAccountsList";
    
    var searchField = gfn_nullValue($("#cbSearchField").val());
    var sKeyword = gfn_nullValue($("#sKeyword").val());
    if (searchField != "" && sKeyword != "") {
        param += "&";
        param += "cbSearchField="+searchField;
        param += "&";
        param += "sKeyword="+sKeyword;
    }
    
    gf_send("<c:url value='/admin/userManagement/getDemoAccountsList' />", param, "fn_getDemoAccountsListCallback");
}

function fn_getDemoAccountsListCallback(data) {
	var demoAccount = data.demoAccount;
	var demoAccountsList = data.demoAccountsList;
    var paginationHtml = data.pageInfo.paginationHtml;
    
    fn_makeTblDemoAccount(demoAccount);
	fn_makeTblDemoAccountsList(demoAccountsList, paginationHtml);
}

function fn_makeTblDemoAccount(demoAccount) {
	var bodyHtml = "";
	if (demoAccount != null) {
		bodyHtml += "<input type='hidden' name='dWebId' id='dWebId' value='"+demoAccount.webId+"' />";
		bodyHtml += "<input type='hidden' name='dPassword' id='dPassword' value='"+demoAccount.password+"' />";
		bodyHtml += "<input type='hidden' name='dArea' id='dArea' value='"+demoAccount.area+"' />";
		bodyHtml += "<input type='hidden' name='dGroupCode' id='dGroupCode' value='"+demoAccount.groupCode+"' />";
		bodyHtml += "<tr>";
		bodyHtml += "    <td>"+demoAccount.webId+"</td>";
		bodyHtml += "    <td>"+demoAccount.password+"</td>";
		bodyHtml += "    <td>"+demoAccount.area+"</td>";
		bodyHtml += "    <td>"+demoAccount.groupCode+"</td>";
		bodyHtml += "</tr>";
	}
	$("#tblDemoAccount tbody").html(bodyHtml);
}

function fn_makeTblDemoAccountsList(demoAccountsList, paginationHtml) {
	var bodyHtml = "";
    var pageHtml = "";
    var buttonHtml = "";
    
    if (demoAccountsList != null && demoAccountsList.length > 0) {
        for(var i=0; i<demoAccountsList.length; i++) {
        	//var webId = gfn_nullValue(demoAccountsList[i].webId);
        	//var password = gfn_nullValue(demoAccountsList[i].password);
        	var area = gfn_nullValue(demoAccountsList[i].area);
        	var groupCode = gfn_nullValue(demoAccountsList[i].groupCode);
        	var mobileId = gfn_nullValue(demoAccountsList[i].mobileId);
        	var deviceCode = gfn_nullValue(demoAccountsList[i].deviceCode);
        	var activationCode = gfn_nullValue(demoAccountsList[i].activationCode);
        	var startDate = gfn_nullValue(demoAccountsList[i].startDate);
        	
            bodyHtml += "<tr>";
            bodyHtml += "    <input type=\"hidden\" id=\"seq-"+i+"\" name=\"seq-"+i+"\" value=\""+demoAccountsList[i].seq+"\">";
            bodyHtml += "    <td id=\"tdName-"+i+"\">"+gfn_nullValue(demoAccountsList[i].name)+"</td>";
            bodyHtml += "    <td id=\"tdEmail-"+i+"\">"+gfn_nullValue(demoAccountsList[i].email)+"</td>";
            bodyHtml += "    <td id=\"tdPhone-"+i+"\">"+gfn_nullValue(demoAccountsList[i].phone)+"</td>";
            bodyHtml += "    <td id=\"tdSite-"+i+"\">"+gfn_nullValue(demoAccountsList[i].site)+"</td>";
            bodyHtml += "    <td id=\"tdCompany-"+i+"\">"+gfn_nullValue(demoAccountsList[i].company)+"</td>";
            bodyHtml += "    <td id=\"tdCountryName-"+i+"\">"+gfn_nullValue(demoAccountsList[i].countryName)+"</td>";
            bodyHtml += "    <td id=\"tdStartDate-"+i+"\">"+startDate+"</td>";
            bodyHtml += "    <td id=\"tdBlockYn-"+i+"\">"+gfn_nullValue(demoAccountsList[i].blockYn)+"</td>";
            //bodyHtml += "    <td id=\"tdWebId-"+i+"\">"+webId+"</td>";
            //bodyHtml += "    <td id=\"tdPassword-"+i+"\">"+password+"</td>";
            bodyHtml += "    <td id=\"tdArea-"+i+"\">"+area+"</td>";
            bodyHtml += "    <td id=\"tdGroupCode-"+i+"\">"+groupCode+"</td>";
            bodyHtml += "    <td id=\"tdMobileId-"+i+"\">"+mobileId+"</td>";
            bodyHtml += "    <td id=\"tdDeviceCode-"+i+"\">"+deviceCode+"</td>";
            bodyHtml += "    <td id=\"tdActivationCode-"+i+"\">"+activationCode+"</td>";
            bodyHtml += "    <td id=\"tdCreationDate-"+i+"\">"+gfn_nullValue(demoAccountsList[i].creationDate)+"</td>";
            if (area != "" && groupCode != "" && mobileId != "" && deviceCode != "" && activationCode != "" && startDate == "") {
            	bodyHtml += "    <td id=\"tdBtnSend-"+i+"\">";
            	bodyHtml += "        <input type=\"button\" name=\"btnSendMail-"+i+"\" id=\"btnSendMail-"+i+"\" value=\"Send\" class=\"button special small\" />";
            	bodyHtml += "    </td>";
            } else {
            	bodyHtml += "    <td id=\"tdBtnSend-"+i+"\" onclick=\"event.cancelBubble=true;\"></td>";
            }
            
            bodyHtml += "</tr>";
        }
        pageHtml = paginationHtml;
        buttonHtml += "<ul class=\"actions\">";
        buttonHtml += "    <li><input type=\"button\" name=\"btnExcelExport\" id=\"btnExcelExport\" value=\"Export\" class=\"button special fit\" /></li>";
        buttonHtml += "</ul>";
    } else {
        bodyHtml += "<tr>";
        bodyHtml += "    <td colspan=\"15\">There is no data.</td>";
        bodyHtml += "</tr>";
    }
    
    $("#tblDemoAccountsList tbody").html(bodyHtml);
    $("#tblDemoAccountsList tfoot #tdPagination").html(pageHtml);
    $("#tblDemoAccountsList tfoot #tdButton").html(buttonHtml);
}

$(document).on("change", "#cbSearchField", function(e){
    e.preventDefault();
    
    fn_getDemoAccountsList(1);
});

$(document).on("input", "#sKeyword", function(e){
    e.preventDefault();
    
    fn_getDemoAccountsList(1);
});

$(document).on("click", "#tblDemoAccountsList tbody td", function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    var sId = id.split("-")[0];
    var no = id.split("-")[1];
    
    if (sId == 'tdBtnSend') {
    	fn_sendMail(no);
    } else {
    	fn_demoAccountPop(no);
    }
});

function fn_setDemoAccountPop(no) {
	gfn_clearForm("frmDemoAccountPop");
	
	$("#rSeq").val($("#seq-"+no).val());
	$("#rName").val($("#tdName-"+no).text());
	$("#rEmail").val($("#tdEmail-"+no).text());
	if ($("#tdArea-"+no).text() === '') {
		$("#rWebId").val($("#dWebId").val());
		$("#rPassword").val($("#dPassword").val());
		$("#rArea").val($("#dArea").val());
		$("#rGroupCode").val($("#dGroupCode").val());
		$("#rMobileId").val("");
		$("#rDeviceCode").val("");
		$("#rActivationCode").val("");
	} else {
		$("#rWebId").val($("#dWebId").val());
		$("#rPassword").val($("#dPassword").val());
		$("#rArea").val($("#tdArea-"+no).text());
		$("#rGroupCode").val($("#tdGroupCode-"+no).text());
		$("#rMobileId").val($("#tdMobileId-"+no).text());
		$("#rDeviceCode").val($("#tdDeviceCode-"+no).text());
		$("#rActivationCode").val($("#tdActivationCode-"+no).text());
	}
}

function fn_demoAccountPop(no) {
	fn_setDemoAccountPop(no);
	gfn_customLayerPopup('dim-layer-demoAccount', 'dimBgDemoAccount', 'demoAccount_layer', 'closeDemoAccountPopup');
}

var strClickEventNm  = "";
strClickEventNm += "#btnSaveDemoAccount, #btnCheckSyncUser";
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();

    var id = $(this).attr("id");
    
    if (id === "btnSaveDemoAccount") {
        fn_submitDemoAccount();
    } else if (id === "btnCheckSyncUser") {
    	fn_checkSyncUser();
    }
});

function fn_checkSyncUser() {
    var param = "mdcId="+$("#rMobileId").val();
    gf_send("<c:url value='/mdc/mdcKoamtac/getSyncUser' />", param, "fn_checkSyncUserCallback");
}

function fn_checkSyncUserCallback(data) {
    if (data != null && data.syncUserMap != null && data.syncUserMap.mdcId != null) {
        gfn_layerPopup("The id "+data.syncUserMap.mdcId+" exists.");
        $("#rDeviceCode").val(data.syncUserMap.deviceCode);
    } else {
        gfn_layerPopup("The id "+$("#rMobileId").val()+" doess not exist.");
    }
}

function fn_submitDemoAccount() {
	gf_sendForm("frmDemoAccountPop", "<c:url value='/admin/userManagement/updateDemoAccount' />", "fn_submitDemoAccountCallback");
}

function fn_submitDemoAccountCallback(data) {
	$('#dim-layer-demoAccount').fadeOut();
    gfn_layerPopup(data.msg);
    
    fn_getDemoAccountsList(1);
}

function fn_sendMail(no) {
	var param = "";
	param += "seq="+$("#seq-"+no).val();
	
	$("#mloader").css("display", "block");
	gf_send("<c:url value='/admin/userManagement/sendDemoAccount' />", param, "fn_sendDemoAccountCallback");
}

function fn_sendDemoAccountCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
	fn_getDemoAccountsList(1);
}
</script>
</body>
</html>