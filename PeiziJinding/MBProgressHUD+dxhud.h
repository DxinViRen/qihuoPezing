//
//  MBProgressHUD+dxhud.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//




#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (dxhud)
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view ;
+ (MBProgressHUD *)dxshowMessage:(NSString *)message;
+ (void)dxhideHUDForView;

@end

NS_ASSUME_NONNULL_END
