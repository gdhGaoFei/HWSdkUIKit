//
//  HMRefreshGifHeader.m
//  HWork
//
//  Created by 华&梅 on 2022/5/9.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMRefreshGifHeader.h"

@interface HMRefreshGifHeader ()
{
    __unsafe_unretained UIImageView *_gifView;
}

@end

@implementation HMRefreshGifHeader

#pragma mark - 懒加载
- (UIImageView *)gifView
{
    if (!_gifView) {
        UIImageView *gifView = [[UIImageView alloc] init];
        [self addSubview:_gifView = gifView];
    }
    return _gifView;
}

/// 初始化
- (void)prepare {
    [super prepare];
    //1.找到gif文件路径  loading 图片 loading_refresh
    NSString * dataPath = [[NSBundle mainBundle] pathForResource:@"loading_refresh" ofType:@"gif"];
    //NSData * data = [NSData dataWithContentsOfFile:dataPath];
    //UIImage * images = [UIImage sd_imageWithGIFData:data];
    //self.gifView.image = images;
    
    //2.获取gif文件数据
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:dataPath], NULL);
    //3.获取gif文件中图片的个数
    size_t count = CGImageSourceGetCount(source);
        
    //5.定义一个可变数组存放所有图片
    NSMutableArray * imageArray = [[NSMutableArray alloc] init];
     
    //遍历gif
    for (size_t i = 0; i<count; i++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        UIImage * imageName = [UIImage imageWithCGImage:image];
        [imageArray addObject:imageName];//存image
        CGImageRelease(image);
    }
    if (imageArray.count > 0) {
        self.gifView.animationImages = [imageArray copy];
        self.gifView.animationDuration = 1.5;
    }
    self.mj_h = 56.f;
}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    NSArray *images = self.gifView.animationImages;
    if (self.state != MJRefreshStateIdle || images.count == 0) return;
    // 停止动画
    [self.gifView stopAnimating];
    // 设置当前需要显示的图片
    NSUInteger index =  images.count * pullingPercent;
    if (index >= images.count) index = images.count - 1;
    self.gifView.image = images[index];
}

- (void)placeSubviews
{
    [super placeSubviews];
    if (self.gifView.constraints.count) return;
    CGFloat v_gif_wh = 25.f;
    self.gifView.frame = CGRectMake((self.mj_w-v_gif_wh)/2.f, (self.mj_h-v_gif_wh)/2.f, v_gif_wh, v_gif_wh);
}

- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        [self.gifView startAnimating];
    } else if (state == MJRefreshStateIdle) {
        [self.gifView stopAnimating];
    }
}

@end
