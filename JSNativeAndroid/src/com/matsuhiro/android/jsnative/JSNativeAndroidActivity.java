package com.matsuhiro.android.jsnative;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.ConsoleMessage;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.TextView;

public class JSNativeAndroidActivity extends Activity {
    private WebView mWeb;
    private TextView mJSResult;
    private TextView mNativeResult;
    private Activity mActivity;
    private int mJSCalledCount = 0;
    private int mJavaCalledCount = 0;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mActivity = this;
        setContentView(R.layout.main);

        mNativeResult = (TextView) findViewById(R.id.native_result);
        mJSResult = (TextView) findViewById(R.id.js_result);
        mWeb = (WebView) findViewById(R.id.web);
        mWeb.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
                String str = mJSResult.getText().toString();
                mJSCalledCount += 1;
                str = consoleMessage.message() + mJSCalledCount +"\n" + str +"\n";
                mJSResult.setText(str);
                return true;
            }
        });
        mWeb.getSettings().setJavaScriptEnabled(true);
        mWeb.addJavascriptInterface(new NativeClass(), "Android");
        mWeb.loadUrl("http://192.168.11.2:8080/android/");

        Button calljs = (Button) findViewById(R.id.call_js);
        calljs.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                mWeb.loadUrl("javascript:ANDROID.CallJSfromNative("+mJSCalledCount+")");
                
            }
            
        });
        
    }
    
    private class NativeClass {
        public String callNative(final String arg) {
            mActivity.runOnUiThread(new Runnable() {
                public void run() {
                    String str = mNativeResult.getText().toString();
                    mJavaCalledCount += 1;
                    str = arg  + mJavaCalledCount + "\n"+ str + "\n";
                    mNativeResult.setText(str);
                }
                
            });
            
            return "This is native function. web view id is "+mJavaCalledCount;
        }
    }
}