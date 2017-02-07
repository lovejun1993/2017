//
//  OtherSuperClass.m
//  LoadAndInitialize
//
//  Created by Rhino on 2016/11/7.
//  Copyright © 2016年 Rhino. All rights reserved.
//

#import "OtherSuperClass.h"

@implementation OtherSuperClass

+ (void)initialize{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

@end

@implementation OtherChildClass

+ (void)load{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

@end

