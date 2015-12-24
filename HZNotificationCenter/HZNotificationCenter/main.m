//
//  main.m
//  HZNotificationCenter
//
//  Created by Honzon-0 on 15/12/23.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZNotificationCenter.h"
@interface HZNotificationCenterSender : NSObject

@end

@implementation HZNotificationCenterSender

- (instancetype)initWithHZNotificationCenter
{
    self = [super init];
    if (self) {
        [[HZNotificationCenter defaultCenter] postNotificationName:@"HZNotification" object:@"HZNotification success"];
    }
    return self;
}

- (instancetype)initWithNSNotificationCenter
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NSNotification" object:@"NSNotification success"];
    }
    return self;
}

@end


@interface HZNotificationCenterReceiver : NSObject


@end

@implementation HZNotificationCenterReceiver

- (instancetype)initWithHZNotificationCenter
{
    self = [super init];
    if (self) {
        [[HZNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveHZNotification:) name:@"HZNotification" object:nil];
    }
    return self;
}

- (void)receiveHZNotification:(HZNotification *)hzNotification{
    id object = [hzNotification object];
    id userInfo = [hzNotification userInfo];
    NSLog(@"hzNotification object:   %@", object);
    NSLog(@"hzNotification userInfo: %@", userInfo);
}

- (instancetype)initWithNSNotificationCenter
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNSNotification:) name:@"NSNotification" object:nil];
    }
    return self;
}

- (void)receiveNSNotification:(NSNotification *)nsNotification{
    id object = [nsNotification object];
    id userInfo = [nsNotification userInfo];
    NSLog(@"nsNotification object:   %@", object);
    NSLog(@"nsNotification userInfo: %@", userInfo);
}

- (void)dealloc
{
    [[HZNotificationCenter defaultCenter] removeObserver:self];
}


@end

@interface HZNotificationCenterReceiver2 : NSObject


@end

@implementation HZNotificationCenterReceiver2

- (instancetype)initWithHZNotificationCenter
{
    self = [super init];
    if (self) {
        [[HZNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveHZNotification:) name:@"HZNotification" object:nil];
    }
    return self;
}

- (void)receiveHZNotification:(HZNotification *)hzNotification{
    id object = [hzNotification object];
    id userInfo = [hzNotification userInfo];
    NSLog(@"hzNotification2 object:   %@", object);
    NSLog(@"hzNotification2 userInfo: %@", userInfo);
}

- (instancetype)initWithNSNotificationCenter
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNSNotification:) name:@"NSNotification" object:nil];
    }
    return self;
}

- (void)receiveNSNotification:(NSNotification *)nsNotification{
    id object = [nsNotification object];
    id userInfo = [nsNotification userInfo];
    NSLog(@"nsNotification2 object:   %@", object);
    NSLog(@"nsNotification2 userInfo: %@", userInfo);
}

- (void)dealloc
{
//    [[HZNotificationCenter defaultCenter] removeObserver:self];
}


@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {

        HZNotificationCenterReceiver2 *hzReceiver2 =  [[HZNotificationCenterReceiver2 alloc] initWithHZNotificationCenter];
        HZNotificationCenterReceiver *hzReceiver =  [[HZNotificationCenterReceiver alloc] initWithHZNotificationCenter];
//        HZNotificationCenterReceiver2 *hzReceiver2 =  [[HZNotificationCenterReceiver2 alloc] initWithHZNotificationCenter];
        HZNotificationCenterSender *hzSender =   [[HZNotificationCenterSender alloc] initWithHZNotificationCenter];
        
//        HZNotificationCenterReceiver *nsReceiver =  [[HZNotificationCenterReceiver alloc] initWithNSNotificationCenter];
//        HZNotificationCenterReceiver2 *nsReceiver2 =  [[HZNotificationCenterReceiver2 alloc] initWithNSNotificationCenter];
//        HZNotificationCenterSender *nsSender =   [[HZNotificationCenterSender alloc] initWithNSNotificationCenter];
        
    }
    return 0;
}
