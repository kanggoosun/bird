var GV_CURR_PAGE_NO = "1";     // Default : 1  [현재 페이지 번호]
var GV_PAGE_COUNT   = "10";    // Default : 10 [한 페이지 개수]

window.onerror = function(){
    alert("javascript Error !!");
};

$(function() {
	$(".dim-layer").draggable();
});

String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/gi, "");
}

function gf_getAfterFunction(actionUrl, callbackFunction){
	if(callbackFunction == null){
        var sepSpace = actionUrl.lastIndexOf("/");
        var sepPoint = actionUrl.indexOf(".");
        
        callbackFunction = eval(actionUrl.substring(sepSpace+1, sepPoint) + "After");
    }
    
    return callbackFunction;
}

function gf_send(actionUrl, param, callbackFunction){
	var myajax = new MyAjax();
    myajax.send(actionUrl, param, gf_getAfterFunction(actionUrl, callbackFunction));
    
    return false;
}

function gf_sendWithParamForCallback(actionUrl, param, callbackFunction, cbParam){
	var myajax = new MyAjax();
    myajax.sendWithParamForCallback(actionUrl, param, gf_getAfterFunction(actionUrl, callbackFunction), cbParam);
    
    return false;
}

function gf_sendSync(actionUrl, param, callbackFunction){
	var myajax = new MyAjax();
    myajax.sendSync(actionUrl, param, gf_getAfterFunction(actionUrl, callbackFunction));
    
    return false;
}

function gf_sendForm(formId, actionUrl, callbackFunction){
    var url = "";
    if(actionUrl != null && actionUrl != ""){
        url = actionUrl;
        
        $("#"+formId).attr("action", actionUrl);
    } else {
        url = $("#"+formId).attr("action");
    }

    var myajax = new MyAjax();
    myajax.sendForm(formId, gf_getAfterFunction(url, callbackFunction));
    
    return false;
}

function gf_sendFormWithParamForCallback(formId, actionUrl, callbackFunction, cbParam){
    var url = "";
    if(actionUrl != null && actionUrl != ""){
        url = actionUrl;
        
        $("#"+formId).attr("action", actionUrl);
    } else {
        url = $("#"+formId).attr("action");
    }

    var myajax = new MyAjax();
    myajax.sendFormWithParamForCallback(formId, gf_getAfterFunction(url, callbackFunction), cbParam);
    
    return false;
}

function gf_sendFormSync(formId, actionUrl, callbackFunction){
    var url = "";
    if(actionUrl != null && actionUrl != ""){
        url = actionUrl;
        
        $("#"+formId).attr("action", actionUrl);
    } else {
        url = $("#"+formId).attr("action");
    }

    var myajax = new MyAjax();
    myajax.sendFormSync(formId, gf_getAfterFunction(url, callbackFunction));
    
    return false;
}

function gf_sendFileForm(formId, actionUrl, callbackFunction){
    var url = "";

    if(actionUrl != null && actionUrl != ""){
        url = actionUrl;
        
        $("#" + formId).attr("action", actionUrl);
    } else {
        url = $("#" + formId).attr("action");
    }
    
    var myajax = new MyAjax();
    myajax.sendFileForm(formId, gf_getAfterFunction(url, callbackFunction));
    
    return false;
}

function gf_sendFileFormSync(formId, actionUrl, callbackFunction){
    var url = "";

    if(actionUrl != null && actionUrl != ""){
        url = actionUrl;
        
        $("#" + formId).attr("action", actionUrl);
    } else {
        url = $("#" + formId).attr("action");
    }
    
    var myajax = new MyAjax();
    myajax.sendFileFormSync(formId, gf_getAfterFunction(url, callbackFunction));
    
    return false;
}

function gf_submitMovePage(){
	var args = gf_submitMovePage.arguments;
    
    var actionUrl = args[0];
    var param     = args[1] + "&" + gf_searchParam(GV_CURR_PAGE_NO, "", GV_PAGE_COUNT);
    var addAreaId = args.length > 2 ? args[2] : "";
    
    
    if($("#movePageForm").length > 0){
        $("#movePageForm").remove();
    }
    
    // 추가 영역에 대한 추가 파라메터 !!
    if(addAreaId != ""){
        param += "&" + gf_searchParam("", addAreaId, "");
    }
    
    var formHtml = "";
    
    var arrParam = param.split("&");
    
    formHtml += '<form id="movePageForm" name="movePageForm" method="post" action="' + actionUrl + '">';
    
    for(var i=0; i<arrParam.length; i++){
        var keyVal = arrParam[i].split("=");
        
        formHtml += '    <input id="' + keyVal[0] + '" name="' + keyVal[0] + '" type="hidden" value="' + keyVal[1] + '" />';
    }
    
    formHtml += '</form>';
    
    $("body").append(formHtml);
    
    $("#movePageForm").submit();
}

