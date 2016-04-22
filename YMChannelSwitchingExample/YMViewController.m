//
//  YMViewController.m
//  YMChannelSwitching
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMViewController.h"
#import "YMChannelSwitching.h"
#import "YMCollectionViewCell.h"
#import "UIView+ym_extension.h"
#import "YMCollectionViewCellTwo.h"

#define ym_CHANNELHEIGHT (self.view.ym_height - 64)

@interface YMViewController ()<YMChannelSwitchingDelegate>

@end

@implementation YMViewController{
    NSMutableArray *_channels;
}

static NSString *reuseIdentifier = @"ym_cell";
static NSString *reuseIdentifierTwo = @"ym_cellTwo";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //添加频道视图
    _channels = [[NSMutableArray alloc] init];
    NSInteger count = 20;
    for (int i = 0 ; i < count ; i++) {
        [_channels addObject:[NSString stringWithFormat:@"频道%zd",i + 1]];
    }
    YMChannelSwitching *channerView = [[YMChannelSwitching alloc] initWithFrame:CGRectMake(0, 64, self.view.ym_width,self.view.ym_height - 64) Delegate:self channers:_channels];
    [channerView.ym_collectionView registerClass:[YMCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [channerView.ym_collectionView registerClass:[YMCollectionViewCellTwo class] forCellWithReuseIdentifier:reuseIdentifierTwo];
    [channerView ym_setChannelColorWithRed:0.0 green:0.0 blue:0.0];
    [self.view addSubview:channerView];
    self.navigationItem.titleView = channerView.ym_channersView;
    channerView.ym_collectionView.frame = CGRectMake(0, 64, self.view.ym_width, self.view.ym_height - 64);
    [self.view addSubview:channerView.ym_collectionView];
}

-(UICollectionViewCell *)ymcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (indexPath.row == 0 && cell.ym_height == ym_CHANNELHEIGHT) {
        YMCollectionViewCellTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierTwo forIndexPath:indexPath];
        return cell;
    }
    cell.title = _channels[indexPath.row];
    NSLog(@"%@",cell);
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
