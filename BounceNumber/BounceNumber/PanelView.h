//
//  PanelView.h
//  BounceNumber
//
//  Created by JustinChou on 16/6/27.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanelView : UIView
/**
 *  input number
 */
@property (nonatomic, strong) NSString *number;

/**
 *  最大显示的数字位数
 */
@property (nonatomic, assign) NSInteger digitNumber;

/**
 *  PanelView初始化方法
 *
 *  @param frame 输入的frame
 *
 *  @return PanelView实例
 */
- (instancetype)initWithFrame:(CGRect)frame;

@end
