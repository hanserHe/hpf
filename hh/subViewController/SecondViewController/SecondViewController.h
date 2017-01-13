//
//  SecondViewController.h
//  subViewController
//
//  Created by Mr.H on 1/6/17.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "ViewController.h"



typedef void(^JPNoParaBlock)(void);
typedef void(^JPContainIDBlock)(id);

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (strong, nonatomic) UIImage *headImg;
@property (weak, nonatomic) IBOutlet UIView *contentView;

/** 进入出现动画 */
@property(nonatomic, strong)JPNoParaBlock fadeBlock;

/** 关闭动画 */
@property(nonatomic, strong)JPContainIDBlock closeBlock;

@end
