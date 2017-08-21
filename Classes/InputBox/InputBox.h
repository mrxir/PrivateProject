//
//  InputBox.h
//  PrivateProject
//
//  Created by MrXir on 2017/8/19.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputBox : UIView

typedef void(^InputCompletionBlock)(InputBox *inputBox, NSString *firstValue, NSString *secondValue, NSString *thirdValue);
@property (nonatomic, copy) InputCompletionBlock inputCompletionBlock;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewWidthConstraint;


@property (nonatomic, weak) IBOutlet UIView *view;


@property (nonatomic, weak) IBOutlet UIView *contentView;

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;


@property (nonatomic, weak) IBOutlet UIView *inputContentView;

@property (nonatomic, weak) IBOutlet UILabel *firstLabel;
@property (nonatomic, weak) IBOutlet UITextField *firstField;

@property (nonatomic, weak) IBOutlet UILabel *secondLabel;
@property (nonatomic, weak) IBOutlet UITextField *secondField;

@property (nonatomic, weak) IBOutlet UILabel *thirdLabel;
@property (nonatomic, weak) IBOutlet UITextField *thirdField;


@property (nonatomic, weak) IBOutlet UIView *closeButtonContentView;
@property (nonatomic, weak) IBOutlet UIButton *closeButton;


@property (nonatomic, weak) IBOutlet UIView *buttonContentView;

@property (nonatomic, weak) IBOutlet UIButton *cancelButton;
@property (nonatomic, weak) IBOutlet UIButton *doneButton;

@property (nonatomic, weak) IBOutlet UIView *buttonSeparatorView;



+ (instancetype)showInputTitle:(NSString *)title
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

- (void)dismiss;

@end
