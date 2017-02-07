
//
//  SuperClass.m
//  LoadAndInitialize
//
//  Created by Rhino on 2016/11/7.
//  Copyright © 2016年 Rhino. All rights reserved.
//

#import "SuperClass.h"

@implementation SuperClass
+ (void)initialize{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

+ (void)load{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

@end

@implementation ChildClass

+ (void)initialize{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
    Insideinitialize *obj = [[Insideinitialize alloc]init];
    [obj objectMethod];
}
@end


@implementation Insideinitialize

- (void)objectMethod{
      NSLog(@" %@ %s",[self class],__FUNCTION__);
}

+ (void)initialize{
      NSLog(@" %@ %s",[self class],__FUNCTION__);
}

+ (void)load{
      NSLog(@" %s ",__FUNCTION__);
}

@end

