//
//  JPTableViewCell.h
//  subViewController
//
//  Created by Mr.H on 1/5/17.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JPTableViewCell, JPCollectionViewCell;

@protocol JPTableViewCellDelegate <NSObject>

@optional
-(void)collectionViewDidSelectedItemIndexPath:(NSIndexPath *)indexPath collcetionView:(UICollectionView *)collectionView forCell:(JPTableViewCell *)cell;

@end


@interface JPTableViewCell : UITableViewCell

@property (weak, nonatomic) id<JPTableViewCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
