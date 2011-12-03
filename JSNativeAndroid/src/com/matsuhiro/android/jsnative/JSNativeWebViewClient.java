package com.matsuhiro.android.jsnative;

import android.webkit.ConsoleMessage;
import android.webkit.WebChromeClient;


public class JSNativeWebViewClient extends WebChromeClient {
    @Override
    public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
        
        return true;
    }

}
