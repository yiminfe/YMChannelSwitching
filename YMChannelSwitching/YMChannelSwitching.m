//代码地址：https://github.com/iosdeveloperSVIP/YMChannelSwitching
//原创：iosdeveloper赵依民
//邮箱：iosdeveloper@vip.163.com
//
//  YMChannelSwitching.m
//  YMChannelSwitching
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMChannelSwitching.h"
#import "YMChannelSwitchingLayout.h"
#import "YMChannelButton.h"
#import "UIView+ym_extension.h"

#define YMSCROLLVIEWINDEX scrollView.contentOffset.x / self.ym_collectionView.ym_width

@interface YMChannelSwitching()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation YMChannelSwitching{
    NSArray<NSString *> *_ym_channers;
    NSInteger _ym_selectIndex;
    CGFloat _ym_red;
    CGFloat _ym_green;
    CGFloat _ym_blue;
    CGFloat _ym_contentOffsetXold;
}

-(instancetype)initWithFrame:(CGRect)frame Delegate:(id)target channers:(NSArray<NSString *> *)ym_channers{
    self = [super initWithFrame:frame];
    if (self) {
        NSAssert(target, @"请传入代理");
        NSAssert(ym_channers, @"请传入频道字符串数组");
        _ym_channers = ym_channers;
        self.ym_ChannelSwitchingDelegate = target;
        self.ym_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, self.ym_width, self.ym_height - 44) collectionViewLayout:[YMChannelSwitchingLayout new]];
        self.ym_collectionView.backgroundColor = [UIColor whiteColor];
        self.ym_collectionView.dataSource = self;
        self.ym_collectionView.delegate = self;
        [self addSubview:self.ym_collectionView];
        [self ym_setChannersView];
    }
    return self;
}

-(void)ym_setChannersView{
    _ym_red = 255.0;
    _ym_green = 255.0;
    _ym_blue = 255.0;
    self.ym_channersView = [[UIScrollView alloc] init];
    NSInteger count = _ym_channers.count;
    for (int i = 0 ; i < count ; i++) {
        YMChannelButton *btn = [[YMChannelButton alloc] init];
        [btn setTitle:_ym_channers[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:_ym_red green:_ym_green blue:_ym_blue alpha:0.8] forState:UIControlStateNormal];
        btn.tag = (i + 1);
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [btn addTarget:self action:@selector(ym_btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        btn.ym_height = 44;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        if (i) {
            UIView *view = [self.ym_channersView viewWithTag:i];
            btn.ym_x = CGRectGetMaxX(view.frame) + 20;
        }
        btn.ym_y = 0;
        [self.ym_channersView addSubview:btn];
        if (i == 0) {
            [btn ym_setScale:1.0 red:_ym_red green:_ym_green blue:_ym_blue];
            btn.ym_x = 5;
        }
    }
    self.ym_channersView.ym_x = 0;
    self.ym_channersView.ym_y = 0;
    self.ym_channersView.ym_size = CGSizeMake(self.ym_width, 44);
    self.ym_channersView.contentSize = CGSizeMake(CGRectGetMaxX([self.ym_channersView viewWithTag:20].frame) + 10, 44);
    self.ym_channersView.bounces = NO;
    self.ym_channersView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.ym_channersView];
}

-(void)ym_btnClick:(UIButton *)btn{
    self.ym_collectionView.tag = -1;
    if (btn.tag !=1) {
        [self.ym_collectionView setContentOffset:CGPointMake((btn.tag - 1) * self.ym_collectionView.ym_width, 0) animated:YES];
    }else{
        [self.ym_collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _ym_channers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if ([self.ym_ChannelSwitchingDelegate respondsToSelector:@selector(ymcollectionView:cellForItemAtIndexPath:)]) {
        cell = [self.ym_ChannelSwitchingDelegate ymcollectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.ym_collectionView.tag == -1) {
        return;
    }
    if (_ym_contentOffsetXold < scrollView.contentOffset.x || ABS(YMSCROLLVIEWINDEX - _ym_selectIndex) > 1) {
        if((NSInteger)(YMSCROLLVIEWINDEX)!=_ym_selectIndex){
            [self scrollViewDidEndDecelerating:scrollView];
            return;
        }
    }
    YMChannelButton *currentBtn = [self.ym_channersView viewWithTag:_ym_selectIndex + 1];
    YMChannelButton *nextBtn = nil;
    NSArray *indexPaths = [self.ym_collectionView indexPathsForVisibleItems];
    for (NSIndexPath *indexPath in indexPaths) {
        if (indexPath.item != _ym_selectIndex) {
            nextBtn = [self.ym_channersView viewWithTag:indexPath.item + 1];
        }
    }
    if (nextBtn == nil) {
        return;
    }
    CGFloat nextScale = ABS(scrollView.contentOffset.x / scrollView.ym_width- _ym_selectIndex);
    CGFloat currentScale = 1 - nextScale;
    [nextBtn ym_setScale:nextScale red:_ym_red green:_ym_green blue:_ym_blue];
    [currentBtn ym_setScale:currentScale red:_ym_red green:_ym_green blue:_ym_blue];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.ym_collectionView.tag = 0;
    _ym_selectIndex = YMSCROLLVIEWINDEX;
    [self setChannelColor];
    YMChannelButton *currentBtn = [self.ym_channersView viewWithTag:(_ym_selectIndex + 1)];
    CGFloat offsetX = currentBtn.ym_centerX - self.ym_channersView.ym_width * 0.5;
    CGFloat maxOffsetX = self.ym_channersView.contentSize.width - self.ym_channersView.ym_width;
    if (offsetX < 0) {
        offsetX = 0;
    }else if(offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self.ym_channersView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
    }];
    _ym_contentOffsetXold = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}
-(void)ym_setChannelColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    _ym_red = red;
    _ym_green = green;
    _ym_blue = blue;
    [self setChannelColor];
}

-(void)setChannelColor{
    for (YMChannelButton *btn in self.ym_channersView.subviews) {
        if ([btn isKindOfClass:[UIImageView class]]) {
            continue;
        }
        if (btn.tag == _ym_selectIndex + 1) {
            [btn ym_setScale:1 red:_ym_red green:_ym_green blue:_ym_blue];
        }else{
            [btn ym_setScale:0 red:_ym_red green:_ym_green blue:_ym_blue];
        }
    }
}
@end
