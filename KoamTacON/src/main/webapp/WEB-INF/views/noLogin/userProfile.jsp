<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
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
    <title><spring:message code='WRD-PROFILE' text='Profile' /> - KoamTacON</title>
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
            <section>
                <header class="main">
                    <h2><spring:message code='WRD-PROFILE' text='Profile' /></h2>
                </header>
	            
	            <div class="row 200%">
	                <div class="12u$">
	                    <form id="frmMain">
		                    <input type="hidden" id="rsaPublicKeyModulus" name="rsaPublicKeyModulus" value="<c:out value='${publicKeyModulus }' />">
	                        <input type="hidden" id="rsaPublicKeyExponent" name="rsaPublicKeyExponent" value="<c:out value='${publicKeyExponent }'/>">
	                        <div class="row uniform">
	                            <div class="6u$ 12u$(small)">
                                    <input type="text" name="userId" id="userId" value="<c:out value='${infoMap.userId}' />" readonly="readonly" placeholder="<spring:message code='WRD-USERID' text='User ID' />" maxlength="50" />
                                    <input type="hidden" name="userType" id="userType" value="<c:out value='${infoMap.userType}' />"/>
                                </div>
	                            <div class="6u 12u$(small)">
	                                <input type="email" name="email" id="email" value="<c:out value='${infoMap.email}' />" required="required" placeholder="<spring:message code='WRD-EMAIL' text='Email' />" maxlength="50" />
	                            </div>
	                            <div class="6u$ 12u$(small)">
	                                <input type="text" name="name" id="name" value="<c:out value='${infoMap.name}' />" required="required" placeholder="<spring:message code='WRD-NAME' text='Name' />" maxlength="50" />
	                            </div>
	                            <div class="6u 12u$(small)">
	                                <input type="tel" name="phone" id="phone" value="<c:out value='${infoMap.phone}' />" placeholder="<spring:message code='WRD-PHONENO' text='Phone Number' />" maxlength="20" />
	                            </div>
	                            <div class="6u 12u$(small)">
                                    <input type="text" name="company" id="company" value="<c:out value='${infoMap.company}' />" placeholder="<spring:message code='WRD-COMPNAME' text='Company' />" maxlength="20" />
                                </div>
	                            <div class="6u 12u$(small)">
	                                <input type="text" name="site" id="site" value="<c:out value='${infoMap.site}' />" placeholder="<spring:message code='WRD-SITEURL' text='URL of your site' />" maxlength="100" />
	                            </div>
	                            <div class="6u$ 12u$(small)">
	                                <div class="select-wrappecr" id="divForCBCountry">
	                                    <select id="cbCountry" name="cbCountry">
	                                      <option value=""> <spring:message code='MSG-VW004' text='-- Select your country --'/> </option>
	                                      <c:out value="${listCountryCode}" escapeXml="false" />
	                                    </select>
	                                </div>
	                            </div>
	                            <div class="12u 12u$">
	                                <ul class="actions vertical">
	                                    <li><input type="button" id="btnSubmit" value="<spring:message code='WRD-SUBMIT' text='Submit' />" class="button special fit" /></li>
	                                    <li><input type="button" id="btnChangePasswordPop" value="<spring:message code='WRD-CHGPWD' text='Change Password' />" class="button special fit" /></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	            <%-- 
	            <!-- header class="main">
                    <h2>Mobile Application Information</h2>
                </header>
                
                <div class="row 200%">
                    <div class="12u$">
                        <div class="row uniform">
                            <div class="6u 12u$(small)">
                                <div class="3u 12u$(small)" style="text-align:right;"><h5>Owner ID</h5></div>
                                <div class="9u$ 12u$(small)">
                                    <input type="text" name="userId" id="userId" value="<c:out value='${infoMap.userId}' />" readonly="readonly" placeholder="<spring:message code='' text='User ID" maxlength="50" />
                                </div>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="email" name="email" id="email" value="<c:out value='${infoMap.email}' />" required="required" placeholder="<spring:message code='' text='Email" maxlength="50" />
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="name" id="name" value="<c:out value='${infoMap.name}' />" required="required" placeholder="<spring:message code='' text='Name" maxlength="50" />
                            </div>
                        </div>
                    </div>
                </div-->
                --%>
            </section>
            <!-- Footer -->
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
</div>

