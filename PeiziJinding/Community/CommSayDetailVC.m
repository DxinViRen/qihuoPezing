//
//  CommSayDetailVC.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommSayDetailVC.h"
#import "CommDetailRoot.h"
#import "ComDetailCell.h"
#import "CommPreCell.h"
#import "commDetailHeadCell.h"
#import "CommPreCell.h"
#import "ReviewDetailCell.h"

@interface CommSayDetailVC ()

@end

@implementation CommSayDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nodataLabel.text = @"数据去了火星！呜呜呜!!";
    self.navigationItem.title = @"详情";
    self.dataArray = [@[] mutableCopy];
    [self configData];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
}

- (void)configData{
    [self loadData];
    
}
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (void)loadData{
    NSString *urlstr = [NSString stringWithFormat:CommitDertailURL,self.dataModel.say.ID];
    [[PSRequestManager shareInstance] netRequestWithUrl:urlstr method:HttpRequestMethodGET param:@{} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        CommDetailRoot *deRot = [CommDetailRoot mj_objectWithKeyValues:responseObject];
        if(deRot){
            CommSayModel *saymdoel = deRot.data.say;
            saymdoel.pre_disclaimer = deRot.data.disclaimer;
            saymdoel.cellName = NSStringFromClass([ComDetailCell class]);
            saymdoel.cellWight = Scr_w;
           
            saymdoel.cellInderfier = NSStringFromClass([ComDetailCell class]);
            CGFloat textH = [DateTool
                                   getStringHeightWithText:saymdoel.content font:[UIFont systemFontOfSize:15] viewWidth:Scr_w-20];
           __block CGFloat CommH =textH;
             saymdoel.cellHeight = textH +160;
          __block  CGSize imgs ;
            if(saymdoel.pics.count>0){
                 [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:CommitBaseImgURL,saymdoel.pics[0]]] completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                     imgs = CGSizeMake(image.size.width/8.0, image.size.height/8.0);
                     saymdoel.pre_imgsize = imgs;
                     saymdoel.pre_image = image;
                     saymdoel.pre_textH = CommH;
                     saymdoel.cellHeight +=  imgs.height;
                     [self.adapter reloadDataWithCompletion:nil];
                }];
               }
            saymdoel.pre_alArr  = deRot.data.agreeRelations;
          
            CommSayModel *blankModel = [[CommSayModel alloc]init];
            blankModel.cellName = NSStringFromClass([MainCollectionViewCell class]);
            blankModel.cellHeight = 12;
            blankModel.cellWight = Scr_w;
            blankModel.cellInderfier = NSStringFromClass([MainCollectionViewCell class]);
            
            CommSayModel *comPre = [[CommSayModel alloc]init];
            comPre.cellName = NSStringFromClass([commDetailHeadCell class]);
            comPre.cellHeight = 45;
            comPre.cellWight = Scr_w;
            comPre.cellInderfier  = NSStringFromClass([commDetailHeadCell class]);
            comPre.countOfComment = saymdoel.countOfComment;
            
            NSMutableArray *preItemArr = [@[] mutableCopy];
            for (CommDetailItemModel *item in deRot.data.commentJson.parentList) {
                item.cellName = NSStringFromClass([ReviewDetailCell class]);
                item.cellWight = Scr_w;
                //需要根据文字计算高度
                CGFloat textH = [DateTool getStringHeightWithText:item.content font:[UIFont systemFontOfSize:15] viewWidth:Scr_w - 82];
                item.pre_preContentH = textH;
                //子评论的前三条的高度
                NSInteger count = item.sonList.count;
                CGFloat   sonTotalH = 0;
                if(count>3)count = 3;
                for (int i = 0; i<count; i ++) {
                    CommDetailItemModel *sonItem = item.sonList[i];
                    CGFloat textSonH = [DateTool getStringHeightWithText:sonItem.content font:[UIFont systemFontOfSize:15] viewWidth:Scr_w - 82];
                    [item.pre_SonH addObject:@(textSonH + 4)];
                    sonTotalH += (textSonH + 4);
                }
               
                item.cellHeight = sonTotalH + textH +132 ;
                item.cellInderfier = NSStringFromClass([ReviewDetailCell class]);
                [preItemArr addObject:item];
            }
            
            
            
            
            
        
            StorkSectionModel *sec1 = [[StorkSectionModel alloc]initWithArray: [[NSMutableArray alloc]initWithObjects:saymdoel,blankModel,comPre,nil]];
                StorkSectionModel *sec2 = [[StorkSectionModel alloc]initWithArray:preItemArr];
            [self.dataArray addObject:sec1];
            [self.dataArray addObject:sec2];
            [self.adapter reloadDataWithCompletion:nil];
        }
        
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        
    }];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *section = [[StorkSectionController alloc]init];
    section.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    section.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        
    };
    
    return section;
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
