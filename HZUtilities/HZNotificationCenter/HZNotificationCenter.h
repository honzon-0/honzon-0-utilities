//
//  HZNotificationCenter.h
//  HZNotificationCenter
//
//  Created by Honzon-0 on 15/12/23.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

/****************	Notifications	****************/

@interface HZNotification : NSObject

@property (readonly, copy) NSString *name;
@property (nullable, readonly, retain) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

- (instancetype)initWithName:(NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;
@end

@interface HZNotification (HZNotificationCreation)

+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject;
+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (instancetype)init /*NS_UNAVAILABLE*/;	/* do not invoke; not a valid initializer for this class */

@end

@interface HZNotificationCenter : NSObject
+ (HZNotificationCenter *)defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;

- (void)postNotification:(HZNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject;
@end
NS_ASSUME_NONNULL_END