<!-- Change password popup layer -->
<div id="dim-layer-change" class="dim-layer">
    <div id="dimBgChange" class="dimBg"></div>
    <div id="change_layer" class="popcont-layer 12u$">
        <div class="pop-container" style="max-width:600px;">
            <div class="pop-conts">
                <!--content //-->
                <div id="changeDiv">
                    <form id="frmChangePop" method="post">
                        <input type="hidden" name="rUserId" id="rUserId" value="" />
                        <input type="hidden" id="encPassword" name="encPassword" value="">
                        <input type="hidden" id="encNewPassword" name="encNewPassword" value="">
                        <div class="row uniform">
                            <div class="12u$ 12u$(small)">
                                <input type="password" name="curPassword" id="curPassword" value="" placeholder="<spring:message code='WRD-CURPWD' text='Current Password' />" required="required" maxlength="15" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="password" name="newPassword" id="newPassword" value="" placeholder="<spring:message code='WRD-NEWPWD' text='New Password' />" required="required" maxlength="15" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="password" name="newPasswordConfirm" id="newPasswordConfirm" value="" placeholder="<spring:message code='WRD-CNFNEWPWD' text='Confirm New Password' />" required="required" maxlength="15" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnChangePassword" id="btnChangePassword" value="Change" class="button special fit" /></li>
                                </ul>
                            </div>
	                        <div id="divBtnRule" class="12u$ 12u$(small)">
	                        	<ul class="actions vertical">
                                    <li><input type="button" name="btnCtrlRules" id="btnCtrlRules" value="<spring:message code='WRD-EXPNDRULE' text='Expand Rules' />" class="button special fit small" /></li>
                                </ul>
	                        </div>
	                        <div id="divPwdRules" class="12u$ 12u$(small)" style="display:none;">
	                            <ul>
	                                <li><spring:message code='MSG-VW015' text='Password must be 8 ~ 15 digits.' /></li>
									<li><spring:message code='MSG-VW016' text='Password must be in alphabet(case-sensitive), numbers and special characters(!,@,#,$,%,^,&amp;,*,?,_,~) only.' /></li>
									<li><spring:message code='MSG-VW017' text='Password must contain at least one alphabet, one number and one special character.' /></li>
									<li><spring:message code='MSG-VW018' text='Password cannot contain more than 3 consecutive digits.(Ex: pass1234 = error)' /></li>
									<li><spring:message code='MSG-VW019' text='Password cannot contain more than 3 of the same digit.(Ex: pass9999 = error)' /></li>
	                            </ul>
	                        </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeChangePopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
    $("#email").focus();
    $("#mloader").css("display", "none");
});

var strClickEventNm  = "";
strClickEventNm += "#btnSubmit, #btnChangePasswordPop, #btnChangePassword";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();
    
    var id = $(this).attr("id");
    
    fn_eventCallFunction(id);
});

//key press event
var strKeypressEventNm  = "";
strKeypressEventNm += "#email, #name, #phone, #company, #site, #cbCountry";
$(document).on("keypress", strKeypressEventNm, function(e){
    var id = $(this).attr("id");
    
    if(e.keyCode == 13){
        fn_eventCallFunction(id);
    }
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnSubmit") {
        fn_submit();
    } else if (args[0] === "email") {
        $("#name").focus();
    } else if (args[0] === "name") {
        $("#phone").focus();
    } else if (args[0] === "phone") {
        $("#company").focus();
    } else if (args[0] === "company") {
        $("#site").focus();
    } else if (args[0] === "site") {
        $("#cbCountry").focus();
    } else if (args[0] === "btnChangePasswordPop") {
    	fn_chagnePasswordPopup();
    } else if (args[0] === "btnChangePassword") {
    	fn_chagnePassword();
    }
}

function fn_submit() {
	var frmId = "frmMain";
	
    if (gfn_checkRequired(frmId) === true) {
        if (gfn_checkFormat(frmId) === true) {
            gf_sendForm(frmId, "<c:url value='/noLogin/updateSign' />", "fn_submitCallback");
        }
    }
}

