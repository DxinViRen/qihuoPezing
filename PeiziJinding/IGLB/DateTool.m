//
//  DateTool.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool

+ (NSString *)getDateStr{
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"dd"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    return dateStr;
}

+ (NSString *)getCurrentDateStr{
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyyMM"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    return dateStr;
}

+ (NSString *)getMounthStr{
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"MM"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    return dateStr;
}

+ (NSString *)getweekStr{
    return [DateTool getCurrentWeekDay];
}

+ (NSString*)getCurrentWeekDay{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    return [DateTool getWeekDayFordate:interval];
}

+ (NSString *)getWeekDayFordate:(NSTimeInterval)data {
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"7", @"1", @"2", @"3", @"4", @"5", @"6", nil];

    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:data];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:newDate];

    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

//获取当天往前一周的日期，
+ (NSArray *)getDateArr{
    
    NSString *curDate = [DateTool getDateStr];
    NSInteger dateValue = [curDate intValue];
    NSMutableArray *arr = [@[]  mutableCopy];
    NSInteger var ;
    if(dateValue >=7){
        for (int i =0; i<7; i ++) {
             var = dateValue - i;
            if(var<10){
                [arr addObject:[NSString stringWithFormat:@"0%ld",var]];
            }else{
                [arr addObject:[NSString stringWithFormat:@"%ld",var]];
            }
        }
    }
    arr = [[[arr reverseObjectEnumerator] allObjects] copy];
    return arr;
}

+ (NSArray *)getWeekArr{
    NSString *week = [DateTool getweekStr];
    NSInteger weekValue = [week intValue];
   //   1 2  3  4  5  6  天  1  2
    NSMutableArray  *weekArr = [@[] mutableCopy];
    
    if(weekValue<7){
        NSInteger weV = 7 - weekValue;
        for (int i = 0; i <weekValue; i++) {
            [weekArr addObject:[NSString stringWithFormat:@"%ld",weekValue - i]];
        }
        
        for (int i =0; i<weV; i ++) {
            [weekArr addObject:[NSString stringWithFormat:@"%d",7-i]];
        }
        
    }else{
        NSArray *arr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
        for (int i = 0; i<7; i ++) {
            [weekArr addObject:arr[i]];
        }
    }
    
    NSMutableArray *endArr = [@[] mutableCopy];
    NSArray *bArr = nil;
    for (int i = 0 ;i<weekArr.count;i++) {
        NSString *wek = weekArr[i];
        if([wek isEqualToString:@"1"]){
            wek = @"一";
        }else if ([wek isEqualToString:@"2"]){
            wek = @"二";
        }else if ([wek isEqualToString:@"3"]){
            wek = @"三";
        }else if ([wek isEqualToString:@"4"]){
            wek = @"四";
        }else if ([wek isEqualToString:@"5"]){
            wek = @"五";
        }else if ([wek isEqualToString:@"6"]){
            wek = @"六";
        }else if ([wek isEqualToString:@"7"]){
            wek = @"日";
        }
        
        [endArr addObject:wek];
    }
    
   // bArr = [[endArr reverseObjectEnumerator] allObjects];
    return endArr;
}

+ (CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);

    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;

    // 计算文字占据的宽高
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;

   // 当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
}
@end
