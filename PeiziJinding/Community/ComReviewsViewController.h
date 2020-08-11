//
//  ComReviewsViewController.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/11.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^markBlock)(void);
@interface ComReviewsViewController : UIViewController
@property(nonatomic,copy)markBlock makeBlock;
@end

NS_ASSUME_NONNULL_END
