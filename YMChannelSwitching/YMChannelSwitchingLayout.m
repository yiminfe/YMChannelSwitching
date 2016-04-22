//代码地址：https://github.com/iosdeveloperSVIP/YMChannelSwitching
//原创：iosdeveloper赵依民
//邮箱：iosdeveloper@vip.163.com
//
//  YMChannelSwitchingLayout.m
//  YMChannelSwitching
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMChannelSwitchingLayout.h"

@implementation YMChannelSwitchingLayout

-(void)prepareLayout{
    [super prepareLayout];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.itemSize = self.collectionView.bounds.size;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;}

@end
