//
//  InputBox.m
//  PrivateProject
//
//  Created by MrXir on 2017/8/19.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "InputBox.h"

const CGFloat presetSize = 272.0f;
const CGFloat presetRatio = presetSize / 375.0f;

@interface InputBox ()

@property (nonatomic, weak) IBOutlet UIView *view;

@property (nonatomic, weak) IBOutlet UIView *contentView;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewWidthConstraint;

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@property (nonatomic, weak) IBOutlet UILabel *firstLabel;
@property (nonatomic, weak) IBOutlet UITextField *firstField;

@property (nonatomic, weak) IBOutlet UILabel *secondLabel;
@property (nonatomic, weak) IBOutlet UITextField *secondField;

@property (nonatomic, weak) IBOutlet UILabel *thirdLabel;
@property (nonatomic, weak) IBOutlet UITextField *thirdField;

@property (nonatomic, weak) IBOutlet UIView *buttonContentView;

@property (nonatomic, weak) IBOutlet UIButton *cancelButton;
@property (nonatomic, weak) IBOutlet UIButton *doneButton;

@property (nonatomic, copy) InputCompletionBlock inputCompletionBlock;

@end

@implementation InputBox

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
  doneButtonCompletion:(InputCompletionBlock)doneCompletion
{
    InputBox *box = [[InputBox alloc] initWithFrame:[UIScreen mainScreen].bounds];
    box.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    box.titleLabel.text = title;
    
    box.firstLabel.text = firstLabel;
    box.firstField.placeholder = firstPlaceholder;
    
    box.secondLabel.text = secondLabel;
    box.secondField.placeholder = secondPlaceholder;
    
    box.thirdLabel.text = thirdLabel;
    box.thirdField.text = thirdPlaceholder;

    [box.doneButton setTitle:doneTitle forState:UIControlStateNormal];
    
    box.inputCompletionBlock = doneCompletion;
    
    [box.doneButton addTarget:box action:@selector(didClickDoneButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [box.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
    
    [box.cancelButton addTarget:box action:@selector(didClickCancelButton:) forControlEvents:UIControlEventTouchUpInside];

    [superView addSubview:box];
    
    [box animateView];
    
}

#pragma mark - life cycle

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        [self setupSubviews];
    }
    return self;
}

#pragma mark - layout

- (void)animateView
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
        self.alpha = 1;
    } completion:NULL];
}

- (void)layoutSubviews
{
    self.view.frame = self.bounds;
    
    CGFloat minSize = MIN(self.frame.size.width, self.frame.size.height);
    
    CGFloat maxSize = minSize * presetRatio;
    
    if (maxSize >= presetSize) {
        self.contentViewWidthConstraint.constant = maxSize;
    }
    
}

#pragma mark - setup subviews

- (void)setupSubviews
{
    
    self.alpha = 0;
    
    [self addSubview:self.view];

    self.contentView.layer.cornerRadius = 10.0f;
    
    self.buttonContentView.layer.cornerRadius = CGRectGetHeight(self.buttonContentView.bounds)/2.0f;
    
}

#pragma mark - private method

- (void)dismiss
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    [self endEditing:YES];
}

- (void)didClickDoneButton:(UIButton *)button
{
    if (self.inputCompletionBlock != NULL) {
        self.inputCompletionBlock(self.firstField.text, self.secondField.text, self.thirdField.text);
    }
}

- (void)didClickCancelButton:(UIButton *)button
{
    [self dismiss];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
