//
//  ComReviewsViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/11.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "ComReviewsViewController.h"

@interface ComReviewsViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UITextView *maintextView;
@property(nonatomic,strong)UILabel *placeLabel;
@property(nonatomic,strong)UIButton *makeSBtn;
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation ComReviewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.maintextView];
    [self.maintextView addSubview:self.placeLabel];
    [self.view addSubview:self.makeSBtn];
    [self.maintextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).inset(20);
        make.left.equalTo(self.view).inset(10);
        make.height.mas_equalTo(150);
    }];
    
    [self.placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.maintextView).inset(10);
        make.top.equalTo(self.maintextView).inset(5);
    }];
    
    [self.makeSBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.maintextView);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.maintextView.mas_bottom).offset(15);
    }];
}

- (UITextView *)maintextView{
    if(!_maintextView){
        
        _maintextView = [[UITextView alloc]init];
        _maintextView.delegate = self;
        
        _maintextView.layer.cornerRadius = 8;
        _maintextView.layer.borderColor = MainColor.CGColor;
        _maintextView.layer.borderWidth = 0.8;
        _maintextView.font = [UIFont systemFontOfSize:15];
        _maintextView.textColor = MainColor;
    }
    return _maintextView;
}

- (UILabel *)placeLabel{
    if(!_placeLabel){
        
        _placeLabel = [[UILabel alloc]init];
        _placeLabel.textColor = MainColor;
        _placeLabel.text  = @"请输入评论内容...";
        _placeLabel.textAlignment = NSTextAlignmentLeft;
        _placeLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _placeLabel;
}

- (UIButton *)makeSBtn{
    if(!_makeSBtn){
        
        _makeSBtn = [[UIButton alloc]init];
        [_makeSBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_makeSBtn setTitleColor:MainColor forState:UIControlStateNormal];
        _makeSBtn.layer.cornerRadius = 8;
        _makeSBtn.layer.borderColor = MainColor.CGColor;
        _makeSBtn.layer.borderWidth = 1;
        [_makeSBtn addTarget:self action:@selector(makrAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _makeSBtn;
}


- (void)makrAction:(UIButton *)btn{
    
    self.hud = [MBProgressHUD showMessage:@"请稍等....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.hud hideAnimated:YES];
        if(self.makeBlock){
              self.makeBlock();
              [self .navigationController popViewControllerAnimated:YES];
          }
    });
  }

- (void)textViewDidChange:(UITextView *)textView{
    if(textView.text.length>0){
        self.placeLabel.hidden = YES;
    }else{
        self.placeLabel.hidden = NO;
    }
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
