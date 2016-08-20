//
//  PowerAdjustView.h
//  powerAdjustViewDemo
//
//  Created by fuchun on 16/8/6.
//  Copyright © 2016年 nzq. All rights reserved.
//  功率调节view

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,PowerGradeType) {
    /// 等级1
    PowerGradeOne = 1,
    /// 等级2
    PowerGradeTwo ,
    /// 等级3
    PowerGradeThree ,
    /// 等级4
    PowerGradeFour ,
    /// 等级5
    PowerGradeFive ,
};
// 功率级别变化时执行的回调
typedef void(^PowerAdjustViewGradeChangeBlock)(PowerGradeType gradeType);

@interface PowerAdjustView : UIView

- (instancetype)initWithPowerGradeChangeBlock:(PowerAdjustViewGradeChangeBlock)powerGradeChangeBlcok;


@end
