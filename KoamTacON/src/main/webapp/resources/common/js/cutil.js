setInterval(function(){
	var val="<c:out value='${__signin }' />";
	console.log('val='+val);if(val=='Y'){var myajax = new MyAjax();myajax.send("/common/getLocal", "");}},999*60);