function gf_searchParam(){
    var args = gf_searchParam.arguments;
    var pageNo  = args.length > 0 ? args[0] : "";
    var areaId  = args.length > 1 ? args[1] != "" ? args[1] : "searchArea" : "searchArea";
    //var pageCnt = args.length > 2 ? args[2] : GV_PAGE_COUNT;

    // 개별로 한 페이지 개수를 따로 지정 가능 !!
    if(args.length > 2){
        GV_PAGE_COUNT = args[2];    // 개별 한 페이지 개수
    } else {
        GV_PAGE_COUNT = "10";       // 기본 한 페이지 개수
    }

    var param = "";
    
    $("#" + areaId + " *").each(function() {
        var tagName = $(this).prop("tagName").toUpperCase();
        
        if(tagName == "INPUT" || tagName == "SELECT"){
            var type = $(this).attr("type");
            
            if(type == "checkbox" || type == "radio"){
                param += "";    // 나중에 추가
            } else {
                param += "&" + $(this).attr("id") + "=" + $(this).val();
            }
        }
    });

    var currPageNo = pageNo == null || pageNo == "" ? GV_CURR_PAGE_NO : pageNo;
    var pageCount  = $("#pageCount").length == 1 ? $("#pageCount").val() : GV_PAGE_COUNT;
    
    param += "&currPageNo=" + currPageNo + "&pageCount=" + pageCount;
    
    return param.substring(1);
}

function gf_initPageLoading(){
    var args = gf_initPageLoading.arguments;
    var opt = args.length > 0 ? args[0] : {};
    var select   = opt.select;      // Select Box
    var tab      = opt.tab;         // Tab
    var calendar = opt.calendar;    // Calendar
    var grid     = opt.grid;        // Grid Height
    
    // Select Box Setting !!
    if(select != null && select == "Y"){
        $("#content select").each(function () {
            $(this).selectmenu().addClass("overflow");
            
            $(this).selectmenu({
                change: function( event, ui ) {
                    // Select Change Event Setting
                    if(typeof(gf_selectOnChange) == "function") {
                        var id = $(this).attr("id");
                        
                        gf_selectOnChange(id, this.selectedIndex, $(this).val(), $("#" + id + " option:selected").text());
                    }
                }
            });
        });
    }
    
    // Tab Setting !!
    if(tab != null && tab == "Y"){
        $("#content #tabs").each(function () {
            $(this).tabs({
                activate: function(event, ui){
                    // Tab Change Event Setting
                    if(typeof(gf_tabOnChange) == "function") {
                        gf_tabOnChange($(this).tabs("option", "active"));
                    }
                }
            });
        });
    }
    
    // Grid Height Setting !!
    if(grid != null){
        var arrHeight = grid.split(",");
        
        for(var i=0; i<arrHeight.length; i++){
            $("#content .auto_col_width:eq(" + i + ")").set_scroll_table(arrHeight[i]);
        }
    } else {
        $("#content .auto_col_width").each(function (idx) {
            $(this).set_scroll_table(300);
        });
    }
    
    // Calendar Setting !!
    if(calendar != null && calendar == "Y"){
        gf_initialCalendar("content");
    }
    
    $(window).resize(function () {
        $("#content td textarea").each(function () {
            $(this).css({ "width": $(this).parent().width() - 20 })
        });
        
        $('#content select').each(function () {
            var target = $(this);
            
            $(this).selectmenu("refresh");
        });
        
        // Contents 분 Size 조절 !!
        gf_contentInnerResize();
    });
    
    // Grid 초기값 지우기
    gf_gridInitialRowDelete();
}

function gf_contentInnerResize(){
	console.log('gf_contentInnerResize');
    var docuWidth = $(document).width();
    var menuWidth = $("#lnb") != null ? Number($("#lnb").css("width").replace("px", "")) : 240;
    
    var contentWidth = docuWidth - menuWidth - 30;
    
    $(".content_inner").css("width", (contentWidth + "px"));
}

