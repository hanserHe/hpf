//
//  ViewController.m
//  subViewController
//
//  Created by Mr.H on 12/29/16.
//  Copyright © 2016 Mr.H. All rights reserved.
//

#import "ViewController.h"
#import "SwitchView.h"


@interface ViewController ()

@property (strong, nonatomic) SwitchView *switchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.说的啥sdf dfsdfsdfsdf
    
    [self.view addSubview:self.switchView];
}


#pragma mark - Init
- (SwitchView *)switchView {
    if (_switchView) {
        return _switchView;
    }
    NSArray *array = [NSArray arrayWithObjects:@"哈哈", @"呵呵",@"666",@"sdfsd",@"sdfsd",nil];
    CGRect rect = CGRectMake(0, kNavigationHeight, 300, 50);
    UIColor *normalColor = [UIColor blackColor];
    UIColor *selectedColor = [UIColor redColor];
    _switchView = [[SwitchView alloc] initWithFrame:rect titleArray:array normalColor:normalColor selectedColor:selectedColor];
    return _switchView;
}

@end
