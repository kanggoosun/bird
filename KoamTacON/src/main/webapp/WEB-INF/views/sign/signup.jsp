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
    <title><spring:message code='WRD-SIGNUP' text='Sign UP' /> - KoamTacON</title>
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
            <section style="max-width:600px;margin:auto;">
                <header class="main">
                    <h2><spring:message code='WRD-SIGNUP' text='Sign UP' /></h2>
                </header>
	            
	            <div class="row 200%">
	                <div class="12u$">
	                    <form id="frmMain">
	                        <input type="hidden" id="rsaPublicKeyModulus" name="rsaPublicKeyModulus" value="<c:out value='${publicKeyModulus }' />">
                            <input type="hidden" id="rsaPublicKeyExponent" name="rsaPublicKeyExponent" value="<c:out value='${publicKeyExponent }'/>">
                            <input type="hidden" id="encPassword" name="encPassword" value="">
	                        <div class="row uniform">
	                            <div class="12u$ 12u$(small)">
	                               <h4><spring:message code='MSG-VW003' text='All fields are mandatory, except site URL.' /></h4>
	                            </div>
	                            <div class="6u 12u$(small)">
	                                <input type="text" name="userId" id="userId" value="" required="required" placeholder="*<spring:message code='WRD-USERID' text='User ID' />" maxlength="15"/>
	                                <input type="hidden" name="flagIdDupeChk" id="flagIdDupeChk" value="false" />
	                                <input type="hidden" name="userType" id="userType" value="0" />
	                            </div>
	                            <div class="6u$ 12u$(small)">
                                    <input type="button" name="btnIdDupeChk" id="btnIdDupeChk" value="<spring:message code='WRD-IDDUPCHK' text='ID Duplication Check' />" class="button fit" />
                                </div>
                                <div id="divIdRules" class="12u$ 12u$(small)" style="display:none;">
                                    <ul>
                                        <li><spring:message code='MSG-VW008' text='ID must be between 8 – 15 characters.' /></li>
                                        <li><spring:message code='MSG-VW009' text='ID can contain letters, numbers, or period.' /></li>
                                        <li><spring:message code='MSG-VW010' text='ID must contain at least one letter.' /></li>
                                        <li><spring:message code='MSG-VW011' text='ID is case-sensitive.' /></li>
                                    </ul>
                                </div>
	                            <div class="6u 12u$(small)">
	                                <input type="email" name="email" id="email" value="" required="required" placeholder="*<spring:message code='WRD-EMAIL' text='Email' />" maxlength="50" />
	                            </div>
	                            <div class="6u$ 12u$(small)">
	                                <input type="text" name="name" id="name" value="" required="required" placeholder="*<spring:message code='WRD-NAME' text='Name' />" maxlength="50" />
                                </div>
	                            <!-- div class="6u 12u$(small)">
	                                <div class="12u$ 12u$(small) row">
                                        <div class="10u 12u$(small)">
                                            <input type="password" name="password" id="password" value="" required="required" placeholder="*Password(mandatory)" maxlength="15" />
                                        </div>
                                        <div id="divPasswordRule" class="2u 12u$(small)">
                                            <img src="/resources/images/icon/information-circular-button.png" style="background-color:#99cc33;"/>
                                        </div>
                                    </div>
	                            </div -->
	                            <!--  div class="6u$ 12u$(small)">
	                                <input type="password" name="confirmPassword" id="confirmPassword" value="" required="required" placeholder="*Confirm password(mandatory)" maxlength="15" />
	                                <label for="confirmPassword" class="red">Confirm your password</label>
	                            </div -->
	                            <div class="6u 12u$(small)">
	                                <input type="tel" name="phone" id="phone" value="" placeholder="*<spring:message code='WRD-PHONENO' text='Phone Number' />" maxlength="15" required="required"/>
	                            </div>
	                            <div class="6u$ 12u$(small)">
	                                <input type="text" name="company" id="company" value="" placeholder="*<spring:message code='WRD-COMPNAME' text='Company Name' />" maxlength="100" required="required"/>
	                            </div>
	                            <div class="6u 12u$(small)">
	                                <input type="text" name="site" id="site" value="" placeholder="<spring:message code='WRD-SITEURL' text='URL of your site(optional)' />" maxlength="100" />
	                            </div>
	                            <div class="6u$ 12u$(small)">
	                                <div class="select-wrappecr" id="divForCBCountry">
			                            <select id="cbCountry" name="cbCountry">
			                                <option value=""> -- *<spring:message code='MSG-VW004' text='Select your country' /> -- </option>
			                                <c:out value="${listCountryCode}" escapeXml="false" />
			                            </select>
	                                </div>
	                            </div>
	                            <div class="12u 12u$">
	                                <ul class="actions vertical">
	                                    <li><input type="button" id="btnSignup" value="<spring:message code='WRD-SUBMIT' text='Submit' />" class="button special fit" /></li>
	                                </ul>
	                            </div>
	                            <div class="12u 12u$">
	                            	<a href="<c:url value='/sign/terms' />"><spring:message code='MSG-VW012' text='By signing in, you agree to our Terms of Use.' /></a>
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

