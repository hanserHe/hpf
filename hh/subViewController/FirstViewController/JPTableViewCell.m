//
//  JPTableViewCell.m
//  subViewController
//
//  Created by Mr.H on 1/5/17.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "JPTableViewCell.h"
#import "JPCollectionViewCell.h"

@interface JPTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionViewFlowLayout *itemFlowLayOut;

@end

@implementation JPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    _itemFlowLayOut = [[UICollectionViewFlowLayout alloc] init];
    _itemFlowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //初始化
    _itemFlowLayOut.itemSize = CGSizeMake(200, 125);
    _itemFlowLayOut.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    _itemFlowLayOut.minimumInteritemSpacing = 50;
    
    self.collectionView.collectionViewLayout = _itemFlowLayOut;
    [self.collectionView registerNib:[UINib nibWithNibName:@"JPCollectionViewCell"  bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"JPCollectionViewCell"];
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;

}


#pragma mark ---------------------------------------------------
#pragma - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(collectionViewDidSelectedItemIndexPath:collcetionView:forCell:)]) {
        [self.delegate collectionViewDidSelectedItemIndexPath:indexPath collcetionView:collectionView forCell:self];
    }
}


#pragma mark - UICollectionViewDataSouce
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"JPCollectionViewCell";
    JPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:cellID owner:nil options:nil] firstObject];
//    }
    return cell;
}
@end
