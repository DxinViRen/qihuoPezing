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
        _conLabel.text = @"";
        _conLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    }
    return _conLabel;
}

//- (void)configDataSource{
//
//}
//
//- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
//    return self.dataArray;
//}
//
//- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
//    StorkSectionController *secc = [[StorkSectionController alloc]init];
//    secc.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
//
//    };
//    secc.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
//
//    };
//    return secc;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
