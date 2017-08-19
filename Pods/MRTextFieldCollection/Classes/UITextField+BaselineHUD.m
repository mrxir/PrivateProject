//
//  UITextField+BaselineHUD.m
//  MRTextField
//
//  Created by MrXir on 2017/7/16.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "UITextField+BaselineHUD.h"

#import <objc/runtime.h>

@implementation UITextField (BaselineHUD)

@dynamic baselineHUDHeight;

@dynamic baselineHUDLayer;

@dynamic baselineHUDActiveColor;

@dynamic baselineHUDInactiveColor;

#pragma mark - setter and getter

#pragma mark - baselineHUDHeight

- (void)setBaselineHUDHeight:(CGFloat)baselineHUDHeight
{
    if (baselineHUDHeight != self.baselineHUDHeight) {
        objc_setAssociatedObject(self, @"baselineHUDHeight", @(baselineHUDHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CGFloat)baselineHUDHeight
{
    id objc = objc_getAssociatedObject(self, @"baselineHUDHeight");
    
    if ([objc isKindOfClass:[NSNumber class]]) {
        return [objc floatValue];
    } else {
        return 0;
    }
}

#pragma mark - baselineHUDLayer

- (void)setBaselineHUDLayer:(CAShapeLayer *)baselineHUDLayer
{
    objc_setAssociatedObject(self, @"baselineHUDLayer", baselineHUDLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)baselineHUDLayer
{
    return objc_getAssociatedObject(self, @"baselineHUDLayer");
}

#pragma mark - baselineHUDActiveColor

- (void)setBaselineHUDActiveColor:(UIColor *)baselineHUDActiveColor
{
    objc_setAssociatedObject(self, @"baselineHUDActiveColor", baselineHUDActiveColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)baselineHUDActiveColor
{
    return objc_getAssociatedObject(self, @"baselineHUDActiveColor");
}

#pragma mark - baselineHUDInactiveColor

- (void)setBaselineHUDInactiveColor:(UIColor *)baselineHUDInactiveColor
{
    objc_setAssociatedObject(self, @"baselineHUDInactiveColor", baselineHUDInactiveColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)baselineHUDInactiveColor
{
    return objc_getAssociatedObject(self, @"baselineHUDInactiveColor");
}

#pragma mark - layout

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    [super layoutSublayersOfLayer:layer];
    
    [self layoutBaselineHUDIfNeed];

}

- (void)layoutBaselineHUDIfNeed
{

    if (!self.baselineHUDLayer) {
        self.baselineHUDLayer = [CAShapeLayer layer];
        self.baselineHUDLayer.fillColor = self.baselineHUDInactiveColor.CGColor;
        [self.superview.layer addSublayer:self.baselineHUDLayer];
        
        [self addTarget:self
                 action:@selector(textFieldEventEditingDidBegin:)
       forControlEvents:UIControlEventEditingDidBegin];
        
        [self addTarget:self
                 action:@selector(textFieldEventEditingDidEnd:)
       forControlEvents:UIControlEventEditingDidEnd|UIControlEventEditingDidEndOnExit];
    }
    
    CGFloat height = self.baselineHUDHeight;
    
    CGRect baselineHUDLayerFrame = CGRectMake(0,
                                              CGRectGetHeight(self.superview.layer.bounds) - height - 0.1,
                                              CGRectGetWidth(self.superview.layer.bounds),
                                              height);
    
    self.baselineHUDLayer.frame = baselineHUDLayerFrame;
    
    UIBezierPath *baselineHUDLayerPath = [UIBezierPath bezierPathWithRect:self.baselineHUDLayer.bounds];
    self.baselineHUDLayer.path = baselineHUDLayerPath.CGPath;
}

#pragma mark - events

- (void)textFieldEventEditingDidBegin:(UITextField *)textField
{
    textField.baselineHUDLayer.fillColor = self.baselineHUDActiveColor.CGColor;
}

- (void)textFieldEventEditingDidEnd:(UITextField *)textField
{
    textField.baselineHUDLayer.fillColor = self.baselineHUDInactiveColor.CGColor;
}

@end
