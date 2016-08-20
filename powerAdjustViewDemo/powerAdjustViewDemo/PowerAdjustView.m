//
//  PowerAdjustView.m
//  powerAdjustViewDemo
//
//  Created by fuchun on 16/8/6.
//  Copyright © 2016年 nzq. All rights reserved.
//

#import "PowerAdjustView.h"
#import "UIView+frame.h"

@interface PowerAdjustView()<UIGestureRecognizerDelegate>
/** 背景grayView */
@property (nonatomic, strong) UIImageView *backgroudImageView;
/** 三角形图 */
@property (nonatomic, strong) UIImageView *triangleImageView;

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;
@property (nonatomic, strong) UILabel *label5;


@property (nonatomic, strong) PowerAdjustViewGradeChangeBlock gradeBlock;
@end

@implementation PowerAdjustView
#pragma mark - 控件加载
- (UIImageView *)backgroudImageView
{
    if (!_backgroudImageView) {
        _backgroudImageView = [[UIImageView alloc] init];
        _backgroudImageView.userInteractionEnabled = YES;
        _backgroudImageView.image = [UIImage imageNamed:@"41功率进度"];
    }
    return _backgroudImageView;
}

- (UIImageView *)triangleImageView
{
    if (!_triangleImageView) {
        _triangleImageView = [[UIImageView alloc] init];
        _triangleImageView.userInteractionEnabled = YES;
        _triangleImageView.image = [UIImage imageNamed:@"41拉动三角形"];
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                        initWithTarget:self
                                                        action:@selector(handlePan:)];
        [_triangleImageView addGestureRecognizer:panGestureRecognizer];
    }
    return _triangleImageView;
}

- (UILabel *)label1
{
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];// 0x999999
        _label1.text = @"1";
        _label1.font = [UIFont systemFontOfSize:12];
        _label1.textAlignment = NSTextAlignmentCenter;
    }
    return _label1;
}

- (UILabel *)label2
{
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        _label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];// 0x999999
        _label2.text = @"2";
        _label2.font = [UIFont systemFontOfSize:12];
        _label2.textAlignment = NSTextAlignmentCenter;
    }
    return _label2;
}
- (UILabel *)label3
{
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        _label3.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];// 0x999999
        _label3.text = @"3";
        _label3.font = [UIFont systemFontOfSize:12];
        _label3.textAlignment = NSTextAlignmentCenter;
    }
    return _label3;
}

- (UILabel *)label4
{
    if (!_label4) {
        _label4 = [[UILabel alloc] init];
        _label4.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];// 0x999999
        _label4.text = @"4";
        _label4.font = [UIFont systemFontOfSize:12];
        _label4.textAlignment = NSTextAlignmentCenter;
    }
    return _label4;
}

- (UILabel *)label5
{
    if (!_label5) {
        _label5 = [[UILabel alloc] init];
        _label5.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];// 0x999999
        _label5.text = @"5";
        _label5.font = [UIFont systemFontOfSize:12];
        _label5.textAlignment = NSTextAlignmentCenter;
    }
    return _label5;
}

#pragma mark - 创建
- (instancetype)initWithPowerGradeChangeBlock:(PowerAdjustViewGradeChangeBlock)powerGradeChangeBlcok
{
    if (self = [super init]) {
        _gradeBlock = powerGradeChangeBlcok;
        self.frame = CGRectMake(0, 0, 300, 40);// 写死大小
        [self addSubview:self.backgroudImageView];
        [self addSubview:self.triangleImageView];
        [self.backgroudImageView addSubview:self.label1];
        [self.backgroudImageView addSubview:self.label2];
        [self.backgroudImageView addSubview:self.label3];
        [self.backgroudImageView addSubview:self.label4];
        [self.backgroudImageView addSubview:self.label5];
    }
    return self;
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat Margin = self.width / 10.0;
    self.backgroudImageView.frame = CGRectMake(0, 0, self.width, 20);
    self.triangleImageView.frame = CGRectMake(Margin, self.backgroudImageView.frame.size.height, 20, 20);
    self.label1.centerX = Margin;
    self.label1.centerY = self.backgroudImageView.centerY;
    [self.label1 sizeToFit];
    
    self.label2.centerX = Margin*3;
    self.label2.centerY = self.backgroudImageView.centerY;
    [self.label2 sizeToFit];
    
    self.label3.centerX = Margin*5;
    self.label3.centerY = self.backgroudImageView.centerY;
    [self.label3 sizeToFit];
    
    self.label4.centerX = Margin*7;
    self.label4.centerY = self.backgroudImageView.centerY;
    [self.label4 sizeToFit];
    
    self.label5.centerX = Margin*9;
    self.label5.centerY = self.backgroudImageView.centerY;
    [self.label5 sizeToFit];
}

#pragma mark - 处理手势
- (void)handlePan:(UIPanGestureRecognizer*) recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y);
    if (recognizer.view.x <= 0) {
        recognizer.view.x = 0;
    }
    if (recognizer.view.x >= (self.width - 20)) {
        recognizer.view.x = self.width - 20;
    }
    
    [recognizer setTranslation:CGPointZero inView:self];
    
    if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        
        CGPoint point = recognizer.view.frame.origin;
        CGFloat Margin = self.width / 10.0;
        static CGFloat pointX = 0;
        static PowerGradeType gradeLevel = PowerGradeOne;
        if (0 <= point.x && point.x<Margin*2) {
            pointX = Margin;
            gradeLevel = PowerGradeOne;
        } else if (Margin*2<=point.x && point.x<Margin*4) {
            pointX = Margin*3;
            gradeLevel = PowerGradeTwo;
        } else if (Margin*4<=point.x && point.x<Margin*6) {
            pointX = Margin*5;
            gradeLevel = PowerGradeThree;
        } else if (Margin*6<=point.x && point.x<Margin*8) {
            pointX = Margin*7;
            gradeLevel = PowerGradeFour;
        } else if (Margin*8<=point.x && point.x<Margin*10) {
            pointX = Margin*9;
            gradeLevel = PowerGradeFive;
        }
        
        [UIView animateWithDuration:0.2 animations:^{
            recognizer.view.centerX = pointX;
        } completion:^(BOOL finished) {
            !_gradeBlock?:_gradeBlock(gradeLevel);
        }];
        
    }
    
}


@end
