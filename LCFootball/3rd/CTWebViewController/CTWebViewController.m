//
//  CTWebViewController.m
//  CalledTaxi
//
//  Created by Peng on 2017/10/16.
//  Copyright © 2017年 YXZ. All rights reserved.
//

#import "CTWebViewController.h"
#import <WebKit/WebKit.h>

@interface CTWebViewController ()<WKNavigationDelegate>

@property(nonatomic, strong)WKWebView       *webView;
@property(nonatomic, strong)UIProgressView  *progressView;//设置加载进度条

@end

@implementation CTWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, WinSize_Width, WinSize_Height-NavgationBar_Height)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self.urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];

    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, NavgationBar_Height, WinSize_Width,2)];
    self.progressView.progressTintColor= [UIColor blueColor];//设置已过进度部分的颜色
    self.progressView.trackTintColor= [UIColor clearColor];//设置未过进度部分的颜色
    [self.view addSubview:self.progressView];
    
    [self.webView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:nil];
    
}


//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //开始加载的时候，让进度条显示
    self.progressView.hidden = NO;
}

//kvo 监听进度
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        BOOL animated = self.webView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.webView.estimatedProgress
                              animated:animated];
        
        if (self.webView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self.progressView setAlpha:0.0f];
                             }
                             completion:^(BOOL finished) {
                                 [self.progressView setProgress:0.0f animated:NO];
                             }];
        }
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [_webView removeObserver:self
                        forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
