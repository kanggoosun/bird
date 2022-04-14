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
    <title><spring:message code="WRD-SIGNIN" text="Sign In" /> - KoamTacON</title>
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
                    <h2><spring:message code="WRD-SIGNIN" text="Sign In" />
                    </h2>
                </header>
	            
	            <div class="row">
	                <div class="12u$">
	                    <form id="frmMain" method="post">
	                        <input type="hidden" id="rsaPublicKeyModulus" name="rsaPublicKeyModulus" value="">
	                        <input type="hidden" id="rsaPublicKeyExponent" name="rsaPublicKeyExponent" value="">
	                        <input type="hidden" id="encPassword" name="encPassword" value="">
	                        <div class="row uniform">
	                            <div class="12u 12u$">
	                                <input type="text" name="userId" id="userId" value="" required="required" placeholder="<spring:message code='WRD-USERID' text='User ID' />" />
	                            </div>
	                            <div class="12u 12u$">
	                                <input type="password" name="password" id="password" value="" required="required" placeholder="<spring:message code='WRD-PWD' text='Password' />" />
	                            </div>
	                            <div class="12u 12u$">
	                                <ul class="actions vertical">
	                                    <li><input type="button" id="btnSignin" value="<spring:message code='WRD-SIGNIN' text='Sign In' />" class="button special fit" /></li>
	                                    <li><input type="button" id="btnResetPasswordPop" value="<spring:message code='WRD-REPWD' text='Reset password' />" class="button special fit" /></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </form>
	                    <div class="12u 12u$">
                            <ul class="actions vertical">
                                <li><input type="button" id="btnSignup" value="<spring:message code='WRD-SIGNUP' text='Sign Up' />" class="button fit" /></li>
                                <%-- <li><input type="button" id="btnKDCReg" value="<spring:message code='WRD-KDCREG' text='KDC Registration' />" class="button fit" /></li>
                                <li><input type="button" id="btnRequestDemoAccount" value="<spring:message code='WRD-DEMOACCREQ' text='Demo Account Request' />" class="button fit" /></li> --%>
                                <!-- li><input type="button" id="btnTest" value="Test" class="button fit" /></li -->
                            </ul>
                        </div>
	                </div>
	            </div>
            </section>
            <%-- <!-- Footer -->
            <%@ include file="../include/footer.jsp" %> --%>
        </div>
    </div>
</div>

<!-- Reset password popup layer -->
<div id="dim-layer-reset" class="dim-layer">
    <div id="dimBgReset" class="dimBg"></div>
    <div id="reset_layer" class="popcont-layer 12u$">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="resetDiv">
                    <form id="frmResetPop" method="post">
                        <div class="row uniform">
                            <div class="12u$ 12u$(small)">
                                <input type="text" name="rUserId" id="rUserId" value="" placeholder="<spring:message code='WRD-USERID' text='User ID' />" required="required" maxlength="15" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="email" name="rEmail" id="rEmail" value="" placeholder="<spring:message code='WRD-EMAIL' text='Email' />" required="required" maxlength="50" />
                            </div>
                            <div class="12u$ 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnResetPassword" id="btnResetPassword" value="<spring:message code='WRD-RESET' text='Reset' />" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeResetPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- User info popup layer -->
