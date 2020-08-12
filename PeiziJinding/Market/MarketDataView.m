//
//  MarketDataView.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketDataView.h"
#import "MarketDataCellTableViewCell.h"
@implementation MarketDataView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configSource];
    }
    return self;
}
- (void)configSource{
    
    
}

- (instancetype)initWithSize:(CGSize)size{
    
    if(self = [super init]){
         self.bsize = size;
        [self addSubview:self.mainTableView];
    }
    return self;
}

- (UITableView *)mainTableView{
    if(!_mainTableView){
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.bsize.width, self.bsize.height) style:UITableViewStyleGrouped];
        _mainTableView.sectionHeaderHeight = CGFLOAT_MIN;
        //_mainTableView.contentInset = UIEdgeInsetsZero;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    
    }
    return _mainTableView;
}
- (void)setModel:(MarketItemModel *)model{
    _model = model;
    self.dataArray = _model.products_list;
}
- (void)reloadData{
    [self.mainTableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MarketDataCellTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"MarketDataCellTableViewCell"];
    if(cell == nil){
        cell  = [[MarketDataCellTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MarketDataCellTableViewCell"];
    }
    
    if(self.dataArray.count>indexPath.row &&self.model.list.count>indexPath.row){
        cell.numDaraArr = self.model.list[indexPath.row];
        cell.model = self.dataArray[indexPath.row];
        NSArray *daArr = self.model.list[indexPath.row];
        if(daArr.count >= 4){
            cell.turnoverLabel.text = [NSString stringWithFormat:@"%@",self.model.list[indexPath.row][4]];
            cell.lastPrice.text = [NSString stringWithFormat:@"%@",self.model.list[indexPath.row][1]];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.clickBlock){
        if(self.dataArray.count>indexPath.row ){
             self.clickBlock(self.dataArray[indexPath.row]);
        }
    }
}

@end
