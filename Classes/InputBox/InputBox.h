//
//  InputBox.h
//  PrivateProject
//
//  Created by MrXir on 2017/8/19.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InputCompletionBlock)(NSString *firstValue, NSString *secondValue, NSString *thirdValue);

@interface InputBox : UIView

+ (void)showInputTitle:(NSString *)title
                inView:(UIView *)superView
            firstLabel:(NSString *)firstLabel
      firstPlaceholder:(NSString *)firstPlaceholder
           secondLabel:(NSString *)secondLabel
     secondPlaceholder:(NSString *)secondPlaceholder
            thirdLabel:(NSString *)thirdLabel
      thirdPlaceholder:(NSString *)thirdPlaceholder
     cancelButtonTitle:(NSString *)cancelTitle
       doneButtonTitle:(NSString *)doneTitle
  doneButtonCompletion:(InputCompletionBlock)doneCompletion;

@end
