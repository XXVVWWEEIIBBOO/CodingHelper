//
//  UIView+WBExtension.m
//  CodingHelper
//
//  Created by 徐伟博 on 2019/12/28.
//  Copyright © 2019 徐伟博. All rights reserved.
//

#import "UIView+WBExtension.h"

@implementation UIView (WBExtension)

- (CGFloat)wb_x {
    return self.frame.origin.x;
}

- (void)setWb_x:(CGFloat)wb_x {
    self.frame = CGRectMake(wb_x, self.wb_y, self.wb_w, self.wb_h);
}

- (CGFloat)wb_y {
    return self.frame.origin.y;
}

- (void)setWb_y:(CGFloat)wb_y {
    self.frame = CGRectMake(self.wb_x, wb_y, self.wb_w, self.wb_h);
}

- (CGFloat)wb_w {
    return self.frame.size.width;
}

- (void)setWb_w:(CGFloat)wb_w {
    self.frame = CGRectMake(self.wb_x, self.wb_y, wb_w, self.wb_h);
}

- (CGFloat)wb_h {
    return self.frame.size.height;
}

- (void)setWb_h:(CGFloat)wb_h {
    self.frame = CGRectMake(self.wb_x, self.wb_y, self.wb_w, wb_h);
}

- (CGFloat)wb_cx {
    return self.center.x;
}

- (void)setWb_cx:(CGFloat)wb_cx {
    self.center = CGPointMake(wb_cx, self.wb_cy);
}

- (CGFloat)wb_cy {
    return self.center.y;
}

- (void)setWb_cy:(CGFloat)wb_cy {
    self.center = CGPointMake(self.wb_cx, wb_cy);
}

- (CGFloat)wb_right {
    return self.wb_x + self.wb_w;
}

- (CGFloat)wb_bottom {
    return self.wb_y + self.wb_h;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setTarget:(id)target action:(SEL)action {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

@end
