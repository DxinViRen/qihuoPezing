//
//  NewDetailsViewController.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewDetailsViewController : UIViewController
@property (nonatomic,copy)NSString *url;
@property (nonatomic,strong)NewsModel *model;

@end

NS_ASSUME_NONNULL_END
