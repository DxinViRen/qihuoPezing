//
//  FeedbackViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/30.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *mainTextView;
@property (weak, nonatomic) IBOutlet UIButton *upbutton;
@property (nonatomic,strong)UILabel *placeLabel;


@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"给我反馈";
    self.upbutton.backgroundColor = MainColor;
    self.upbutton.layer.cornerRadius = 5;
    self.mainTextView.layer.cornerRadius = 5;
    self.mainTextView.layer.borderWidth = 0.8;
    self.mainTextView.delegate = self;
    self.mainTextView.layer.borderColor = [UIColor colorWithHexString:@"#f2f2f2"].CGColor;
    [self.mainTextView addSubview:self.placeLabel];
//    [self.upbutton addTarget:self action:@selector(upAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.placeLabel.hidden = YES;
}

-(void)textViewDidChange:(UITextView *)textView{
    NSLog(@"345566");
    self.placeLabel.hidden = YES;
    if(textView.text.length == 0){
        self.placeLabel.hidden = NO;
    }
}


- (IBAction)upAction:(id)sender {
    
    if(self.mainTextView.text.length <= 5){
         [MBProgressHUD showMessage:@"请输入五个字以上！" toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }else{
        
        [MBProgressHUD showMessage:@"请稍等" toView:self.view];
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             [MBProgressHUD show:@"提交成功" icon:nil view:self.view];

          });
    }
}

- (UILabel *)placeLabel{
    if(!_placeLabel){
        
        _placeLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 200, 20)];
        _placeLabel.textColor = [UIColor grayColor];
        _placeLabel.font = [UIFont systemFontOfSize:15];
        _placeLabel.text = @"请输入您的宝贵建议......";
    }
    return _placeLabel;
        
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