function gf_initialCalendar(targetId){
    $("#" + targetId + " .date_picker").each(function () {
        $(this).datepicker({
            //showOn: "button",
            //buttonImage: "images/btn_cal.png",
            buttonImageOnly: true,
            //buttonText: "날짜 선택",
            buttonClass: "find_date",
            dateFormat: "yy-mm-dd",
            dayNames: ["sun", "mon", "tue", "wed", "thu", "fri", "sat"],
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
            monthNames: [".01", ".02", ".03", ".04", ".05", ".06", ".07", ".08", ".09", ".10", ".11", ".12"],
            monthNamesShort: [".01", ".02", ".03", ".04", ".05", ".06", ".07", ".08", ".09", ".10", ".11", ".12"],
            prevText: "이전달",
            nextText: "다음달",
            showOtherMonths: true,
            showMonthAfterYear: true,
            
            beforeShowDay: function (day,year) {
                //alert($('.ui-datepicker').find('.ui-datepicker-year').html());
                var result;
                
                switch (day.getDay()) {
                    case 0: // 일요일?
                        result = [true, "ui-date-sunday"];
                        break;
                    case 6: // 토요일?
                        result = [true, "ui-date-saturday"];
                        break;
                    default:
                        result = [true, ""];
                        break;
                }
                
                return result;
            },
            onSelect: function (dateText, inst) {
                if(typeof(onSelectCalendar) == "function") {
                    onSelectCalendar(dateText);
                }
            }
        });
        
        $(".ui-datepicker-calendar > thead td.ui-datepicker-week-end:last-child a").addClass("ui-date-saturday");
    });
}

function gf_gridInitialRowDelete(){
    var args = gf_gridInitialRowDelete.arguments;
    
    var exceptGridIdx = args.length > 0 ? args[0] : "";
    
    // Grid 초기값 지우기
    var k = 0;
    
    $("#content .auto_col_width").each(function (idx) {
        if(exceptGridIdx == ""){
            $("#content .auto_col_width:eq(" + idx + ") tbody").html("");
        } else {
            var arrExceptGridIdx = exceptGridIdx.split(",");
            
            if(idx == Number(arrExceptGridIdx[k])){
                k++;
            } else {
                $("#content .auto_col_width:eq(" + idx + ") tbody").html("");
            }
        }
    });
}

function gf_getBrowserCheck(){
    var checkFlag = ""
    
    if(navigator.userAgent.toLowerCase().indexOf('chrome') != -1) {
        checkFlag = "T";  // Chrome
    } 
    
    if(navigator.userAgent.match(/Trident\/(\d.\d)/i) != null){
        if(navigator.userAgent.match(/Trident\/(\d.\d)/i)[1] >= '6.0') {
            checkFlag = "T";  // IE 10 and above
        } else {
            checkFlag = "N";  // IE 9 and under
        }
    }
    
    return checkFlag;
}

function gf_genFileDownLoad(){
    var args = gf_genFileDownLoad.arguments;
    
    var param        = args[0];
    var actionChkUrl = args.length > 1 ? args[1] : "/common/downloadFileCheck";
    var actionUrl    = args.length > 2 ? args[2] : "/common/downloadFile";
    
    if($("#genDownloadForm").length > 0){
        $("#genDownloadForm").remove();
    }
    
    var formHtml = "";
    
    var arrParam = param.split("&");
    
    formHtml += '<form id="genDownloadForm" name="genDownloadForm" method="post" action="' + actionChkUrl + '">';
    
    for(var i=0; i<arrParam.length; i++){
        var keyVal = arrParam[i].split("=");
        
        formHtml += '    <input id="' + keyVal[0] + '" name="' + keyVal[0] + '" type="hidden" value="' + keyVal[1] + '" />';
    }
    
    formHtml += '    <input id="actionUrl" name="actionUrl" type="hidden" value="' + actionUrl + '" />';
    
    formHtml += '</form>';
    
    $("body").append(formHtml);
    
    gf_sendForm("genDownloadForm", "", gf_genFileDownLoadAfter);
}

function gf_genFileDownLoadAfter(data){
	console.log('gf_genFileDownLoadAfter data.result : '+data.result);
    if(Number(data.result) > 0){
        $("#genDownloadForm").attr("action", data.actionUrl).submit();
    } else {
        alert("File not exist.");
    }
}

