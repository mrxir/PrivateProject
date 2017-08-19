//
//  UITextField+BaselineHUD.h
//  MRTextField
//
//  Created by MrXir on 2017/7/16.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (BaselineHUD)

@property (nonatomic, assign) IBInspectable CGFloat baselineHUDHeight;

@property (nonatomic, strong) CAShapeLayer *baselineHUDLayer;

@property (nonatomic, strong) IBInspectable UIColor *baselineHUDActiveColor;

@property (nonatomic, strong) IBInspectable UIColor *baselineHUDInactiveColor;

@end
