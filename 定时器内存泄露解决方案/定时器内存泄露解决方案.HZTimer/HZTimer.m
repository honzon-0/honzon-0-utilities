//
//  HZTimer.m
//  定时器内存泄露解决方案
//
//  Created by Honzon-0 on 15/12/10.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import "HZTimer.h"
#import <objc/runtime.h>

static const void *strongKey = @"hzTimeStrongKey";
static const void *weakKey = @"hzTimeWeakKey";


@interface HZTimer ()
@property (nonatomic,strong) id timerTarget;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak)id aTarget;
@end

@implementation HZTimer
@synthesize fireDate = _fireDate;

-(NSDate *)fireDate{
    return self.timer.fireDate;
}
-(void)fireDate:(NSDate *)fireDate{
    if (![fireDate isEqualToDate:self.timer.fireDate]) {
        self.timer.fireDate = fireDate;
    }
}


-(NSTimeInterval)timeInterval{
    return self.timer.timeInterval;
}

-(BOOL)valid{
    return self.timer.valid;
}

-(id)userInfo{
    return self.timer.userInfo;
}

- (instancetype)initWithTarget:(id)aTarget selector:(nonnull SEL)aSelector
{
    self = [super init];
    if (self) {
        self.timerTarget = [NSObject new];
        self.aTarget = aTarget;
        class_addMethod([self.timerTarget class],aSelector,(IMP)timeMethod,"v@:");//创建计时器target对象为_timerTarget
    }
    return self;
}

+ (HZTimer *)hzScheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    HZTimer *hzTimer = [HZTimer hzTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    [hzTimer fire];
    return hzTimer;
}
+ (HZTimer *)hzTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    HZTimer *hzTimer = [[HZTimer alloc] initWithTarget:aTarget selector:aSelector];
    hzTimer.timer = [NSTimer timerWithTimeInterval:ti target:hzTimer.timerTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    [[NSRunLoop currentRunLoop] addTimer:hzTimer.timer forMode:NSRunLoopCommonModes];
    return hzTimer;
}
- (void)fire{
    NSTimer *timer = objc_getAssociatedObject(_timerTarget, strongKey);
    if (!timer) {
        //将self对象与NSTimer对象与_timerTarget对象关联
        objc_setAssociatedObject(self.timerTarget, strongKey, self.timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self.timerTarget, weakKey, self, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (void)invalidate{
    NSTimer *timer = objc_getAssociatedObject(_timerTarget, strongKey);
    if (timer) {
        objc_removeAssociatedObjects(self.timerTarget);
    }
    [self.timer invalidate];
}

void timeMethod(id self, SEL _cmd){
    HZTimer *hztimer =  objc_getAssociatedObject(self, weakKey);
    [hztimer.aTarget performSelector:_cmd withObject:hztimer];
}

- (void)dealloc
{
    NSTimer *timer = objc_getAssociatedObject(_timerTarget, strongKey);
    if (timer) {
        objc_removeAssociatedObjects(self.timerTarget);
    }
    [timer invalidate];
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}



@end
