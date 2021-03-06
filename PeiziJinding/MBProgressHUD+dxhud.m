//
//  MBProgressHUD+dxhud.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MBProgressHUD+dxhud.h"




@implementation MBProgressHUD (dxhud)
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;

    hud.label.textColor = [UIColor colorWithHexString:@"333333"];
    //hud.bezelView.style = MBProgressHUDBackgroundStyleSolidCo;
    hud.label.font = [UIFont systemFontOfSize:17.0];
    hud.userInteractionEnabled= NO;

   // hud.customView = [[UIImageView alloc] initWithImage:icon];  // 设置图片
    //hud.bezelView.backgroundColor = mainGrayColor;    //背景颜色
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;

    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;

    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}

+ (MBProgressHUD *)dxshowMessage:(NSString *)message {
    
    UIWindow *window ;
    NSString *str = [UIDevice currentDevice].systemVersion;
    if([str doubleValue] >=13.0){
        window = [UIApplication sharedApplication].windows[0];
    }else{
        window = [UIApplication sharedApplication].keyWindow;
    }
    return  [MBProgressHUD showMessage:message toView:window];
}

//+ (void)showSuccess:(NSString *)success
//{
//    [self showSuccess:success toView:nil];
//}
//
///**
// *  =======显示
// *  @param success 信息内容
// */
//+ (void)showSuccess:(NSString *)success toView:(UIView *)view
//{
//    [self show:success icon:@"success.png" view:view];
//}
//
///**
// *  =======显示错误信息
// */
//+ (void)showError:(NSString *)error
//{
//    [MBProgressHUD showError:error toView:nil];
//}
//
//+ (void)showError:(NSString *)error toView:(UIView *)view{
//    [self show:error icon:@"error.png" view:view];
//}
///**
// *  显示提示 + 菊花
// *  @param message 信息内容
// *  @return 直接返回一个MBProgressHUD， 需要手动关闭(  ?
// */
+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [MBProgressHUD showMessage:message toView:nil];
}
//
///**
// *  显示一些信息
// *  @param message 信息内容
// *  @param view    需要显示信息的视图
// *  @return 直接返回一个MBProgressHUD，需要手动关闭
// */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;

    return hud;
}
//
///**
// *  手动关闭MBProgressHUD
// */
+ (void)hideHUD
{
    [MBProgressHUD dxhideHUDForView];
}
///**
// *  @param view    显示MBProgressHUD的视图
// */
+ (void)dxhideHUDForView
{
     UIWindow *win = [UIApplication sharedApplication].windows[0];
    [MBProgressHUD hideHUDForView:win animated:YES];
}
//

@end
