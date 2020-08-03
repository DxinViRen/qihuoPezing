//
//  StorkSectionController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "StorkSectionController.h"

@implementation StorkSectionController

- (void)configCell:(MainCollectionViewCell *)cell withModel:(id<MainCellModelProtocol>)model index:(NSInteger)index{
    if(self.configCellBlock){
        self.configCellBlock(model, cell, index);
        }
    cell.model =  model;
    
}
- (NSInteger)numberOfItems
{
    return self.object.dataArray.count;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
   
    id<MainCellModelProtocol> model = [self.object.dataArray  dx_objectAtIndex:index];

    if([model respondsToSelector:@selector(cellHeight)])
    {
        return CGSizeMake(model.cellWight, model.cellHeight);
    }

    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    id<MainCellModelProtocol> model = [self.object.dataArray dx_objectAtIndex:index];
    NSString *cellIndefier = model.cellInderfier;
    MainCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:NSClassFromString(model.cellName) withReuseIdentifier:cellIndefier forSectionController:self atIndex:index];
    [self configCell:cell withModel:model index:index];
    return cell;
}

- (void)didUpdateToObject:(id)object
{
    self.object = object;
}    

- (void)didSelectItemAtIndex:(NSInteger)index
{
     if(self.cellDidClickBlock)
          {
              self.cellDidClickBlock([self.object.dataArray dx_objectAtIndex:index], index);
          }
}

@end
