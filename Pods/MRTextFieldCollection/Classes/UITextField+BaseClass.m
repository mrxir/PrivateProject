//
//  UITextField+BaseClass.m
//  MRTextField
//
//  Created by MrXir on 2017/7/17.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "UITextField+BaseClass.h"

#import <objc/runtime.h>

@implementation UITextField (BaseClass)

@dynamic maxlength;

- (void)setMaxlength:(NSUInteger)maxlength
{
    if ([self markedTextLength] == 0) {
        
        if (self.text.length > maxlength) {
            self.text = [self.text substringToIndex:maxlength];
        }
        
    }
    
    id objc = objc_getAssociatedObject(self, @"maxlength");
    
    if (!objc) {
        
        [self addTarget:self
                 action:@selector(actionDidTriggerWithSender:forEvent:)
       forControlEvents:UIControlEventEditingChanged|UIControlEventEditingDidEnd|UIControlEventEditingDidEndOnExit];
        
    }

    if (maxlength != self.maxlength) {
        objc_setAssociatedObject(self, @"maxlength", @(maxlength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
}

- (NSUInteger)maxlength
{
    id objc = objc_getAssociatedObject(self, @"maxlength");
    
    if ([objc isKindOfClass:[NSNumber class]]) {
        return [objc integerValue];
    } else {
        return 0;
    }
}

- (void)actionDidTriggerWithSender:(id)sender forEvent:(UIEvent *)event
{
    if ([self markedTextLength] == 0) {
        
        if (self.text.length > self.maxlength) {
            self.text = [self.text substringToIndex:self.maxlength];
        }
        
    }
    
}

- (NSInteger)markedTextLength
{
    return [self offsetFromPosition:self.markedTextRange.start toPosition:self.markedTextRange.end];
}

@end
