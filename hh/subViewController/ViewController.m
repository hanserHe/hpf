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

@property (strong, nonatomic) UIImageView *exampleImageView;
/** 动画元素 */
@property (strong, nonatomic) UIImageView *animationImageView;

/** 是否打开预览动画 */
@property (assign, nonatomic) BOOL isOpenOverView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.sadasdas
   // [self.view addSubview:self.switchView];
//    self.isOpenOverView = YES;
//    [self.view addSubview:self.exampleImageView];
    
}

// 将一个 view 进行截图
-(UIImage *)snapImageForView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *aImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aImage;
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

- (UIImageView *)animationImageView {
    if (_animationImageView) {
        return _animationImageView;
    }
    _animationImageView = [[UIImageView alloc] init];
    _animationImageView.frame = self.view.bounds;
    return _animationImageView;
}


- (UIImageView *)exampleImageView {
    if (_exampleImageView) {
        return _exampleImageView;
    }
    _exampleImageView = [[UIImageView alloc] init];
    _exampleImageView.frame = CGRectMake((kScreenWidth-100)/2, kScreenHegiht/2, 100, 100);
    _exampleImageView.image = [UIImage imageNamed:@"image1.jpg"];
    return _exampleImageView;
}

#pragma mark - touched Event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"我点击了");
    //先将目标视图进行截图
    UIImage *animationImage = [self snapImageForView:self.exampleImageView];
    
    CGRect targetFrame_start = [self.exampleImageView.superview convertRect:self.exampleImageView.frame toView:nil];
    
    //计算动画重点位置
    CGFloat targetW = 200;
    CGFloat targetH = 200;
    CGFloat targetX = 50;
    CGFloat targetY = 200;
    CGRect targetFrame_end = CGRectMake(targetX, targetY, targetW, targetH);
    
    // 添加做动画的元素
    if (!self.animationImageView.superview) {
        self.animationImageView.image = animationImage;
        self.animationImageView.frame = targetFrame_start;
        [self.view.window addSubview:self.animationImageView];
    }
    
    if (self.isOpenOverView) {
        // 预览动画
        [UIView animateWithDuration:1 delay:0. options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.animationImageView.frame = targetFrame_end;
            
        } completion:^(BOOL finished) {
            
        }];
    } else{
        // 关闭预览动画
        [UIView animateWithDuration:1 delay:0. options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.animationImageView.frame = targetFrame_start;
            
        } completion:^(BOOL finished) {
            
            [self.animationImageView removeFromSuperview];
            
        }];
    }
    self.isOpenOverView = !self.isOpenOverView;

}




@end