//-----------------------------------------------------------------------------------
function gfn_checkRequired(frmId) {
	var fail = false;
	var focus = true;
    var fail_log = '';
    var focusId = '';
    
    $("#"+frmId).find("select,textarea,input").each(function(){
        if(!$(this).prop("required")){
        	//
        } else {
            if (!$(this).val().trim()) {
                fail = true;
                placeholder = $(this).attr("placeholder") +  returnmsg("required") + " </br>"; 
                fail_log += placeholder;
                if (focus) {
                	$(this).focus();
                	focus = false;
                	focusId = $(this).attr('id')
                }
            }
        }
    });

    //submit if fail never got set to true
    if (fail) {
    	gfn_layerPopup(fail_log, focusId);
    	//alert(fail_log);
    	return false;
    }
    
    return true;
}

function gfn_checkFormat(frmId) {
	if (!gfn_checkEmail(frmId)) {
		return false;
	}
	
	if (!gfn_checkPhoneNumber(frmId)) {
		return false;
	}
	return true;
}

function gfn_checkEmail(frmId) {
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var flag = true;
	
	$("#"+frmId).find("input[type=email]").each(function(){
		if(!regEmail.test($(this).val())) {
			//console.log('email?? = '+$(this).val());
			gfn_layerPopup("Email is not valid!", $(this).attr('id'));
			//alert("Email is not valid!");
			flag = false;
		}
	});
	
	return flag;
}

function gfn_checkPhoneNumber(frmId) {
	var regNumber = /^[0-9]*$/;
	var flag = true;
	
	$("#"+frmId).find("input[type=tel]").each(function(){
		if(!regNumber.test($(this).val())) {
			gfn_layerPopup("Phone number must be numbers only!", $(this).attr('id'));
			flag = false;
		}
	});
	
	return flag;
}

function gfn_eventCallFunction(functionName,params) {
	eval(functionName)(params);
}

function gfn_checkPassword(frmId) {
	var flag = false;
	
	$("#"+frmId).find("input[type=password]").each(function(){
		flag = false;
    	var password = $(this).val();
    	var objId = $(this).attr('id');
    	console.log('objId='+objId+', password='+password);
        if(password.length < 8) {
        	gfn_layerPopup("Password must be at least 8 digits.", objId);
            return false;
        }
        
        if (!password.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
        	gfn_layerPopup("Password must be in alphabet, numbers and special characters(!,@,#,$,%,^,&,*,?,_,~) only.<br>Password must contain at least one alphabet, one number and one special character.", objId);
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
        	gfn_layerPopup("Password cannot contain more than 3 consecutive digits.(Ex: pass1234 = error)", objId);
        	return false;
        }
        
        if (consecutiveStringR || consecutiveStringF) {
        	gfn_layerPopup("Password cannot contain more than 3 of the same digit.(Ex: pass9999 = error)", objId);
        	return false;
        }
        
        flag = true;
    });
	
	return flag;
}

/*
function gfn_layerPopup2(msg){
	$("#messageDiv").html(msg);
	
    var $el = $("#message_layer");        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        });
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });
}
*/

function gfn_layerPopup(msg, id){
	$("#messageDiv").html("");
	$("#messageDiv").html(msg);
	
    var $el = $("#message_layer");        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('#dim-layer-msg').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        });
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('#closePopup').click(function(){
        isDim ? $('#dim-layer-msg').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        if (id != null && id != "" && id != "undefined") {
        	$("#"+id).focus();
        }
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('#dim-layer-msg').fadeOut();
        if (id != null && id != "" && id != "undefined") {
        	$("#"+id).focus();
        }
        return false;
    });
}

function gfn_customLayerPopup(dimLayerId, dimBgId, layerId, btnCloseId) {
	var $el = $('#'+layerId);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('#'+dimLayerId).fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        });
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('#'+btnCloseId).click(function(){
        isDim ? $('#'+dimLayerId).fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });
}

function gfn_nullValue(source) {
	if (source == null || source == "" || source == "undefind") {
		return "";
	}
	
	return source;
}

function gfn_toggleMenu(menuClass) {
	$('#menu').children('ul').find(menuClass).trigger('click');
}

