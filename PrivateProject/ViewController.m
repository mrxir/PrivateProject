//
//  ViewController.m
//  PrivateProject
//
//  Created by MrXir on 2017/8/19.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "ViewController.h"

#import "InputBox.h"

#import <IQKeyboardManager.h>

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *classes;

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

/*

@property (nonatomic, assign) BOOL wasKeyboardManagerEnabled;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _wasKeyboardManagerEnabled = [[IQKeyboardManager sharedManager] isEnabled];
    
    [[IQKeyboardManager sharedManager] setEnable:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[IQKeyboardManager sharedManager] setEnable:_wasKeyboardManagerEnabled];
}
 
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.classes = [NSMutableArray array];
        [self.classes addObject:@"InputBox"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.classes.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    NSString *title = self.classes[indexPath.row];
    
    cell.title = title;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.classes[indexPath.row];
    
    Class class = NSClassFromString(title);
    
    if (class == [InputBox class]) {
        [self showInputBox];
    }
    
    
}

#pragma mark - classes

#pragma mark - InputBox

- (void)showInputBox
{
    InputBox *inputBox = [InputBox showInputTitle:@"被投诉人"
                                           inView:self.view
                                       firstLabel:@"姓        名"
                                 firstPlaceholder:nil
                                      secondLabel:@"身份证号"
                                secondPlaceholder:nil
                                       thirdLabel:@"工        号"
                                 thirdPlaceholder:nil
                                cancelButtonTitle:@"取消"
                                  doneButtonTitle:@"确定"
                             doneButtonCompletion:^(InputBox *inputBox, NSString *firstValue, NSString *secondValue, NSString *thirdValue) {
                                 
                                 [inputBox dismiss];
                                 
                                 NSLog(@"%@", firstValue);
                                 NSLog(@"%@", secondValue);
                                 NSLog(@"%@", thirdValue);
                                 
                             }];
    
    inputBox.titleLabel.textColor = [UIColor whiteColor];
    inputBox.firstLabel.textColor = [UIColor whiteColor];
    inputBox.secondLabel.textColor = [UIColor whiteColor];
    inputBox.thirdLabel.textColor = [UIColor whiteColor];
    inputBox.firstField.textColor = [UIColor whiteColor];
    inputBox.secondField.textColor = [UIColor whiteColor];
    inputBox.thirdField.textColor = [UIColor whiteColor];
    inputBox.contentView.layer.borderWidth = 1.0f;
    inputBox.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    inputBox.contentView.backgroundColor = [UIColor clearColor];
    
    inputBox.buttonContentView.layer.borderWidth = 1;
    inputBox.buttonContentView.layer.borderColor = [UIColor whiteColor].CGColor;
    inputBox.buttonContentView.backgroundColor = [UIColor clearColor];
    inputBox.buttonSeparatorView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
}


@end




@interface CollectionCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation CollectionCell

- (void)setTitle:(NSString *)title
{
    if (![_title isEqualToString:title]) {
        _title = title;
        
        self.titleLabel.text = _title;
    }
}

@end
