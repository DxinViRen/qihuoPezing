//
//  LoginViewController.m
//  RubbishVitor
//
//  Created by D.xin on 2019/10/26.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loginBanner;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *vfCodeTf;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *vfBtn;
@property (nonatomic,strong)NSTimer  *timer;
@property (nonatomic,assign)NSInteger sec;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.sec = 59;
    self.userNameTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 60)];
    self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
    
    self.vfCodeTf.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 60)];
    self.vfCodeTf.leftViewMode = UITextFieldViewModeAlways;
    self.loginBtn.backgroundColor  = MainColor;
    [self.loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    
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
    [self.vfBtn setTitleColor:MainColor forState:UIControlStateNormal];
    
    self.loginBtn.layer.cornerRadius = 8;
    
}

- (NSTimer *)timer{
    __weak typeof(self) weakself = self;
    if(!_timer){
        _timer =[NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
           
            [weakself timeActione];
        }];
    }
    return _timer;
}

-(void)pauseTimer{
    [self.timer setFireDate:[NSDate distantFuture]];
}
//继续计时
-(void)continueTimer{
    [self.timer setFireDate:[NSDate distantPast]];
}

- (void)timeActione{
    self.sec--;
    NSLog(@"%ld",self.sec);
    if(self.sec == 0){
        self.sec = 59;
        self.vfBtn.enabled = YES;
        [self  pauseTimer];
         [self.vfBtn setTitle:@"send VF code" forState:UIControlStateNormal];
        return;
    }
    self.vfBtn.enabled = NO;
    [self.vfBtn setTitle:[NSString stringWithFormat:@"%ld",self.sec] forState:UIControlStateNormal];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (IBAction)vfCodeClick:(UIButton *)sender {
    //发送验证码，倒计时
    [self continueTimer];
    [self.vfBtn setTitle:[NSString stringWithFormat:@"%ld",self.sec] forState:UIControlStateNormal];
}
- (IBAction)loginbtn:(id)sender {
    if(self.vfCodeTf.text.length == 0 || self.userNameTF.text.length == 0|| !([self.userNameTF.text isEqualToString:@"13146725375"] && [self.vfCodeTf.text isEqualToString:@"123456"])){
        
        UIAlertController  *alerc = [UIAlertController alertControllerWithTitle:@"Reminder" message:@"Login information error" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertion = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alerc addAction:alertion];
        [self presentViewController:alerc animated:YES completion:nil];
        
        
        return;
    }
    [[NSUserDefaults standardUserDefaults]setObject:self.vfCodeTf.text forKey:self.userNameTF.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"logincancel" object:nil];
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