function gfn_clearForm(frmId) {
	$("#"+frmId).find("input[type=hidden]").val("");
	$("#"+frmId).find("input[type=text]").val("");
	$("#"+frmId).find("input[type=email]").val("");
	$("#"+frmId).find("input[type=password]").val("");
	$("#"+frmId).find("textarea").val("");
	$("#"+frmId).find("input[type=file]").val("");
	
	if ($("#"+frmId).find("select").attr("id")) {
		var cbId = ($("#"+frmId).find("select").attr("id")).toLowerCase();
		if (cbId.indexOf("use") > -1) {
		    $("#"+frmId).find("select").val("Y");
		    $("#"+frmId).find("select option:eq(Y)").attr('selected', 'selected');
		} else if (cbId.indexOf("del") > -1) {
			$("#"+frmId).find("select").val("N");
		    $("#"+frmId).find("select option:eq(N)").attr('selected', 'selected');
		} else {
			$("#"+frmId).find("select").val("");
		    $("#"+frmId).find("select option:first").attr('selected', 'selected');
		}
	}
}

function gfn_makeMainMenu() {
	gf_send("/common/getMainMenu", "", "gfn_makeMainMenuCallback");
}

function gfn_makeMainMenuCallback(data) {
	$("#divNavi").html(data.mainMenuHtml);
}

function gfn_dateToInteger(strDate) {
	if (strDate === null || strDate === "" || strDate === "undefined") {
		return -1;
	}
	
	var arrDate = strDate.split("-");
    
    var iDate = Number(arrDate[0]+arrDate[1]+arrDate[2]);
    
    return iDate;
}

function gfn_datetimeToInteger(strDate) {
	if (strDate === null || strDate === "" || strDate === "undefined") {
		return -1;
	}
	
	var date = strDate.split(" ")[0];
	var time = strDate.split(" ")[1];
	
	var arrDate = date.split("-");
	var arrTime = time.split(":");
    
    var iDateTime = Number(arrDate[0]+arrDate[1]+arrDate[2]+arrTime[0]+arrTime[1]);
    
    return iDateTime;
}

function gfn_rsaEnc(value, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
	var rsa = new RSAKey();
	
	rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
	
	var encVal = rsa.encrypt(value);
	
	return encVal;
}

function gfn_secuPopup() {
	gf_send("/common/getSecu", "", "gfn_secuPopupCallback");
}

function gfn_secuPopupCallback(data) {
	gfn_clearForm("frmSecuPop");
	
	$("#secuRsaPublicKeyModulus").val(data.publicKeyModulus);
	$("#secuRsaPublicKeyExponent").val(data.publicKeyExponent);
	
	gfn_customLayerPopup("dim-layer-secu", "dimBgSecu", "secu-layer", "closeSecuPopup");
}

$(document).on("keypress", "#secuPassword", function(e){
	//e.preventDefault();
	
    var id = $(this).attr("id");
    
    if(e.keyCode == 13){
    	if (!$("#secuPassword").val()) {
    		//gfn_layerPopup("Enter your password.", "secuPassword");
    	} else {
    		gfn_secuSubmit();
    	}
    }
});

$(document).on("click", "#closeSecuPopup, #btnCheckSecu", function(e){
    e.preventDefault();
    
    var id = $(this).attr("id");
    
    if (id === "closeSecuPopup") {
    	$('#dim-layer-secu').fadeOut();
    } else if (id === "btnCheckSecu") {
    	if (!$("#secuPassword").val()) {
    		gfn_layerPopup("Enter your password.", "secuPassword");
    	} else {
    		gfn_secuSubmit();
    	}
    }
});

function gfn_secuSubmit() {
	var rsaPublicKeyModulus = $("#secuRsaPublicKeyModulus").val();
    var rsaPublicKeyExponent = $("#secuRsaPublicKeyExponent").val();
    var encSecuPassword = gfn_rsaEnc($("#secuPassword").val(), rsaPublicKeyModulus, rsaPublicKeyExponent);
    $("#encSecuPassword").val(encSecuPassword);
    $("#secuPassword").val("");
    
	gf_sendForm("frmSecuPop", "/common/checkSecu", "gfn_secuSubmitCallback");
	$('#dim-layer-secu').fadeOut();
}

function gfn_secuSubmitCallback(data) {
	if (data.flag === "success") {
		gf_submitMovePage("/sign/userProfile");
	} else {
		gfn_layerPopup(data.msg);
	}
}

function gfn_movePage(pageNo, callFunction) {
	if(typeof(callFunction) == "function") {
		callFunction(pageNo);
    }
}