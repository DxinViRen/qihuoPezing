//
//  AboutUsViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/30.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "AboutUsViewController.h"
#import "StorkSectionController.h"
#import "StorkSectionModel.h"
#import <YYText.h>
@interface AboutUsViewController ()
@property(nonatomic,strong)YYLabel *conLabel;
@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self configDataSource];
    //[self.adapter reloadDataWithCompletion:nil];
    //self.navigationItem.title = @"关于我们";
    self.view.backgroundColor  = [UIColor colorWithHexString:@"#f6f6f6"];
    self.navigationItem.title = @"关于我们";
    [self.view addSubview:self.conLabel
     ];
    
    
}

- (YYLabel *)conLabel{
    if(!_conLabel){
        _conLabel = [[YYLabel alloc]initWithFrame:CGRectMake(20, 10, Scr_w-40, 400)];
        _conLabel.font  = [UIFont systemFontOfSize:20];
        _conLabel.numberOfLines = 0;
        _conLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _conLabel.text = @"为用户提供最优质的的期货行情信息，帮助用户获得期货知识，但是产品还需要更多的改进，请广大用户多提宝贵意见";
        _conLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    }
    return _conLabel;
}

@end
