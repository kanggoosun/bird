<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<link rel="stylesheet" href="<c:url value='/resources/common/css/flatpickr.min.css' />">
<link rel="stylesheet" href="<c:url value='/resources/common/css/confirmDate.css' />">

<script src="<c:url value='/resources/assets/js/jquery.min.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/assets/js/skel.min.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/assets/js/util.js?${__versionQ}' />"></script>
<!--[if lte IE 8]><script src="<c:url value='/resources/assets/js/ie/respond.min.js?${__versionQ}' />"></script><![endif]-->
<script src="<c:url value='/resources/assets/js/main.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/assets/js/jquery-barcode.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/assets/js/qrcode.js?${__versionQ}' />"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript" src="/resources/assets/js/jquery-barcode.js"></script>

<script src="<c:url value='/resources/common/js/flatpickr.min.js'/>"></script>
<script src="<c:url value='/resources/common/js/confirmDate.js'/>"></script>
    
<!--  RSA Encrypt Utils -->
<script src="<c:url value='/resources/common/js/util/jsbn.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/common/js/util/prng4.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/common/js/util/rng.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/common/js/util/rsa.js?${__versionQ}' />"></script>

<!-- Scripts for KoamTacON-->
<script src="<c:url value='/resources/common/js/myajax.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/common/js/app-common.js?${__versionQ}' />"></script>
<script src="<c:url value='/resources/common/js/app-grid.js?${__versionQ}' />"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-16571807-4"></script>
<script>
function returnmsg(param){
 if(param == "required"){
	 return " <spring:message code='MSG-VW071' text='is required.' />";
	}
}

window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'UA-16571807-4');
</script>
