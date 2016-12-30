//
//  SwitchView.h
//  subViewController
//
//  Created by Mr.H on 12/29/16.
//  Copyright © 2016 Mr.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwitchViewDelegate <NSObject>

- (void)switchViewButtonClick:(NSInteger)btnTag;

@end


@interface SwitchView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                   titleArray:(NSArray *)titleArray
                  normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectedColor;

@end