function fn_submitCallback(data) {
    var result = data.result;
    
    if (result === "success") {
    	var aa = gfn_layerPopup("<spring:message code='MSG-VW025' text='Successfully saved.' />");

        gf_submitMovePage("<c:url value='/noLogin/userProfile' />");
    } else {
    	gfn_layerPopup("<spring:message code='MSG-SV015' text='Failed to save.' />");
    }
}

function fn_chagnePasswordPopup() {
    gfn_clearForm("frmChangePop");
    $("#rUserId").val($("#userId").val());
    gfn_customLayerPopup('dim-layer-change', 'dimBgChange', 'change_layer', 'closeChangePopup');
}

function fn_checkPassword(password, objId) {
    var flag = false;
    
    if(password.length < 8) {
        gfn_layerPopup("<spring:message code='MSG-VW015' text='Password must be 8 ~ 15 digits.' />", objId);
        return false;
    }
    
    if (!password.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
        gfn_layerPopup("<spring:message code='MSG-VW016' text='Password must be in alphabet, numbers and special characters(!,@,#,$,%,^,&,*,?,_,~) only.' /> <br><spring:message code='MSG-VW017' text='Password must contain at least one alphabet, one number and one special character.' />", objId);
        return false;
    }
    
    var sameDigit = false;
    var consecutiveStringF = false;
    var consecutiveStringR = false;
    
    for(var i=0; i<password.length-2; i++) {
        var firstChar = password.charAt(i);
        var secondChar = password.charAt(i+1);
        var thirdChar = password.charAt(i+2);
        
        if (firstChar === secondChar && firstChar === thirdChar) {
            sameDigit = true;
        }
        
        if (firstChar.charCodeAt(0) - secondChar.charCodeAt(0) == 1 && secondChar.charCodeAt(0) - thirdChar.charCodeAt(0) == 1) {
            consecutiveStringR = true;
        }
        
        if (firstChar.charCodeAt(0) - secondChar.charCodeAt(0) == -1 && secondChar.charCodeAt(0) - thirdChar.charCodeAt(0) == -1) {
            consecutiveStringF = true;
        }
    }
    
    if (sameDigit) {
        gfn_layerPopup("<spring:message code='MSG-VW018' text='Password cannot contain more than 3 consecutive digits.(Ex: pass1234 = error)' />", objId);
        return false;
    }
    
    if (consecutiveStringR || consecutiveStringF) {
        gfn_layerPopup("<spring:message code='MSG-VW019' text='Password cannot contain more than 3 of the same digit.(Ex: pass9999 = error)' />", objId);
        return false;
    }
    
    return true;
}

function fn_chagnePassword() {
	var frmId = "frmChangePop";
    if (gfn_checkRequired(frmId) === true) {
    	if ($("#newPassword").val() === $("#newPasswordConfirm").val()) {
    		if (fn_checkPassword($("#newPassword").val(), "newPassword")) {
    			$("#mloader").css("display", "block");
	    		var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
	            var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
	            var encPassword = gfn_rsaEnc($("#curPassword").val(), rsaPublicKeyModulus, rsaPublicKeyExponent);
	            $("#encPassword").val(encPassword);
	            var encNewPassword = gfn_rsaEnc($("#newPassword").val(), rsaPublicKeyModulus, rsaPublicKeyExponent);
	            $("#encNewPassword").val(encNewPassword);
	            
	            $("#curPassword").val("");
	            $("#newPassword").val("");
	            $("#newPasswordConfirm").val("");
	            
	            gf_sendForm(frmId, "<c:url value='/noLogin/changePassword' />", "fn_changePasswordCallback");
	            $('#dim-layer-change').fadeOut();
    		}
    	} else {
    		gfn_layerPopup("<spring:message code='MSG-VW027' text='Confirm new password is different from new password.' />");
    	}
    }
}

function fn_changePasswordCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
}

$(document).on("click", "#btnCtrlRules", function(e) {
	if ($("#divPwdRules").css("display") == "none") {
	    $("#divPwdRules").css("display", "block");
	    $("#btnCtrlRules").prop("value","Collapse Rules");
	} else {
		$("#divPwdRules").css("display", "none");
		$("#btnCtrlRules").prop("value","Expand Rules");
	}
});
</script>
</body>
</html>