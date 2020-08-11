//
//  ShareSuccessViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/11.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "ShareSuccessViewController.h"

@interface ShareSuccessViewController ()

@end

@implementation ShareSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIImageView *succImage = [[UIImageView alloc]init];
    succImage.image = [UIImage imageNamed:@"shareSuccess"];
    [self.view addSubview:succImage];
    [succImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).inset(30);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    
    UILabel *titlLAbe = [[UILabel alloc]init];
    titlLAbe.text = @"转发成功";
    titlLAbe.font  = [UIFont systemFontOfSize:13];
    titlLAbe.textColor = MainColor;
    [self.view addSubview:titlLAbe];
    [titlLAbe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(succImage.mas_bottom).offset(15);
    }];
    
    
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
