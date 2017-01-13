//
//  SecondViewController.m
//  subViewController
//
//  Created by Mr.H on 1/6/17.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "SecondViewController.h"



@interface SecondViewController () {
    JPNoParaBlock block;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headImageView.image = self.headImg;
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backButtonEvent:(UIButton *)sender {
    if (self.closeBlock) {
        self.closeBlock(self);
    }
    self.view.alpha = 0;

}

@end
