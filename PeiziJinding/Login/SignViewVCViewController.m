//
//  SignViewVCViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/13.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "SignViewVCViewController.h"

@interface SignViewVCViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTf;
@property (weak, nonatomic) IBOutlet UITextField *passWordTf;
@property (weak, nonatomic) IBOutlet UITextField *emailTf;
@property (weak, nonatomic) IBOutlet UIButton *signBtn;
@property (weak, nonatomic) IBOutlet UIButton *backBtbn;

@end

@implementation SignViewVCViewController
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)signAction:(id)sender {
    if(self.phoneTf.text.length == 0 || self.passWordTf.text.length == 0||self.emailTf.text.length == 0){
        [MBProgressHUD show:@"注册失败" icon:nil view:self.view];
        return;
    }
    NSDictionary *param = @{@"name":self.phoneTf.text,@"password":self.passWordTf.text,@"email":self.emailTf};
    NSString *url = @"http://bijiu.jtarget.cn/public/index.php?s=/index/User/register";
    [[PSRequestManager shareInstance] netRequestWithUrl:url method:HttpRequestMethodPOST param:param   successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if([responseObject[@"code"] intValue] == 200){
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else{
             [MBProgressHUD show:@"注册失败" icon:nil view:self.view];
        }
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
         [MBProgressHUD show:@"注册失败" icon:nil view:self.view];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
