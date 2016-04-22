//
//  YMCollectionViewCellTwo.m
//  YMChannelSwitching
//
//  Created by mac on 16/4/21.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMCollectionViewCellTwo.h"
#import "YMChannelSwitching.h"
#import "YMCollectionViewCell.h"
#import "UIView+ym_extension.h"

@interface YMCollectionViewCellTwo()<YMChannelSwitchingDelegate>

@end

@implementation YMCollectionViewCellTwo{
    NSMutableArray *_channels;
}


static NSString *reuseIdentifier = @"ym_cell";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        _channels = [[NSMutableArray alloc] init];
        NSInteger count = 20;
        for (int i = 0 ; i < count ; i++) {
            [_channels addObject:[NSString stringWithFormat:@"频道%zd",i + 1]];
        }
        YMChannelSwitching *channerView = [[YMChannelSwitching alloc] initWithFrame:CGRectMake(0, 0, self.ym_width,self.ym_height * 0.5) Delegate:self channers:_channels];
        [channerView.ym_collectionView registerClass:[YMCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [self.contentView addSubview:channerView];
    }
    return self;
}

-(UICollectionViewCell *)ymcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.title = _channels[indexPath.row];
    NSLog(@"%@",cell);
    return cell;
}

@end