<div id="dim-layer-rules" class="dim-layer">
    <div id="dimBgRules" class="dimBg"></div>
    <div id="rules_layer" class="pop-layer" style="width:600px;">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="divRules" ></div>
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeRulesPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="confirmPopupLayer" class="dim-layer">
    <div id="dimBgConfirmPopup" class="dimBg"></div>
    <div id="confirm_layer" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="confirmDiv" >
                    <p class="ctxt mb20">
                    <spring:message code='MSG-VW013' text='Your sign up was successful!' />
                    <spring:message code='MSG-VW014' text='Please register your KDCs.' />
                    </p>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeConfirmPopup" class="btn-layerClose"><spring:message code='WRD-CLOSE' text='Close' /></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- popup layer -->
<%@ include file="../include/popupLayer.jsp" %>

<script type="text/javascript">
var frmId = "frmMain";
var gvMsg = "<c:out value='${redirectMsg }' />";

$(document).ready(function(){
	$("#flagIdDupeChk").val("false");
	$("#userId").focus();
	console.log("gvMsg="+gvMsg);
	if (gvMsg != null && gvMsg != "" && gvMsg != "undefined") {
		gfn_layerPopup(gvMsg);
	}
});

var strClickEventNm  = "";
strClickEventNm += "#btnIdDupeChk, #btnSignup, #divIdRule, #divPasswordRule";
// mouse click event
$(document).on("click", strClickEventNm, function(e){
    e.preventDefault();
    
    var id = $(this).attr("id");
    fn_eventCallFunction(id);
});

//key press event
var strKeypressEventNm  = "";
strKeypressEventNm += "#userId, #email, #name, #password, #confirmPassword, #phone, #company, #site, #cbCountry";
$(document).on("keypress", strKeypressEventNm, function(e){
    var id = $(this).attr("id");
    
    if(e.keyCode == 13){
        fn_eventCallFunction(id);
    }
});

function fn_eventCallFunction() {
    var args = fn_eventCallFunction.arguments;
    
    if (args[0] === "btnIdDupeChk") {
    	fn_isExist();
    } else if (args[0] === "btnSignup") {
    	fn_submit();
    } else if (args[0] === "userId") {
    	if (fn_isExist() === true) {
    		$("#email").focus();
    	} else {
    		$("#userId").focus();
    	}
    } else if (args[0] === "email") {
    	$("#name").focus();
    } else if (args[0] === "name") {
        //$("#password").focus();
    	$("#phone").focus();
    } else if (args[0] === "password") {
        //$("#confirmPassword").focus();
    } else if (args[0] === "confirmPassword") {
        //$("#phone").focus();
    } else if (args[0] === "phone") {
        $("#company").focus();
    } else if (args[0] === "company") {
        $("#site").focus();
    } else if (args[0] === "site") {
        $("#cbCountry").focus();
    } else if (args[0] === "divIdRule") {
    	var idRule = "";
    	idRule += "<ul>";
    	idRule += "  <li><spring:message code='MSG-VW008' text='ID must be between 8 – 15 characters.' /></li>";
    	idRule += "  <li><spring:message code='MSG-VW009' text='ID can contain letters, numbers, or period.' /></li>";
    	idRule += "  <li><spring:message code='MSG-VW010' text='ID must contain at least one letter.' /></li>";
    	idRule += "</ul>";
    	$("#divRules").html("");
    	$("#divRules").html(idRule);
    	
    	gfn_customLayerPopup('dim-layer-rules', 'dimBgRules', 'rules_layer', 'closeRulesPopup');
    } else if (args[0] === "divPasswordRule") {
    	var passwordRule = "";
    	passwordRule += "<ul>";
    	passwordRule += "  <li><spring:message code='MSG-VW015' text='Password must be 8 ~ 15 digits.' /></li>";
    	passwordRule += "  <li><spring:message code='MSG-VW016' text='Password must be in alphabet, numbers and special characters(!,@,#,$,%,^,&,*,?,_,~) only.' /></li>";
    	passwordRule += "  <li><spring:message code='MSG-VW017' text='Password must contain at least one alphabet, one number and one special character.' /></li>";
    	passwordRule += "  <li><spring:message code='MSG-VW018' text='Password cannot contain more than 3 consecutive digits. Ex: pass1234 = error' /></li>";
    	passwordRule += "  <li><spring:message code='MSG-VW019' text='Password cannot contain more than 3 of the same digit. Ex: pass9999 = error' /></li>";
    	passwordRule += "</ul>";
    	$("#divRules").html("");
        $("#divRules").html(passwordRule);
        
        gfn_customLayerPopup('dim-layer-rules', 'dimBgRules', 'rules_layer', 'closeRulesPopup');
    }
}

