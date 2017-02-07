
//
//  AutoReleasePool.m
//  LoadAndInitialize
//
//  Created by Rhino on 2016/11/7.
//  Copyright © 2016年 Rhino. All rights reserved.
//

#import "AutoReleasePool.h"

@implementation AutoReleasePool

+ (void)load{
    NSArray *array = [NSArray array];
    NSLog(@" %@ %s",array,__FUNCTION__);
}

@end
