//
//  LoginViewController.m
//  RubbishVitor
//
//  Created by D.xin on 2019/10/26.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "LoginViewController.h"
#import "SignViewVCViewController.h"
#import "AppDelegate.h"
#import "StockRootViewController.h"
#import<CommonCrypto/CommonDigest.h>
@interface LoginViewController ()
@property (strong, nonatomic)  UIImageView *loginBanner;
@property (strong, nonatomic)  UITextField *userNameTF;
@property (strong, nonatomic)  UITextField *vfCodeTf;
@property (strong, nonatomic)  UIButton *loginBtn;
@property (strong, nonatomic)  UIButton *cancelBtn;
@property(nonatomic,strong)MBProgressHUD *hud;
@property (weak, nonatomic) IBOutlet UIButton *SignIn;


@end

@implementation LoginViewController
- (IBAction)signAction:(id)sender {
    SignViewVCViewController *signv = [[SignViewVCViewController alloc]init];
    signv.modalPresentationStyle = 0;
    [self presentViewController:signv animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    self.userNameTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 60)];
    self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
    
    self.vfCodeTf.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 60)];
    self.vfCodeTf.leftViewMode = UITextFieldViewModeAlways;
   // self.loginBtn.backgroundColor  = MainColor;
    self.loginBtn.backgroundColor = MainColor;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    self.userNameTF.layer.cornerRadius  = 8;
    self.userNameTF.layer.borderWidth = 1;
    self.userNameTF.layer.borderColor = MainColor.CGColor;
    self.userNameTF.clipsToBounds = YES;
    
    self.vfCodeTf.layer.cornerRadius  = 8;
       self.vfCodeTf.layer.borderWidth = 1;
       self.vfCodeTf.layer.borderColor = MainColor.CGColor;
       self.vfCodeTf.clipsToBounds = YES;
   // [self.vfBtn setTitleColor:MainColor forState:UIControlStateNormal];
    
    self.loginBtn.layer.cornerRadius = 8;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)loginbtn:(id)sender {
//    if(self.vfCodeTf.text.length == 0 || self.userNameTF.text.length == 0){
//
//        UIAlertController  *alerc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登录信息有误" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *alertion = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//        }];
//        [alerc addAction:alertion];
//        [self presentViewController:alerc animated:YES completion:nil];
//
//
//        return;
//    }
    
    NSDictionary *param = @{@"username":self.userNameTF.text,
                            @"password":self.vfCodeTf.text
                           
    };
    self.hud = [MBProgressHUD showMessage:@"请稍等"];
    [[PSRequestManager shareInstance] netReuqestWithUrl:@"https://aa65e6a5388f0fc3.phiclouds.com/api/user/login" method:HttpRequestMethodPOST param:param successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
         [self.hud hideAnimated:YES];
         [[NSUserDefaults standardUserDefaults]setObject:self.vfCodeTf.text forKey:self.userNameTF.text];
                                [[NSUserDefaults standardUserDefaults] setObject:self.userNameTF.text forKey:@"login"];
                                [self dismissViewControllerAnimated:YES completion:nil];
        
                AppDelegate *delegate =(AppDelegate *) [UIApplication sharedApplication].delegate;
                UIWindow *win  = delegate.window;
                StockRootViewController *root = (StockRootViewController *)win.rootViewController;
                [root setSelectedIndex:0];
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
         [self.hud hideAnimated:YES];
        
    } extral:@{}];
    
//    [[PSRequestManager shareInstance] netRequestWithUrl:@"http://bijiu.jtarget.cn/public/index.php?s=/index/User/login" method:HttpRequestMethodPOST param:param successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
//        [self.hud hideAnimated:YES];
//
//    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
//        [self.hud hideAnimated:YES];
//    }];
//
//

}
- (void)cancelBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"login"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"logincancel" object:nil];
}
- (NSString *) md5:(NSString *) input {

    const char *cStr = [input UTF8String];

    unsigned char digest[CC_MD5_DIGEST_LENGTH];

    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call

    

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)

        [output appendFormat:@"%02x", digest[i]];

    

    return  output;

}




@end
