//
//  YMCollectionViewCell.m
//  YMChannelSwitching
//
//  Created by mac on 16/4/21.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMCollectionViewCell.h"

@implementation YMCollectionViewCell{
    UILabel *_titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _titleLabel.text = [NSString stringWithFormat:@"这是%@的视图",title];
    [_titleLabel sizeToFit];
    _titleLabel.center = self.contentView.center;

}

@end
