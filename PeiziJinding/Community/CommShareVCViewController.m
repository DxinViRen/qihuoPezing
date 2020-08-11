//
//  CommShareVCViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommShareVCViewController.h"
#import "ShareSuccessViewController.h"
@interface CommShareVCViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UITextView *mainTextView;
@property(nonatomic,strong)UILabel *placHoldLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *shareBtn;
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation CommShareVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.mainTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, 20, Scr_w-20, 150)];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    self.navigationItem.title = @"转发";
    self.mainTextView.font = [UIFont systemFontOfSize:15];
    self.mainTextView.layer.borderWidth = 1;
    self.mainTextView.delegate = self;
    self.mainTextView.layer.borderColor = MainColor.CGColor;
    self.mainTextView.layer.cornerRadius = 8;
    [self.view addSubview:self.mainTextView];
    
    [self.mainTextView addSubview:self.placHoldLabel];
    [self.placHoldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mainTextView).inset(10);
        make.top.equalTo(self.mainTextView).inset(5);
    }];
    
    [self.view addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainTextView.mas_bottom).offset(10);
        make.left.and.right.equalTo(self.mainTextView);
        make.height.mas_lessThanOrEqualTo(60);
    }];
    
   // self
   // .shareBtn.backgroundColor = [UIColor redColor];
    UIBarButtonItem *rigBar = [[UIBarButtonItem alloc]initWithCustomView:self.shareBtn];

    self.navigationItem.rightBarButtonItem = rigBar;
   
    
}

- (void)setDataModel:(CommDataModel *)dataModel{
    _dataModel = dataModel;
    self.contentLabel.text = [NSString stringWithFormat:@"@%@:%@",_dataModel.say.senderNickName,_dataModel.say.content];
}


- (UILabel *)placHoldLabel{
    if(!_placHoldLabel){
        _placHoldLabel = [[UILabel alloc]init];
        _placHoldLabel.textColor = MainColor;
        _placHoldLabel.font = [UIFont systemFontOfSize:15];
        _placHoldLabel.text = @"请输入转发理由....";
    }
    return _placHoldLabel;
}


- (UILabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = MainColor;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.layer.borderColor = MainColor.CGColor;
        _contentLabel.layer.borderWidth = 1;
        _contentLabel.layer.cornerRadius = 5;
        _contentLabel.numberOfLines = 0;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLabel;
}

- (UIButton *)shareBtn{
    if(!_shareBtn){
        
        _shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
        [_shareBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_shareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareActipn:) forControlEvents:UIControlEventTouchUpInside];
        _shareBtn.layer.cornerRadius = 5;
        _shareBtn.layer.borderWidth = 1;
        _shareBtn.layer.borderColor = MainColor.CGColor;
       // [_shareBtn setTitleColor:MainColor forState:UIControlStateNormal];
    }
    return _shareBtn;
}

- (void)textViewDidChange:(UITextView *)textView{
    if(textView.text.length>0){
        self.placHoldLabel.hidden = YES;
    }
}

- (void)shareActipn:(UIButton *)btn{
    self.hud = [MBProgressHUD showMessage:@"请稍等..."];
    [[PSRequestManager shareInstance] netRequestWithUrl:@"https://gateway-infrastructure.eastmoney.com/Newsplatform-Tag-Futures/api/yw?banner=banner&source=app&limit=20&em_appid=14053&encode=qhdd&sys=ios&version=2008008&min_id=202008081586727330&axiosConf=%7B%7D" method:HttpRequestMethodGET param:@{} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.hud hideAnimated:YES];
        ShareSuccessViewController *succ = [[ShareSuccessViewController alloc]init];
        [self.navigationController pushViewController:succ animated:YES];
        
    });
    
}
@end
