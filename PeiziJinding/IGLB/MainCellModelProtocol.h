//
//  MainCellModelProtocol.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol MainCellModelProtocol <NSObject>
@property(nonatomic,assign)CGFloat  cellHeight;
@property(nonatomic,copy)NSString *cellName;
@property(nonatomic,copy)NSString *cellInderfier;
@property(nonatomic,assign)CGFloat cellWight;
@property(nonatomic,strong)NSMutableDictionary *extra;
@end

NS_ASSUME_NONNULL_END
