
//
//  MainClass.m
//  LoadAndInitialize
//
//  Created by Rhino on 2016/11/7.
//  Copyright © 2016年 Rhino. All rights reserved.
//

#import "MainClass.h"

@implementation MainClass

+ (void)load{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

+ (void)initialize{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

@end

@implementation MainClass(Category)

+ (void)load{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

+ (void)initialize{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

@end

@implementation MainClass(OtherCategory)

+ (void)load{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

+ (void)initialize{
    NSLog(@" %@ %s",[self class],__FUNCTION__);
}

@end