<div id="dim-layer-userInfo" class="dim-layer">
    <div id="dimBgUserInfo" class="dimBg"></div>
    <div id="userInfo_layer" class="popcont-layer 12u$">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="resetDiv">
                    <form id="frmUserInfoPop" method="post">
                        <div class="row uniform">
                            <div class="12u$ 12u$(small)">
                                <input type="text" name="iUserId" id="iUserId" value="" placeholder="<spring:message code='WRD-USERID' text='User ID' />" required="required" maxlength="15" />
                            </div>
                            <div class="12u$ 12u$(small)">
                                <input type="email" name="iEmail" id="iEmail" value="" placeholder="<spring:message code='WRD-EMAIL' text='Email' />" required="required" maxlength="50" />
                            </div>
                            <div class="12u$ 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnConfirmInfo" id="btnConfirmInfo" value="<spring:message code='WRD-CONFIRM' text='Confirm' />" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeUserInfoPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="confirmPopupLayer" class="dim-layer">
    <div id="dimBgConfirmPopup" class="dimBg"></div>
    <div id="confirm_layer" class="pop-layer" style="width:400px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="confirmDiv" >
                    <ul>
                        <li><spring:message code='MSG-VW001' text='Please check your personal information and update it with correct information.' /></li>
                        <li><spring:message code='MSG-VW002' text='You are using a temporary password. Please change to a new password.' /> </li>
                    </ul>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeConfirmPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="requestPopupLayer" class="dim-layer">
    <div id="dimBgRequestPopup" class="dimBg"></div>
    <div id="request_layer" class="pop-layer" style="width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="requestDiv" >
                    <form id="frmRequest" method="post">
                        <div class="row uniform">
                        	<div class="12u$ 12u$(small)">
	                               <h4><spring:message code='MSG-VW003' text='All fields are mandatory, except site URL.' /></h4>
	                            </div>
                            <div class="6u 12u$(small)">
                                <input type="email" name="rEmail" id="rEmail" value="" required="required" placeholder="*<spring:message code='WRD-EMAIL' text='Email' />" maxlength="50" />
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="rName" id="rName" value="" required="required" placeholder="*<spring:message code='WRD-NAME' text='Name' />" maxlength="50" />
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="tel" name="rPhone" id="rPhone" value="" placeholder="*<spring:message code='WRD-PHONENO' text='Phone Number' />" maxlength="15" required="required"/>
                            </div>
                            <div class="6u$ 12u$(small)">
                                <input type="text" name="rCompany" id="rCompany" value="" placeholder="*<spring:message code='WRD-COMPNAME' text='Company name' />" maxlength="100" required="required"/>
                            </div>
                            <div class="6u 12u$(small)">
                                <input type="text" name="rSite" id="rSite" value="" placeholder="<spring:message code='WRD-SITEURL' text='URL of your site(optional)' />" maxlength="100" />
                            </div>
                            <div class="6u$ 12u$(small)">
                            	<input type="hidden" id="rCountry" name="rCountry" value="" />
                                <div class="select-wrappecr" id="divForCBCountry">
		                            <select id="cbCountry" name="cbCountry">
		                                <option value=""> -- *<spring:message code='MSG-VW004' text='Select your country' /> -- </option>
		                                <c:out value="${listCountryCode}" escapeXml="false" />
		                            </select>
                                </div>
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" id="btnSubmitRequest" value="<spring:message code='WRD-SUBMIT' text='submit' />" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeRequestPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mloader"><div class="masterkey_blink"><spring:message code='MSG-VW005' text='Sending mail...' /></div></div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var gvLastRequestURI = '<c:out value="${pageContext.request.contextPath}${lastRequestURI }" />';

$(document).ready(function(){
	$(".toggle").trigger('click');
	$("#userId").focus();
	$("#mloader").css("display", "none");
	fn_checkCookieSetting();
});

var strClickEventNm  = "";
strClickEventNm += "#btnSignin, #btnSignup, #btnResetPasswordPop, #btnResetPassword, #btnKDCReg, #btnConfirmInfo, #btnRequestDemoAccount, #btnSubmitRequest, #btnTest";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
	
    e.preventDefault();
    
    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

// key press event
var strKeypressEventNm  = "";
strKeypressEventNm += "#userId, #password, #iUserId, #iEmail";
$(document).on("keypress", strKeypressEventNm, function(e){
	var id = $(this).attr("id");
	
    if(e.keyCode === 13){
    	fn_eventCallFunction(id);
    }
});

