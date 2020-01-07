//
//  UIView+WBExtension.h
//  CodingHelper
//
//  Created by 徐伟博 on 2019/12/28.
//  Copyright © 2019 徐伟博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WBExtension)

/// x坐标
@property (nonatomic) CGFloat wb_x;
/// y坐标
@property (nonatomic) CGFloat wb_y;
/// 宽度
@property (nonatomic) CGFloat wb_w;
/// 高度
@property (nonatomic) CGFloat wb_h;
/// 中心x坐标
@property (nonatomic) CGFloat wb_cx;
/// 中心y坐标
@property (nonatomic) CGFloat wb_cy;
/// 右边缘
@property (nonatomic, readonly) CGFloat wb_right;
/// 下边缘
@property (nonatomic, readonly) CGFloat wb_bottom;

/// 设置圆角
/// @param cornerRadius 圆角大小
- (void)setCornerRadius:(CGFloat)cornerRadius;

/// 设置边框宽度和颜色
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/// 设置轻拍手势目标和动作
/// @param target 目标
/// @param action 动作
- (void)setTarget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
