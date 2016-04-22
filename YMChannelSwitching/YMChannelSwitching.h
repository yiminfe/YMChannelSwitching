//代码地址：https://github.com/iosdeveloperSVIP/YMChannelSwitching
//原创：iosdeveloper赵依民
//邮箱：iosdeveloper@vip.163.com
//
//  YMChannelSwitching.h
//  YMChannelSwitching
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YMChannelSwitchingDelegate <NSObject>

- (UICollectionViewCell *)ymcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YMChannelSwitching : UIView

/** 传入frame、代理控制器、频道字符串数组 */
-(instancetype)initWithFrame:(CGRect)frame Delegate:(id)target channers:(NSArray<NSString *> *)ym_channers;

/** 频道的View */
@property (nonatomic,strong) UIScrollView *ym_channersView;

@property (nonatomic,strong) UICollectionView *ym_collectionView;

/** 设置当前频道字体颜色 */
-(void)ym_setChannelColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/** 代理 */
@property (nonatomic,weak) id<YMChannelSwitchingDelegate> ym_ChannelSwitchingDelegate;
@end
