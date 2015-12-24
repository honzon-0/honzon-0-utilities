//
//  HZNotificationCenter.m
//  HZNotificationCenter
//
//  Created by  Honzon-0 on 15/12/23.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//


static const void *strongKey = @"strongKey";


#import "HZNotificationCenter.h"
#import <objc/runtime.h>
@interface HZNotification ()
@property (weak)id observer;
@property (nonatomic, strong)id observerTarget;
@property (nonatomic, strong)id object;
@property (readwrite, copy) NSString *name;
@property (nonatomic, assign)SEL selector;
@property (nullable, readwrite, copy) NSDictionary *userInfo;
@end

@implementation HZNotification

- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    self = [super init];
    if (self) {
        self.name = name;
        self.object = object;
        self.userInfo = userInfo;
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc{
    NSLog(@"HZNotification dealloc");
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"object:%@",self.object];
}

@end

@implementation HZNotification (HZNotificationCreation)

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject{
    return [[HZNotification alloc] initWithName:aName object:anObject userInfo:nil];
}
+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo{
    return [[HZNotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
}



@end

/****************	HZNotificationCenter	****************/
@interface HZNotificationCenter ()
@property (nonatomic, strong)NSMutableArray *observers;
@end

static HZNotificationCenter *notificationCenter = nil;
@implementation HZNotificationCenter

- (void)dealloc{
    
}


+(HZNotificationCenter *)defaultCenter{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notificationCenter = [[HZNotificationCenter alloc] init];
    });
    return notificationCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.observers = [NSMutableArray array];
    }
    return self;
}
//addObserver: selector: name: object:
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject{
    HZNotification *hzNotification = [[HZNotification alloc] initWithName:aName object:anObject userInfo:nil];
    hzNotification.observerTarget = [NSObject new];
    hzNotification.selector = aSelector;
    hzNotification.observer = observer;
    class_addMethod([hzNotification.observerTarget class], aSelector, (IMP)timeMethod, "v@:");
    objc_setAssociatedObject(hzNotification.observerTarget, strongKey, hzNotification, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(hzNotification,(__bridge void *)aName ,observer, OBJC_ASSOCIATION_ASSIGN);
//
    [self.observers addObject:hzNotification];
}

void timeMethod(id self, SEL _cmd){
    HZNotification *hzNotification = objc_getAssociatedObject(self, strongKey);
//    id  observer = objc_getAssociatedObject(hzNotification, (__bridge void *)hzNotification.name);
    [hzNotification.observer performSelector:_cmd withObject:hzNotification];
}

//postNotification:
- (void)postNotification:(HZNotification *)notification{
    
    [notification.observerTarget performSelector:notification.selector];
}
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject{
    if (aName) {
        for (HZNotification *hzNotification in self.observers) {
            if ([aName isEqualToString:hzNotification.name]) {
                hzNotification.object = anObject;
                [self postNotification:hzNotification];
            }
        }
    }
   
}

//postNotificationName: object: userInfo:
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo{
    for (HZNotification *hzNotification in self.observers) {
        if (aName && [aName isEqualToString:hzNotification.name]) {
            hzNotification.object = anObject;
            hzNotification.userInfo = aUserInfo;
            [self postNotification:hzNotification];
        }
    }
}

//removeObserver:
- (void)removeObserver:(id)observer{
    
    if (observer) {
#warning 此处涉及到一个突变问题 以我目前的能力 很难解决 只能暂时放在这里  等待以后再来解决
        for (HZNotification *hzNotification in self.observers) {
            id oldObserver = objc_getAssociatedObject(hzNotification, (__bridge void *)hzNotification.name);
            if (observer == oldObserver) {
                objc_removeAssociatedObjects(hzNotification.observerTarget);
                objc_removeAssociatedObjects(hzNotification);
                [self.observers removeObject:hzNotification];
            }
        }
    }
}

//removeObserver: name: object:
- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject{
    if (observer) {
        [self removeObserver:observer];
    }else if (aName){
        for (HZNotification *hzNotification in self.observers) {
            if ([aName isEqualToString:hzNotification.name]) {
                objc_removeAssociatedObjects(hzNotification.observerTarget);
                objc_removeAssociatedObjects(hzNotification);
                [self.observers removeObject:hzNotification];
            }
        }
    }
}

@end
