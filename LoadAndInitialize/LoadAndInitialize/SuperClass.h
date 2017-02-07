//
//  SuperClass.h
//  LoadAndInitialize
//
//  Created by Rhino on 2016/11/7.
//  Copyright © 2016年 Rhino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperClass : NSObject

@end

@interface ChildClass : SuperClass

@end

@interface Insideinitialize : NSObject

- (void)objectMethod;

@end

