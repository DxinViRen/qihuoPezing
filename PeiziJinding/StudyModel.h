//
//  StudyModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/18.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StudyModel : NSObject<MainCellModelProtocol>
@property (nonatomic,copy)NSString *gol;
@property (nonatomic,copy)NSString *mp3;
@property (nonatomic,copy)NSString *haveLe;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *larImg;
@property (nonatomic,strong)NSArray <NSString *>*tagArr;
@property(nonatomic,assign)BOOL isSetdata;
@end

NS_ASSUME_NONNULL_END
