//
//  NewDetailsViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewDetailsViewController.h"
#import <WebKit/WebKit.h>
#import "NewsModel.h"
@interface NewDetailsViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation NewDetailsViewController
{
    BOOL isCollected;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    self.navigationItem.title = @"详情";
    if(self.model){
        NSString *nurl = @"https://api.tzch9.com/Index/NewsDetailListA";
        [[PSRequestManager shareInstance] netRequestWithUrl:nurl method:HttpRequestMethodPOST param:@{@"tid":[NSString stringWithFormat:@"%@",self.model.tid]} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
            NSString *contens = responseObject[@"data"][@"content"];
            [self.webView loadHTMLString:contens baseURL:nil];
        } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
            
        }];
    }else{
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }
    
    self.webView.allowsBackForwardNavigationGestures = YES;
    
    //创建网页配置对象
     WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
     
     // 创建设置对象
     WKPreferences *preference = [[WKPreferences alloc]init];
     //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
     preference.minimumFontSize = 0;
     //设置是否支持javaScript 默认是支持的
     preference.javaScriptEnabled = YES;
     // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
     preference.javaScriptCanOpenWindowsAutomatically = YES;
     config.preferences = preference;
     
     // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
     config.allowsInlineMediaPlayback = YES;
     //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
    config.mediaTypesRequiringUserActionForPlayback = YES;
     //设置是否允许画中画技术 在特定设备上有效
     config.allowsPictureInPictureMediaPlayback = YES;
     //设置请求的User-Agent信息中应用程序名称 iOS9后可用
     config.applicationNameForUserAgent = @"ChinaDailyForiPad";
      //自定义的WKScriptMessageHandler 是为了解决内存不释放的问题
   
     UIButton *collectBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
     [collectBtn setImage:[UIImage imageNamed:@"myColectNewIconS"] forState:UIControlStateNormal];
     isCollected = NO;
    if(self.model){
        NSArray *collA = [[NSUserDefaults standardUserDefaults]objectForKey:@"collectList"];
        if(collA){
            for (NSDictionary *dic in collA) {
                if([dic[@"title"] isEqualToString:self.model.title]){
                    [collectBtn setImage:[UIImage imageNamed:@"haveNewColectS"] forState:UIControlStateNormal];
                    isCollected = YES;
                }
            }
        }

        //  [collectBtn setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
        [collectBtn addTarget:self action:@selector(collecAction:) forControlEvents:UIControlEventTouchUpInside];
        // collectBtn.backgroundColor = [UIColor redColor];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:collectBtn];
    }
    
}



- (void)collecAction:(UIButton  *)btn{
    
    //点击收藏
    if(!isCollected){
        [btn setImage:[UIImage imageNamed:@"haveNewColectS"] forState:UIControlStateNormal];
        NSDictionary *dic  = self.model.mj_keyValues;
        NSArray  *collectList = [[NSUserDefaults standardUserDefaults]objectForKey:@"collectList"];
        NSMutableArray *collArr = [collectList  mutableCopy];
        if(collArr){
            [collArr addObject:dic];
            [[NSUserDefaults standardUserDefaults]setObject:[collArr copy] forKey:@"collectList"];
        }else{
            NSMutableArray * muAr =[@[] mutableCopy];
            [muAr addObject:dic];
            NSArray *coAr = [muAr copy];
            [[NSUserDefaults standardUserDefaults]setObject:coAr forKey:@"collectList"];
        }
        //显示已经收藏
        [MBProgressHUD show:@"已经收藏" icon:nil view:self.view];
        
    }else{
         [btn setImage:[UIImage imageNamed:@"myColectNewIconS"] forState:UIControlStateNormal];
        //显示取消收藏
        NSArray  *collectList = [[NSUserDefaults standardUserDefaults]objectForKey:@"haveNewColectS"];
        NSMutableArray *muColl = [collectList mutableCopy];
              if(collectList){
                  for (NSDictionary *dic in collectList) {
                      if([self.model.title isEqualToString:dic[@"title"]]){
                          [muColl removeObject:dic];
                      }
                  }
              }
        
        [[NSUserDefaults standardUserDefaults]setObject:[muColl copy] forKey:@"collectList"];
         [MBProgressHUD show:@"已经取消收藏" icon:nil view:self.view];
        
    }
     isCollected = !isCollected;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
    //用message.body获得JS传出的参数体
    NSDictionary * parameter = message.body;
    //JS调用OC
    if([message.name isEqualToString:@"jsToOcNoPrams"]){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"js调用到了oc" message:@"不带参数" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else if([message.name isEqualToString:@"jsToOcWithPrams"]){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"js调用到了oc" message:parameter[@"params"] preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (WKWebView *)webView{
    if(!_webView){
        
        _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        
    }
    return _webView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



    // 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    self.hud = [MBProgressHUD showMessage:@"请稍等" toView:self.view];
    
}
    // 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    [MBProgressHUD showMessage:@"加载失败"];
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [MBProgressHUD hideHUDForView:self.view animated:YES];
        // [MBProgressHUD show:@"提交成功" icon:nil view:self.view];

      });
}
    // 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
     //[MBProgressHUD hideHUDForView:self.view animated:YES];
}
    // 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    //[self getCookie];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
    //提交发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
  //  [self.progressView setProgress:0.0f animated:NO];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
   // 接收到服务器跳转请求即服务重定向时之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
}
    // 根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//
