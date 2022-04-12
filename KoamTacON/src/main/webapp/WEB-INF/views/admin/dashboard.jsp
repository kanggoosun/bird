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
    <title>Dashboard</title>
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
        <%@ include file="../include/header_admin.jsp" %>
        <div class="inner">
            
            <section>
                <header class="major">
                    <h2>Dashboard</h2>
                </header>
                <div class="posts">
                    <article>
                        <h3>KDC Registration</h3>
                        <h5>Registered but not approved</h5>
                        <p>In the last 24 hours : <c:out value="${kdcMap.dayKdc }" /></p>
	                    <p>In the last 7 days : <c:out value="${kdcMap.weekKdc }" /></p>
	                    <p>In the last month : <c:out value="${kdcMap.monthKdc }" /></p>
                    </article>
                    <article>
                        <h3>Group</h3>
                        <h5>&nbsp;</h5>
                        <p>In the last 24 hours : <c:out value="${groupsMap.dayGroups }" /></p>
                        <p>In the last 7 days : <c:out value="${groupsMap.weekGroups }" /></p>
                        <p>In the last month : <c:out value="${groupsMap.monthGroups }" /></p>
                    </article>
                    <article>
                        <h3>User</h3>
                        <h5>&nbsp;</h5>
                        <p>In the last 24 hours : <c:out value="${usersMap.dayUsers }" /></p>
                        <p>In the last 7 days : <c:out value="${usersMap.weekUsers }" /></p>
                        <p>In the last month : <c:out value="${usersMap.monthUsers }" /></p>
                    </article>
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
    
});
</script>
</body>
</html>