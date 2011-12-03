
var ANDROID = ANDROID || {};

ANDROID.CallNativefromJS = function () {
	var result = Android.callNative("ANDROID.CallNativefromJS");
	document.getElementById('native_result').innerText = "function result: " + result;
}

ANDROID.CallJSfromNative = function (str) {
	document.getElementById('called_from_native').innerText = "CallJSfromNative id="+str;
	document.getElementById('js_result').innerText = "CallJSfromNative is called";
	
	console.log('console message call in CallJSfromNative');
	return "CallJSfromNative";
}

