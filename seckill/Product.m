//
//  Product.m
//  seckill
//
//  Created by limingru on 2018/6/11.
//  Copyright © 2018 limingru. All rights reserved.
//

#import "Product.h"

@implementation Product
+(NSMutableArray<Product *>*)demoProducts {
    NSMutableArray<Product *> *arrs = [NSMutableArray new];
    for (NSInteger i=0; i<1000; i++) {
        Product *p = [Product new];
        p.name = [NSString stringWithFormat:@"PRODUCT%ld",(i+1)];
        float secs = arc4random() % 100;
        NSDate *date = [[NSDate alloc]initWithTimeIntervalSinceNow:secs];
        p.endTime = date.timeIntervalSinceReferenceDate;
        [arrs addObject:p];
    }
    return arrs;
}
@end
