//
//  JSNative.h
//  JSNativeiPhone
//
//  Created by Hiroshi Matsunaga on 11/12/04.
//  Copyright (c) 2011年 matsuhiro. All rights reserved.//

#import <UIKit/UIKit.h>

@interface JSNative : UIViewController<UIWebViewDelegate> {
    IBOutlet UILabel *_labelNativeResult;
    IBOutlet UILabel *_labelJSResult;
    IBOutlet UIWebView *_webView;
    int _countJS;
    int _countNative;
}

- (IBAction)clickButton:(UIButton*)sender;

@end
