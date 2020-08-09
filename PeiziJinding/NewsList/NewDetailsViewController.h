//
//  NewDetailsViewController.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import "NewsNewModel.h"
#import "NewsDetaiItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewDetailsViewController : UIViewController
@property (nonatomic,copy)NSString *url;
@property (nonatomic,strong)NewsDetaiItemModel *model;

- (void)loadHtmlWithUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
