//
//  ViewController.m
//  PrivateProject
//
//  Created by MrXir on 2017/8/19.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "ViewController.h"

#import "InputBox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    [self showBox];
}

- (void)showBox
{
    [InputBox showInputTitle:@"被投诉人"
                      inView:self.view
                  firstLabel:@"姓        名"
            firstPlaceholder:nil
                 secondLabel:@"身份证号"
           secondPlaceholder:nil
                  thirdLabel:@"工        号"
            thirdPlaceholder:nil
           cancelButtonTitle:@"取消"
             doneButtonTitle:@"确定"
        doneButtonCompletion:^(NSString *firstValue, NSString *secondValue, NSString *thirdValue) {
            
        }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
