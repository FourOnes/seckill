//
//  TimerManager.m
//  seckill
//
//  Created by limingru on 2018/6/11.
//  Copyright © 2018 limingru. All rights reserved.
//

#import "TimerManager.h"

static TimerManager *staticTimeManager;
NSString * const timerManagerNotify = @"com.limingru.timermanager";

@interface TimerManager()
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation TimerManager
+(TimerManager *)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticTimeManager = [TimerManager new];
    });
    return staticTimeManager;
}
-(void)start {
    if (self.timer) return;
    self.timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)stop {
    [self.timer invalidate];
    self.timer.fireDate = [NSDate distantFuture];
    self.timer = nil;
}

-(void)timerAction {
    NSLog(@"TimerManager timerAction");
    [[NSNotificationCenter defaultCenter] postNotificationName:timerManagerNotify object:nil];
}
@end
