//
//  SwitchView.m
//  subViewController
//
//  Created by Mr.H on 12/29/16.
//  Copyright © 2016 Mr.H. All rights reserved.
//

#import "SwitchView.h"


@interface SwitchView() {
    CGFloat _height;
    CGFloat _width;
    CGFloat _buttonWidth;
    
    NSArray *_titleArray;
    
    UIButton *_markButton;    //标记被选中的button
    
    UIColor *_normalColor;
    UIColor *_selectedColor;
    
    UIView *_lineView;
    
}

@end

@implementation SwitchView

- (instancetype)initWithFrame:(CGRect)frame
                   titleArray:(NSArray *)titleArray
                  normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectedColor {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _height = frame.size.height;
        _width = frame.size.width;
        _titleArray = titleArray;
        _normalColor = normalColor;
        _selectedColor = selectedColor;
        
        [self initTitleView];
        
    }
    return self;
}


- (void)initTitleView {
    
    NSInteger count = _titleArray.count;
    CGFloat width = _width / count;
    _buttonWidth = width;
    
    _lineView = [[UIView alloc] init];
    _lineView.frame = CGRectMake(0, _height-0.5, width, 0.5);
    _lineView.backgroundColor = [UIColor redColor];
    [self addSubview:_lineView];
    
    
    for (NSInteger i=0; i<count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(i*width, 0, width, _height);
        button.tag = i+1;
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        button.backgroundColor = [UIColor clearColor];
        [button setTitleColor:_normalColor forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitleColor:_selectedColor forState:UIControlStateNormal];
        }
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

#pragma mark - Click
- (void)Click:(UIButton *)btn {
    if (!_markButton) {
        //第一次点
        [btn setTitleColor:_selectedColor forState:UIControlStateNormal];
        UIButton *button = [self viewWithTag:1];
        [button setTitleColor:_normalColor forState:UIControlStateNormal];
    }else if(_markButton == btn) {
        return;
    }else {
        [_markButton setTitleColor:_normalColor forState:UIControlStateNormal];
        [btn setTitleColor:_selectedColor forState:UIControlStateNormal];
    }
    _markButton = btn;
    [UIView animateWithDuration:0.5 animations:^{
        _lineView.frame = CGRectMake((_markButton.tag - 1)*_buttonWidth, _height - 0.5, _buttonWidth, 0.5);
    }];
}

@end
