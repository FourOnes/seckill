//
//  Product.h
//  seckill
//
//  Created by limingru on 2018/6/11.
//  Copyright © 2018 limingru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
+(NSMutableArray<Product *> *)demoProducts;
@property(nonatomic,copy)NSString *name;
@property(nonatomic)NSTimeInterval endTime;
@end
