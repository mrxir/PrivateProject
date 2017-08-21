//
//  ViewController.m
//  PrivateProject
//
//  Created by MrXir on 2017/8/19.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "ViewController.h"

#import "InputBox.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *classes;

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

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
            NSLog(@"%@", firstValue);
            NSLog(@"%@", secondValue);
            NSLog(@"%@", thirdValue);
        }];
    
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
