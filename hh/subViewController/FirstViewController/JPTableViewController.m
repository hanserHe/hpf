//
//  HPFTableViewController.m
//  subViewController
//
//  Created by Mr.H on 1/5/17.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "JPTableViewController.h"
#import "JPTableViewCell.h"
#import "SecondViewController.h"
#import "JPCollectionViewCell.h"
#import "JPAnimationTool.h"

@interface JPTableViewController ()<UITableViewDelegate, UITableViewDataSource, JPTableViewCellDelegate>

@property (strong, nonatomic) JPAnimationTool *animationTool;
@end

@implementation JPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JPTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JPTableViewCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"JPTableViewCell";
    
    JPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    
    
    return cell;
}


#pragma mark ----------------------------------------------------------------
#pragma  -  JPTableViewCellDelegate
-(void)collectionViewDidSelectedItemIndexPath:(NSIndexPath *)indexPath collcetionView:(UICollectionView *)collectionView forCell:(JPTableViewCell *)cell {
    JPCollectionViewCell *collectionCell = (JPCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    SecondViewController *presentViewController = [[SecondViewController alloc] init];
    presentViewController.headImg = collectionCell.headImg.image;

    presentViewController.closeBlock =  [self.animationTool begainAnimationWithCollectionViewDidSelectedItemIndexPath:indexPath collcetionView:collectionView forViewController:self presentViewController:presentViewController afterPresentedBlock:presentViewController.fadeBlock];
}

-(JPAnimationTool *)animationTool{
    if (!_animationTool) {
        _animationTool = [JPAnimationTool new];
    }
    return _animationTool;
}



@end
