
var IPHONE = IPHONE || {};

IPHONE.CallNativefromJS = function () {
	console.log('[Enter]CallNativefromJS');
	var iframe = document.createElement("IFRAME");
	iframe.setAttribute("src", "callObjC:callNative");
	document.documentElement.appendChild(iframe);
	iframe.parentNode.removeChild(iframe);
	iframe = null;
	console.log('[Exit]CallNativefromJS');
}

IPHONE.CallJSfromNative = function (arg) {
	console.log('[Enter]CallJSfromNative');
	document.getElementById('called_from_native').innerText = "CallJSfromNative " + arg;
	document.getElementById('js_result').innerText = "CallJSfromNative";
	
	console.log('[Exit]CallJSfromNative');
	return "CallJSfromNative";
}