function fn_isExist() {
	if (!$("#userId").val()) {
		gfn_layerPopup("<spring:message code='MSG-VW070' text='Please input ID.' />", "userId");
	} else {
		var id = $("#userId").val();
		if (id.length < 8) {
			gfn_layerPopup("<spring:message code='MSG-VW008' text='ID must be between 8 – 15 characters.' />");
		} else if (id.length > 15) {
			gfn_layerPopup("<spring:message code='MSG-VW008' text='ID must be between 8 – 15 characters.' />");
		} else {
			var blankPattern = new RegExp(/[\s]/g);
			var bool = blankPattern.test(id);
			
			if (bool) {
				gfn_layerPopup("Spaces are not allowed.");
			} else {
				var pattern = new RegExp(/^[a-zA-Z0-9]+[a-zA-Z0-9.]+[a-zA-Z0-9.]$/g);
				bool = pattern.test(id);
				
				if (bool && isNaN(id)) {
					var param = "";
				    param += "userId="+id;
				    gf_send("<c:url value='/sign/isExist' />", param, "fn_isExistCallback");
				} else {
					gfn_layerPopup("<spring:message code='MSG-VW010' text='ID must contain at least one letter.' /><br><spring:message code='MSG-VW009' text='ID can contain letters, numbers, or period.' />");
				}
			}
		}
	}
}

function fn_isExistCallback(data) {
	var isExist = data.isExist;
	
	if (isExist === 0) {
		$("#flagIdDupeChk").val("true");
		gfn_layerPopup("<spring:message code='MSG-VW021' text='ID is available.' />");
		return true;
	} else {
		$("#flagIdDupeChk").val("false");
		gfn_layerPopup("<spring:message code='MSG-VW022' text='ID already exists.' />", "userId");
		return false;
	}
}

function fn_submit() {
	if (!$("#userId").val()) {
		gfn_layerPopup("<spring:message code='MSG-VW023' text='Please enter your id.' />", "userId");
		return false;
	}
	
	if (eval($("#flagIdDupeChk").val()) === false) {
		gfn_layerPopup("<spring:message code='MSG-VW024' text='Click the ID Duplication Check button to check whether id exists already, if not, you can create the id.' />");
		return false;
	}
	
    if (gfn_checkRequired(frmId) === true) {
    	if (!$("#cbCountry").val()) {
    		gfn_layerPopup("<spring:message code='MSG-VW004' text='Select your country.' />", "cbCountry");
    		return false;
    	}
        if (gfn_checkFormat(frmId) === true) {
        	/*
            if (gfn_checkPassword(frmId) === true) {
            	var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
                var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
                var encPassword = gfn_rsaEnc($("#password").val(), rsaPublicKeyModulus, rsaPublicKeyExponent);
                $("#encPassword").val(encPassword);
                $("#password").val("");
            	gf_sendForm(frmId, "<c:url value='/sign/insertSign' />", "fn_submitCallback");
            }
        	*/
        	gf_sendForm(frmId, "<c:url value='/sign/useRequest' />", "fn_submitCallback");
        }
    }
}

function fn_submitCallback(data) {
    var result = data.result;
    
    if (result === "success") {
    	gfn_customLayerPopup('confirmPopupLayer', 'dimBgConfirmPopup', 'confirm_layer', 'closeConfirmPopup');
    } else {
    	
    }
}

$("#closeConfirmPopup").click(function(e){
	var param = "";
	param += "userId="+$("#userId").val();
	param += "&";
	param += "email="+$("#email").val();
	gf_submitMovePage("<c:url value='/kdc/registrationInfo' />", param);
});

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
		gfn_layerPopup("<spring:message code='MSG-VW008' text='Your country is serviced by Gulliver.' /><br><a href='http://www.gullivernet.com/en'><spring:message code='MSG-VW069' text='Click this link.' /> http://www.gullivernet.com/en</a>");
	}
}

$("#userId").focus( function() {
	if ($("#divIdRules").css("display") == "none") {
	    $("#divIdRules").css("display", "block");
	}
});

$("#btnIdDupeChk").focus( function() {
	if ($("#divIdRules").css("display") == "none") {
        $("#divIdRules").css("display", "block");
    }
});

$("#userId").blur( function() {
	if ($("#divIdRules").css("display") == "block") {
        $("#divIdRules").css("display", "none");
    }
});

$("#btnIdDupeChk").blur( function() {
	if ($("#divIdRules").css("display") == "block") {
        $("#divIdRules").css("display", "none");
    }
});
</script>
</body>
</html>