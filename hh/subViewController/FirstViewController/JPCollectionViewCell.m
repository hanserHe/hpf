//
//  JPCollectionViewCell.m
//  subViewController
//
//  Created by Mr.H on 1/5/17.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "JPCollectionViewCell.h"
#import "JPAnimationTool.h"

@implementation JPCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.headImg.tag = JPCoverImageViewTag;
    
}

@end