function fn_eventCallFunction() {
	var args = fn_eventCallFunction.arguments;
	
	if (args[0] === "btnSignin" || args[0] === "password") {
		fn_getSecurity();
    } else if (args[0] === "btnSignup") {
        //fn_checkIp();
    	fn_moveToSingup();
    } else if (args[0] === "userId") {
    	$("#password").focus();
    } else if (args[0] === "btnResetPasswordPop") {
    	fn_resetPasswordPopup();
    } else if (args[0] === "btnResetPassword") {
    	fn_resetPassword();
    } else if (args[0] === "btnKDCReg") {
    	fn_userInfoPopup();
    } else if (args[0] === "btnConfirmInfo") {
    	fn_userInfoConfirm();
    } else if (args[0] === "iUserId") {
    	$("#iEmail").focus();
    } else if (args[0] === "iEmail") {
    	fn_userInfoConfirm();
    } else if (args[0] === "btnRequestDemoAccount") {
    	fn_requestPopup();
    } else if (args[0] === "btnSubmitRequest") {
    	fn_requestDemoAccount();
    }
	
    else if (args[0] === "btnTest") {
    	fn_test();
    }
}

function fn_getSecurity() {
	var frmId = "frmMain";
	if (gfn_checkRequired(frmId) === true) {
		gf_send('<c:out value="${pageContext.request.contextPath}/sign/getSecurity" />', "", "fn_getSecurityCallback");
	}
	return false;
}

function fn_getSecurityCallback(data) {
	var rsaPublicKeyModulus = data.publicKeyModulus;
    var rsaPublicKeyExponent = data.publicKeyExponent;
    var encPassword = gfn_rsaEnc($("#password").val(), rsaPublicKeyModulus, rsaPublicKeyExponent);

    $("#encPassword").val(encPassword);
    $("#password").val("");
    
    fn_signin();
}

function fn_signin() {
	var frmId = "frmMain";
	gf_sendForm(frmId, '<c:out value="${pageContext.request.contextPath}/sign/checkSign" />', "fn_signinCallback");
}

function fn_signinCallback(data) {
	var tgtUrl = "";
	
	if (data.LoginFlag === "Y") {
		if (data.userType === '9' || data.userType === '8') {
			if (gfn_nullValue(gvLastRequestURI,"") === "") {
				tgtUrl = '<c:out value="${pageContext.request.contextPath}/manager/main/view" />';
			} else {
				tgtUrl = gvLastRequestURI;
			}
			gf_submitMovePage(tgtUrl);
		} else {
			if (gfn_nullValue(gvLastRequestURI,"") === "") {
				if (data.initialPwdYn === "Y") {
				    gfn_customLayerPopup('confirmPopupLayer', 'dimBgConfirmPopup', 'confirm_layer', 'closeConfirmPopup');
				} else {
					gf_submitMovePage('<c:out value="${pageContext.request.contextPath}/main" />');
				}
            } else {
                tgtUrl = gvLastRequestURI;
                gf_submitMovePage(tgtUrl);
            }
		}
	} else {
        gfn_layerPopup(data.Msg);
		return false;
	}
}

$("#closeConfirmPopup").click(function(e){
    //gf_submitMovePage('<c:out value="${pageContext.request.contextPath}/main" />');
	gf_submitMovePage('<c:out value="${pageContext.request.contextPath}/sign/userProfile" />');
});

function fn_moveToSingup() {
	gf_submitMovePage('<c:out value="${pageContext.request.contextPath}/sign/signup" />');
}

function fn_resetPasswordPopup() {
	gfn_clearForm("frmResetPop");
	gfn_customLayerPopup('dim-layer-reset', 'dimBgReset', 'reset_layer', 'closeResetPopup');
}

function fn_resetPassword() {
	var frmId = "frmResetPop";
	if (gfn_checkRequired(frmId) === true) {
		if (gfn_checkFormat(frmId) === true) {
			$("#mloader").css("display", "block");
			var param = "";
			param += "userId="+$("#rUserId").val();
			param += "&";
			param += "email="+$("#rEmail").val();
			
			gf_send('<c:out value="${pageContext.request.contextPath}/sign/resetPassword" />', param, "fn_resetPasswordCallback");
			$('#dim-layer-reset').fadeOut();
		}
    }
}

function fn_resetPasswordCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
}

