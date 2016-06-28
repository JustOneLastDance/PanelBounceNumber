//
//  PanelView.m
//  BounceNumber
//
//  Created by JustinChou on 16/6/27.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "PanelView.h"
#import "MyTableViewCell.h"

@interface PanelView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *numberTextArray;
//@property (nonatomic, strong) NSMutableArray *numberTableViewArray;

@end

@implementation PanelView

#pragma mark - inital method

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.numberTextArray = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/**
 *  根据输入的数字来确定数字的最大位数
 *
 *  @param digitNumber 最大数字的位数
 */
- (void)setDigitNumber:(NSInteger)digitNumber {
    _digitNumber = digitNumber;
    
    [self createTableViewWithDigitNumber:digitNumber];
}

/**
 *  输入新的数据后，执行跳动数字效果
 *
 *  @param number 输入的文本数据
 */
- (void)setNumber:(NSString *)number {
    _number = number;
    
    [self.numberTextArray removeAllObjects];
    if (number.length <= _digitNumber) {
        NSInteger count = _digitNumber - number.length;
        
        for (int i = 0; i < count; i++) {
            [self.numberTextArray insertObject:@"0" atIndex:0];
        }
        
        for (int i = 0; i< number.length; i++) {
            [self.numberTextArray addObject:[number substringWithRange:NSMakeRange(i, 1)]];
        }
    } else {
        NSLog(@"超过最大位数！！");
    }
    
    
    [self moveToCorrentDirection];
}

- (void)createTableViewWithDigitNumber:(NSInteger)number {
    
    NSInteger length = 7;
    for (int i = 0; i < length; i++) {
        CGRect rect = CGRectMake(i * self.frame.size.width/length, 0, self.frame.size.width/length, self.frame.size.height);
        UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = 1000 + i;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView];
        
        NSString *strId = [NSString stringWithFormat:@"ABC%d", i];
        [tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:strId];
    }
}

#pragma mark - delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *strId = [NSString stringWithFormat:@"ABC%ld", tableView.tag - 1000];
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([self.numberTextArray[tableView.tag - 1000] isEqualToString:@"."]) {
        cell.number = @".";
    } else {
        cell.number = [NSString stringWithFormat:@"%ld", indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 40;
}

- (void)moveToCorrentDirection {

    //--todo
    for (int i = 0; i < self.numberTextArray.count; i++) {
        UITableView *tableView = [self viewWithTag:1000 + i];
        CGFloat number = [self.numberTextArray[i] integerValue];
        CGPoint point = CGPointMake(0, number * self.frame.size.height);
        NSLog(@"%@", NSStringFromCGPoint(point));
        
        [tableView setContentOffset:point animated:true];
    }
}


@end
