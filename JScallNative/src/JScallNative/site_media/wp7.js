
var WP7 = WP7 || {};

WP7.CallNativefromJS = function () {
	console.log('[Enter]CallNativefromJS');
	console.log('[Exit]CallNativefromJS');
}

WP7.CallJSfromNative = function () {
	console.log('[Enter]CallJSfromNative');
	document.getElementById('called_from_native').innerText = "CallJSfromNative";
	document.getElementById('js_result').innerText = "CallJSfromNative";
	
	console.log('[Exit]CallJSfromNative');
	return "CallJSfromNative";
}

