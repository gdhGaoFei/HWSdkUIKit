//
//  HMRefreshGifFooter.m
//  HWork
//
//  Created by 华&梅 on 2022/5/9.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMRefreshGifFooter.h"

@implementation HMRefreshGifFooter

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
        UIImage * imageName=[UIImage imageWithCGImage:image];
        [imageArray addObject:imageName];//存image
        CGImageRelease(image);
    }
    if (imageArray.count > 0) {
        double duration = 1.5;
        NSArray * images = [imageArray copy];
        [self setImages:images duration:duration forState:(MJRefreshStatePulling)];
        [self setImages:images duration:duration forState:(MJRefreshStateRefreshing)];
        [self setImages:images duration:duration forState:(MJRefreshStateWillRefresh)];
        [self setImages:images duration:duration forState:(MJRefreshStateIdle)];
    }
    
    [self setTitle:@"上拉看看吧～" forState:(MJRefreshStateIdle)];
    [self setTitle:@"上拉看看吧～" forState:(MJRefreshStatePulling)];
    
    self.mj_h = 56.f;
}


- (void)placeSubviews {
    [super placeSubviews];
    
    if (self.gifView.constraints.count) return;
    
    // gifView的x
    CGFloat v_gif_x = 0.f;
    CGFloat v_gif_w_h = 20.f;
    CGFloat v_gif_y = (self.mj_h-v_gif_w_h)/2.f;
    //self.gifView.frame = self.bounds;
    if (self.stateLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
        v_gif_x = (self.mj_w-v_gif_w_h)/2.f;
    } else {
        self.gifView.contentMode = UIViewContentModeScaleAspectFit;
        v_gif_x = (self.mj_w-self.stateLabel.mj_textWidth)/2.0f-v_gif_w_h-10.f;
    }
    
    /// 设置gifView的frame
    self.gifView.frame = CGRectMake(v_gif_x, v_gif_y, v_gif_w_h, v_gif_w_h);
}

@end
