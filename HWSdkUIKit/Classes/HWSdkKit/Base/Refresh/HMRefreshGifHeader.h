//
//  HMRefreshGifHeader.h
//  HWork
//
//  Created by 华&梅 on 2022/5/9.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#if __has_include(<MJRefresh/MJRefresh-umbrella.h>)
#import <MJRefresh/MJRefresh-umbrella.h>
#else
#import "MJRefresh.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HMRefreshGifHeader : MJRefreshHeader

/// 加载动画的视图
@property (weak, nonatomic, readonly) UIImageView * gifView;

@end

NS_ASSUME_NONNULL_END
