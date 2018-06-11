//
//  TimerManager.h
//  seckill
//
//  Created by limingru on 2018/6/11.
//  Copyright © 2018 limingru. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const timerManagerNotify;

@interface TimerManager : NSObject
+(TimerManager *)manager;
-(void)start;
-(void)stop;
@end
