//
//  FirstViewController.m
//  subViewController
//
//  Created by Mr.H on 1/3/17.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) UIView *practiceView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Init
- (UIView *)mySubView {
    return nil;
}

- (UIView *)practiceView {
    if (_practiceView) {
        return _practiceView;
    }
    _practiceView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, 200)];
    return  _practiceView;
}

@end
