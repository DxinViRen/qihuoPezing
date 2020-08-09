//
//  NewloginViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewloginViewController.h"

@interface NewloginViewController ()
@property (strong, nonatomic)  UIImageView *loginBanner;
@property (strong, nonatomic)  UITextField *userNameTF;
@property (strong, nonatomic)  UITextField *vfCodeTf;
@property (strong, nonatomic)  UIButton *loginBtn;
@property (strong, nonatomic)  UIButton *cancelBtn;
@property (strong, nonatomic)UIImageView *bgimageView;

@end

@implementation NewloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [super viewDidLoad];
       // Do any additional setup after loading the view from its nib.
     self.bgimageView.frame = CGRectMake(30, 20, Scr_w-60, (Scr_w-60) *(8268.0/22678));
  [self.view addSubview:self.bgimageView];
    self.userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(40, 190, Scr_w-80, 60)];
    self.userNameTF.layer.borderWidth = 1;
    self.userNameTF.layer.borderColor = MainColor.CGColor;
       self.userNameTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 60)];
       self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
      [self.view addSubview:self.userNameTF];
      self.vfCodeTf = [[UITextField alloc]initWithFrame:CGRectMake(40, 280, Scr_w-80, 60)];
       self.vfCodeTf.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 60)];
       self.vfCodeTf.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.vfCodeTf];
      // self.loginBtn.backgroundColor  = MainColor;
       self.loginBtn.backgroundColor = MainColor;
       [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
       [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.loginBtn];
       self.userNameTF.layer.cornerRadius  = 8;
       self.userNameTF.layer.borderWidth = 1;
       self.userNameTF.layer.borderColor = MainColor.CGColor;
       self.userNameTF.clipsToBounds = YES;
    [self.view addSubview:self.userNameTF];
    
       self.vfCodeTf.layer.cornerRadius  = 8;
          self.vfCodeTf.layer.borderWidth = 1;
          self.vfCodeTf.layer.borderColor = MainColor.CGColor;
          self.vfCodeTf.clipsToBounds = YES;
    [self.view addSubview:self.vfCodeTf];
      // [self.vfBtn setTitleColor:MainColor forState:UIControlStateNormal];
       
       self.loginBtn.layer.cornerRadius = 8;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



- (void)loginbtn:(id)sender {
    if(self.vfCodeTf.text.length == 0 || self.userNameTF.text.length == 0|| !([self.userNameTF.text isEqualToString:@"18253575608"] && [self.vfCodeTf.text isEqualToString:@"123456"])){
        
        UIAlertController  *alerc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"Login information error" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertion = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alerc addAction:alertion];
        [self presentViewController:alerc animated:YES completion:nil];
        
        
        return;
    }
    [[NSUserDefaults standardUserDefaults]setObject:self.vfCodeTf.text forKey:self.userNameTF.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)cancelBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"logincancel" object:nil];
}

- (UIImageView *)bgimageView{
    if(!_bgimageView){
        
        _bgimageView = [[UIImageView alloc]init];
        _bgimageView.image = [UIImage  imageNamed:@"qihuogupaio"];
  }
    return _bgimageView;
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