//    NSString * urlStr = navigationAction.request.URL.absoluteString;
//    NSLog(@"发送跳转请求：%@",urlStr);
//    //自己定义的协议头
//    NSString *htmlHeadString = @"github://";
//    if([urlStr hasPrefix:htmlHeadString]){
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通过截取URL调用OC" message:@"你想前往我的Github主页?" preferredStyle:UIAlertControllerStyleAlert];
//        [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        }])];
//        [alertController addAction:([UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            NSURL * url = [NSURL URLWithString:[urlStr stringByReplacingOccurrencesOfString:@"github://callName_?" withString:@""]];
//            [[UIApplication sharedApplication] openURL:url options:nil completionHandler:nil];
//        }])];
//        [self presentViewController:alertController animated:YES completion:nil];
//        decisionHandler(WKNavigationActionPolicyCancel);
//    }else{
//        decisionHandler(WKNavigationActionPolicyAllow);
//    }
//}
//
//    // 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//    NSString * urlStr = navigationResponse.response.URL.absoluteString;
//    NSLog(@"当前跳转地址：%@",urlStr);
//    //允许跳转
//    decisionHandler(WKNavigationResponsePolicyAllow);
//    //不允许跳转
//    //decisionHandler(WKNavigationResponsePolicyCancel);
//}
    //需要响应身份验证时调用 同样在block中需要传入用户身份凭证
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
//    //用户身份信息
//    NSURLCredential * newCred = [[NSURLCredential alloc] initWithUser:@"user123" password:@"123" persistence:NSURLCredentialPersistenceNone];
//    //为 challenge 的发送方提供 credential
//    [challenge.sender useCredential:newCred forAuthenticationChallenge:challenge];
//    completionHandler(NSURLSessionAuthChallengeUseCredential,newCred);
//}
    //进程被终止时调用
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
}


- (MBProgressHUD *)hud{
    if(!_hud){
        
        _hud = [[MBProgressHUD alloc]initWithFrame:CGRectMake(Scr_w*0.5, Scr_h*0.5, 100, 50)];
    }
    return _hud;
}


- (void)loadHtmlWithUrl:(NSString *)url{

//    "news":{
//          "content":
    self.hud = [MBProgressHUD showMessage:@"请稍等"];
    [[PSRequestManager shareInstance] netRequestWithUrl:url method:HttpRequestMethodGET param:@{} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [self.hud hideAnimated:YES];
        if(responseObject){
            NSDictionary *dic = [responseObject objectForKey:@"news"];
            NSString *content = [dic objectForKey:@"content"];
            [self.webView loadHTMLString:content baseURL:nil];
        }
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
         [self.hud hideAnimated:YES];
    }];
}

@end
