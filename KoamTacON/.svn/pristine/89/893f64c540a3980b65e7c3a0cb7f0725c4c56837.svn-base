function MyAjax() {
    this.sendForm = function(formId, callback) {
        $.ajax({
            async    : true        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : $("#" + formId).attr("action")
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
           ,cache    : false        // true, false
           ,data     : $("#" + formId).serialize() // 서버에 보낼 파라메터 [form 에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩, {a:b, c:d} json 형식 입력 가능]
         //,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
           ,success : function(data) {
        	   //console.log("success");
        	   if($.type(eval(callback)) == "function") {
        		   eval(callback)(data);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //console.log("in myajax sendForm");
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/resources/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
               //$("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
       
    this.send = function(url, param, callback) {
        $.ajax({
            async    : true        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : url
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
           ,cache    : false        // true, false
           ,data     : param        // 서버에 보낼 파라메터 [form 에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩, {a:b, c:d} json 형식 입력 가능]
         //,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
           ,success : function(data) {
        	   //console.log("success");
        	   if($.type(eval(callback)) == "function") {
            	   eval(callback)(data);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   //console.log("reponseText=["+xhr.reponseText+"]");
        	   //console.log("request.reponseText=["+request.reponseText+"]");
        	   $.each(xhr, function(key, value) {
         		  console.log(key+":"+value); 
         	   });
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //console.log("in myajax send");
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/resources/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
//               $("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
    
    this.sendFileForm = function(formId, callback) {
        $.ajax({
            async    : true        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : $("#" + formId).attr("action")
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
         //,cache    : false        // true, false
           ,data     : new FormData($("#" + formId)[0])
           ,processData : false
           ,contentType : false
           ,success : function(data) {
               if($.type(eval(callback)) == "function") {
                   eval(callback)(data);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //alert("cbFileType="+$("#cbFileType").val()+", cbFileUsage="+$("#cbFileUsage").val());
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/common/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
               //$("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
    
    this.sendFormSync = function(formId, callback) {
        $.ajax({
            async    : false        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : $("#" + formId).attr("action")
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
           ,cache    : false        // true, false
           ,data     : $("#" + formId).serialize() // 서버에 보낼 파라메터 [form 에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩, {a:b, c:d} json 형식 입력 가능]
         //,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
           ,success : function(data) {
        	   //console.log("success");
        	   if($.type(eval(callback)) == "function") {
        		   eval(callback)(data);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //console.log("in myajax sendForm");
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/resources/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
               //$("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
    
    this.sendSync = function(url, param, callback) {
        $.ajax({
            async    : false        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : url
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
           ,cache    : false        // true, false
           ,data     : param        // 서버에 보낼 파라메터 [form 에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩, {a:b, c:d} json 형식 입력 가능]
         //,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
           ,success : function(data) {
        	   //console.log("success");
        	   if($.type(eval(callback)) == "function") {
            	   eval(callback)(data);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   //console.log("reponseText=["+xhr.reponseText+"]");
        	   //console.log("request.reponseText=["+request.reponseText+"]");
        	   $.each(xhr, function(key, value) {
         		  console.log(key+":"+value); 
         	   });
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //console.log("in myajax send");
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/resources/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
//               $("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
    
    this.sendFileFormSync = function(formId, callback) {
        $.ajax({
            async    : false        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : $("#" + formId).attr("action")
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
         //,cache    : false        // true, false
           ,data     : new FormData($("#" + formId)[0])
           ,processData : false
           ,contentType : false
           ,success : function(data) {
               if($.type(eval(callback)) == "function") {
                   eval(callback)(data);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //alert("cbFileType="+$("#cbFileType").val()+", cbFileUsage="+$("#cbFileUsage").val());
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/common/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
               //$("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
    
    this.sendFormWithParamForCallback = function(formId, callback, cbParam) {
    	$.ajax({
            async    : true        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : $("#" + formId).attr("action")
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
           ,cache    : false        // true, false
           ,data     : $("#" + formId).serialize() // 서버에 보낼 파라메터 [form 에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩, {a:b, c:d} json 형식 입력 가능]
         //,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
           ,success : function(data) {
        	   if($.type(eval(callback)) == "function") {
        		   eval(callback)(data, cbParam);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //console.log("in myajax sendForm");
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/resources/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
               //$("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
    
    this.sendWithParamForCallback = function(url, param, callback, cbParam) {
        $.ajax({
            async    : true        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : url
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
           ,cache    : false        // true, false
           ,data     : param        // 서버에 보낼 파라메터 [form 에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩, {a:b, c:d} json 형식 입력 가능]
         //,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
           ,success : function(data) {
        	   //console.log("success");
        	   if($.type(eval(callback)) == "function") {
            	   eval(callback)(data, cbParam);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   //console.log("reponseText=["+xhr.reponseText+"]");
        	   //console.log("request.reponseText=["+request.reponseText+"]");
        	   $.each(xhr, function(key, value) {
         		  console.log(key+":"+value); 
         	   });
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //console.log("in myajax send");
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/resources/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
//               $("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
    
    this.sendFileFormWithParamForCallback = function(formId, callback, cbParam) {
        $.ajax({
            async    : true        // true, false
           ,type     : "POST"       // POST, GET
           ,url      : $("#" + formId).attr("action")
           ,dataType : "json"       // 전송받을 데이터의 타입[xml, html, script, json 등 지정 가능, 미지정시 자동 판단]
         //,timeout  : 30000        // 제한시간 지정
         //,cache    : false        // true, false
           ,data     : new FormData($("#" + formId)[0])
           ,processData : false
           ,contentType : false
           ,success : function(data) {
               if($.type(eval(callback)) == "function") {
                   eval(callback)(data, cbParam);
               }
           }
           ,error: function(xhr, request, status, error){      // 통신 에러 발생시 처리
        	   //console.log("status=["+xhr.status+"]");
        	   if (xhr.status == "900") {
        		   console.log('Session expired ----');
        		   gfn_layerPopup("Session expired");
        		   setInterval(function() {$("#closePopup").click();},1000*3);
        		   gf_submitMovePage("<c:url value='/sign/signup' />");
        	   } else {
        		   //gfn_layerPopup("The communication status is unstable. Please try again in a few minutes.");
        		   console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
        	   }
             //var msgObj = new Object();
               
             //window.showModalDialog("/jsp/common/error.jsp", msgObj, "dialogWidth:350px;dialogHeight:180px;scroll:no;status:no");
           }
           ,beforeSend: function(xmlHttpRequest) {        // 통신을 시작할때 처리
        	   xmlHttpRequest.setRequestHeader("AJAX", "true");
        	   //alert("cbFileType="+$("#cbFileType").val()+", cbFileUsage="+$("#cbFileUsage").val());
//               if($("#loadingImg").length <= 0){
//                   var loadingImg = $("<div id=\"loadingImg\"><img src=\"/common/images/loading.gif\" /></div>");
//                   
//                   loadingImg.appendTo("body");
//               }
//               
//               $("#loadingImg").show().css({
//                   position: "absolute"
//                  ,top: $(document).scrollTop() + ($(window).height() ) / 2.6 + 'px'
//                  ,left: ($(window).width()) / 2 + 'px'
//               });
           }
           ,complete  : function() {        // 통신이 완료된 후 처리
               //$("#loadingImg").hide();
        	   //console.log("complete");
           }
        });
    };
}