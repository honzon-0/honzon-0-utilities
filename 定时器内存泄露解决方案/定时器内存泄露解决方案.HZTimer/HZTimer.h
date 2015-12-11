//
//  HZTimer.h
//  定时器内存泄露解决方案
//
//  Created by Honzon-0 on 15/12/10.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN


@interface HZTimer : NSObject
@property (nonatomic, copy) NSDate *fireDate;
@property (readonly) NSTimeInterval timeInterval;
@property (readonly, getter=isValid) BOOL valid;
@property (nullable, readonly, retain) id userInfo;

+ (HZTimer *)hzTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
+ (HZTimer *)hzScheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
- (void)fire;
- (void)invalidate;
@end


NS_ASSUME_NONNULL_END