function fn_checkIp() {
	var param = "";
	
	gf_send('<c:out value="${pageContext.request.contextPath}/common/checkIp" />', param, "fn_checkIpCallback");
}

function fn_checkIpCallback(data) {
	if (data.flag === "pass") {
		fn_moveToSingup();
	} else {
		gfn_layerPopup(data.msg);
	}
}

function fn_checkCookieSetting() {
	var tmpCookie = 'tmpcookie';
	document.cookie = tmpCookie+'=KoamTacON';
	var cookiesEnabled = document.cookie.indexOf(tmpCookie) != -1;
	
	if (cookiesEnabled) {
		var expireDate = new Date();
		expireDate.setDate( expireDate.getDate() - 1);
		document.cookie = tmpCookie + '= ;expires='+expireDate.toGMTString()+'; path=/';
	} else {
		gfn_layerPopup('KoamtacON uses cookies. Please allow cookies.');
	}
}

function fn_userInfoPopup() {
	gfn_clearForm("frmUserInfoPop");
    gfn_customLayerPopup('dim-layer-userInfo', 'dimBgUserInfo', 'userInfo_layer', 'closeUserInfoPopup');
}

function fn_userInfoConfirm() {
    var frmId = "frmUserInfoPop";
    if (gfn_checkRequired(frmId) === true) {
        if (gfn_checkFormat(frmId) === true) {
            var param = "";
            param += "userId="+$("#iUserId").val();
            param += "&";
            param += "email="+$("#iEmail").val();
            
            gf_send('<c:out value="${pageContext.request.contextPath}/sign/checkUserInfo" />', param, "fn_userInfoConfirmCallback");
            $('#dim-layer-reset').fadeOut();
        }
    }
}

function fn_userInfoConfirmCallback(data) {
	if (data.flag == "success") {
		var param = "";
        param += "userId="+$("#iUserId").val();
        param += "&";
        param += "email="+$("#iEmail").val();
        
		gf_submitMovePage('<c:out value="${pageContext.request.contextPath}/kdc/registrationInfo" />', param);
	} else {
		gfn_layerPopup("<spring:message code='WRD-UNREGINFO' text='Unregistered information.' />");
	}
}

$("#cbCountry").change( function() {
    //fn_getCheckCountry();
});

function fn_getCheckCountry() {
	var param = "";
    param += "cbCountry="+$("#cbCountry").val();
    gf_send("<c:url value='/sign/checkCountry' />", param, "fn_getCheckCountryCallback");
}

function fn_getCheckCountryCallback(data) {
	if (data.continent === "2") {
		$("#cbCountry option:eq(0)").prop("selected", true);
		gfn_layerPopup("<spring:message code='MSG-VW007' text='Your country is serviced by Gulliver.' /><br><a href='http://www.gullivernet.com/en'><spring:message code='MSG-VW069' text='Click this link.' /> http://www.gullivernet.com/en</a>");
	}
}

function fn_requestPopup() {
	gfn_clearForm("frmRequest");
	gfn_customLayerPopup('requestPopupLayer', 'dimBgRequest', 'request_layer', 'closeRequestPopup');
}

function fn_requestDemoAccount() {
	var frmId = "frmRequest";

	if (gfn_checkRequired(frmId) === true) {
		if (!$("#cbCountry").val()) {
    		gfn_layerPopup("<spring:message code='MSG-VW004' text='Select your country' />", "cbCountry");
    		return false;
    	}
        if (gfn_checkFormat(frmId) === true) {
        	$('#requestPopupLayer').fadeOut();
    		$("#mloader").css("display", "block");
    		$("#rCountry").val($("#cbCountry option:selected").text());
    		gf_sendForm(frmId, "<c:url value='/sign/requestDemoAccount' />", "fn_requestDemoAccountCallback");
        }
	}
}

function fn_requestDemoAccountCallback(data) {
	$("#mloader").css("display", "none");
	gfn_layerPopup(data.msg);
}

function fn_test() {
	gf_send("<c:url value='/test/confTest' />", "", "fn_testCallback");
}

function fn_testCallback(data) {
	
}
</script>
</body>
</html>