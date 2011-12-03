
var ANDROID = ANDROID || {};

ANDROID.CallNativefromJS = function () {
	console.log('[Enter]CallNativefromJS');
	var result = Android.callNative("ANDROID.CallNativefromJS");
	document.getElementById('native_result').innerText = "function result" + result;
	console.log('[Exit]CallNativefromJS');
	console.log('Last Called is ANDROID.CallNativefromJS');
}

ANDROID.CallJSfromNative = function (str) {
	console.log('[Enter]CallJSfromNative');
	document.getElementById('called_from_native').innerText = "CallJSfromNative id="+str;
	document.getElementById('js_result').innerText = "CallJSfromNative is called";
	
	console.log('[Exit]CallJSfromNative');
	return "CallJSfromNative";
}

