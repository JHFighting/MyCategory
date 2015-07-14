//
//  ProgressWebViewController.m
//  Category
//
//  Created by e1858 on 15/5/7.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "ProgressWebViewController.h"

@interface ProgressWebViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) UIActivityIndicatorView *progressInd;

@property (nonatomic, strong) NSURL *url;

@end

@implementation ProgressWebViewController


+ (instancetype)progressWithTitle:(NSString *)title andUrlString:(NSString *)urlString;
{
    ProgressWebViewController *progress = [[ProgressWebViewController alloc] init];
    progress.title = title;
    progress.url = [NSURL URLWithString:urlString];
    return progress;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressInd];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [_webView loadRequest:request];
}

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
    
    _url = [NSURL URLWithString:urlStr];
}


#pragma mark - webView delegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_progressInd startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_progressInd stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    [self toast:@"加载失败"];
    [_progressInd stopAnimating];
}

#pragma mark - getters and setters
- (UIActivityIndicatorView *)progressInd
{
    if (_progressInd == nil) {
        _progressInd = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.size.height / 3, 30, 30)];
        _progressInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        _progressInd.hidesWhenStopped = YES;
    }
    return _progressInd;
}

- (UIWebView *)webView
{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        if (self.navigationController) {
            _webView.height = self.view.height - 64;
        }
        _webView.delegate = self;
    }
    return _webView;
}

@end
