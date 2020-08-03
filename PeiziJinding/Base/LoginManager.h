//
//  LoginManager.h
//  RubbishVitor
//
//  Created by D.xin on 2019/10/26.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LoginBlock)(void);
@interface LoginManager : NSObject
+ (instancetype)shareInsetance;
- (BOOL)isLogin;
- (void)checkLogin:(LoginBlock)login;
@end

NS_ASSUME_NONNULL_END
