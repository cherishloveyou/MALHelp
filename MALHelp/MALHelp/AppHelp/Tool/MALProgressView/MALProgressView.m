//
//  MALProgressView.m
//  UIProgressViewDemo
//
//  Created by wangtian on 15-3-13.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "MALProgressView.h"

@implementation MALProgressView

- (UIImageView *)bgView
{
    if (_bgView == nil) {
        
        _bgView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _bgView;
}

- (UIImageView *)topView
{
    if (_topView == nil) {
        
        _topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, self.bounds.size.height)];
    }
    return _topView;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _bgView.frame = self.bounds;
    _topView.frame = self.bounds;
    [self setM_progress:_m_progress];
}

+ (MALProgressView *)malProgressViewWithRect:(CGRect)rect
{
    MALProgressView *pro = [[MALProgressView alloc] initWithFrame:rect];
    [pro setUpView];
    [pro configueProgressView];
    return pro;
}

#pragma mark - 配置默认值
- (void)configueProgressView
{
    self.m_progress = 0.5;
    [self setBgColor:[UIColor lightGrayColor] topColor:[UIColor blueColor]];
}

- (void)setUpView
{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bgView];
    [self addSubview:self.topView];
}

- (void)setBgImage:(UIImage *)bgImage topImage:(UIImage *)top
{
    self.bgView.image = bgImage;
    self.topView.image = top;
}

- (void)setM_progress:(CGFloat)m_progress
{
    if (m_progress > 1.0 || m_progress < 0.0) {
        
        Log(@"超过范围了");
        return;
    }
    _m_progress = m_progress;
    CGRect topRect = self.topView.frame;
    topRect.size.width = CGRectGetWidth(self.frame) * m_progress;
    self.topView.frame = topRect;
}

- (void)setBgColor:(UIColor *)bgColor topColor:(UIColor *)topColor
{
    self.bgView.backgroundColor = bgColor;
    self.topView.backgroundColor = topColor;
}

@end
