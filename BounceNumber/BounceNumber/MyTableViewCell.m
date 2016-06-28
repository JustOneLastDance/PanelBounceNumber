//
//  MyTableViewCell.m
//  BounceNumber
//
//  Created by JustinChou on 16/6/27.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()

@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    CGFloat red = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 256 / 255.0;
    CGFloat blue = arc4random() % 256 / 255.0;
//    self.contentView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.numberLabel = [[UILabel alloc] init];
    self.numberLabel.frame = CGRectMake(0, 10, 10, 20);
//    self.contentView.backgroundColor = [UIColor redColor];
    
    [self.numberLabel setTextColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0]];
    
    [self.contentView addSubview:self.numberLabel];
    [self.numberLabel setTextAlignment:NSTextAlignmentCenter];

}

- (void)setNumber:(NSString *)number {
    _number = number;
    self.numberLabel.text = number;
}

@end
