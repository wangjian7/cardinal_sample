function publishHeight(url) {
	var height = document.getElementById('CentinelAuthenticationForm').offsetHeight;
	var width = document.getElementById('CentinelAuthenticationForm').offsetWidth;

	var resizeFrameHtml = renderIframe(url, height, width);
	
	addToAcsScreen(resizeFrameHtml);
}

function publishSetHeight(url, height, width) {
	var resizeFrameHtml = renderIframe(url, height, width);
	addToAcsScreen(resizeFrameHtml);
}

function publishSetHeightAndMessage(url, height, width, msg) {
	var resizeFrameHtml = renderIframeWithMsg(url, height, width, msg);
	addToAcsScreen(resizeFrameHtml);
}
	
function renderIframe(url, height, width)	{
	return "<iframe height=1 width=1 name='resizeFrame' id='resizeFrame' src='"+url+"#height="+height+"&width="+width +"' style='display:none;'></iframe>" ;
}

function renderIframeWithMsg(url, height, width, msg)	{
	return "<iframe height=1 width=1 name='resizeFrame' id='resizeFrame' src='" + url + "#height=" + height + "&width="+ width +"&msg=" + msg + "' style='display:none;'></iframe>" ;
}

function addToAcsScreen(resizeFrameHtml){
	document.getElementById('CentinelAuthenticationForm').innerHTML = resizeFrameHtml + document.getElementById('CentinelAuthenticationForm').innerHTML;
}