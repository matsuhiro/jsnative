//
//  JSNative.m
//  JSNativeiPhone
//
//  Created by Hiroshi Matsunaga on 11/12/04.
//  Copyright (c) 2011年 matsuhiro. All rights reserved.
//

#import "JSNative.h"

@implementation JSNative

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _countJS = 0;
        _countNative = 0;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_webView setDelegate:self];
    [UIApplication sharedApplication].
    networkActivityIndicatorVisible=YES;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.11.14:8080/iphone/"]]];
}

- (void)dealloc
{
    [_labelJSResult release];
    [_labelNativeResult release];
    [super release];
}

- (IBAction)clickButton:(UIButton*)sender
{
    if (sender.tag != 0) return;
    _countJS += 1;
    NSString *jscode = [NSString stringWithFormat:@"IPHONE.CallJSfromNative('%d')", _countJS];
    
    NSString *jsresult = [_webView stringByEvaluatingJavaScriptFromString:jscode];
    if (jsresult != nil) {
        _labelJSResult.text = [NSString stringWithFormat:@"%@ %d", jsresult, _countJS];
    }
}

- (BOOL) webView:(UIWebView *)webView
                shouldStartLoadWithRequest:(NSURLRequest *)request
                navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *requestString = [[request URL] absoluteString];
    if (![requestString hasPrefix:@"callobjc:"]) return YES;
    
    
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    NSString *function = [components objectAtIndex:1];
    
    [self performSelector:NSSelectorFromString(function)];
    
    return NO;
}

- (void)callNative {
    _countNative += 1;
    _labelNativeResult.text = [NSString stringWithFormat:@"%d", _countNative];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
    [UIApplication sharedApplication].
    networkActivityIndicatorVisible=NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

@end
