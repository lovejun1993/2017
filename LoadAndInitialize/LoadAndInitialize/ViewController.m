//
//  ViewController.m
//  LoadAndInitialize
//
//  Created by Rhino on 2016/11/7.
//  Copyright © 2016年 Rhino. All rights reserved.
//

#import "ViewController.h"
#import "SuperClass.h"
#import "OtherSuperClass.h"
#import "MainClass.h"
#import "AutoReleasePool.h"

#pragma mark - TEST 1
/**
 输出log信息:
 SuperClass +[SuperClass initialize]
 SuperClass +[SuperClass load]
 +[Insideinitialize load]
 
 分析:只要有引用runtime就会自动去调用类的 + (void)load 方法,SuperClass的+ (void)initialize也被调用了,而且是在+(void)load之前被执行,而Insideinitialize的+(void)initialize并没有执行,这是因为在SuperClass的+(void)load方法中,我们调用了类的class方法,[self class],+(void)initialize:在类的第一个方法被调用前调用,也说明runtime对+ (void)load的调用并不视为类的第一个方法.ChildClass没有用到,所以+(void)initialize的方法并没有被执行,而且它也没有去执行父类的+(void)load方法(虽然他有继承下该方法)
*/

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

#pragma mark - TEST 2 +(void)load和+(void)initialize可当做普通类方法(Class Method)被调用
    
//    [ChildClass load];
    
//    SuperClass       +[SuperClass initialize]
//    SuperClass       +[SuperClass load]
//                     +[Insideinitialize load]
    
//    ChildClass       +[ChildClass initialize]
//    Insideinitialize +[Insideinitialize initialize]
//    Insideinitialize -[Insideinitialize objectMethod]
//    ChildClass       +[SuperClass load]
    
//    前面三个结果跟之前一样，不过之后ChildClass的+(void)initialize也被自动执行调用，并且我们可以在其中安全创建出Insideinitialize类并使用它，而Insideinitialize因为调用alloc方法是第一次使用类方法， 所以激发了Insideinitialize的+(void)initialize。
//    
//    另一个方面，ChildClass继承下了+(void)load而且可以被安全地当做普通类方法(Class Method)被使用。这也就是load和initialize被调用一次是相对runtime而言（比如SuperClass的initialize不会因为自身load方法调用一次，又因为子类调用了load又执行一次），我们依然可以直接去反复调用这些方法。

#pragma mark - TEST 3 子类会调用父类的+(void)initialize
    //导入OtherSuperClass.h
//+(void)load会引起+(void)initialize。也很Apple文档中讲得那样，子类方法的调用会激起父类的+(void)initialize被执行。不过我们也看到虽然OtherChildClass没有定义+(void)initialize，但是它会使用父类的+(void)initialize。而之前的示例，我们看到子类并不会在runtime时去使用父类的+(void)load，也就是说只有新定义的+(void)load才会被runtime去调用执行。
    
//    OtherSuperClass +[OtherSuperClass initialize]
//    OtherChildClass +[OtherSuperClass initialize]
//    OtherChildClass +[OtherChildClass load]
 
#pragma mark- TEST 4 类别(Category)中的+(void)load的+(void)initialize
    //导入 #import "MainClass.h"
    
//    MainClass +[MainClass(OtherCategory) initialize]
//    MainClass +[MainClass load]
//    MainClass +[MainClass(Category) load]
//    MainClass +[MainClass(OtherCategory) load]
    
//    同样的+(void)initialize优先于+(void)load先执行。但是很明显的不同在于，只有最后一个类别(Category)的+(void)initialize执行，其他两个都被隐藏。而对于+(void)load，三个都执行，并且如果Apple的文档中介绍顺序一样：先执行类自身的实现，再执行类别(Category)中的实现。
    
#pragma mark - TEST 5 Runtime调用+(void)load时没有autorelease pool

#pragma mark - TEST 6 不需要显示使用super调用父类中的方法
//runtime对自动对父类的+(void)load方法进行调用，而+(void)initialize则会随子类自动激发父类的方法（如Apple文档中所言）不需要显示调用。另一方面，如果父类中的方法用到的self（像示例中的方法），其指代的依然是类自身，而不是父类。
    
//    总结：
//   -----------------------------------------------------------------------------------
//                                  |   +(void)load	          |   +(void)initialize
//    执行时机	                    |  在程序运行后立即执行	      |  在类的方法第一次被调时执行
//    若自身未定义，是否沿用父类的方法    |	     否	              |            是
//    类别中的定义	                    | 全都执行，但后于类中的方法	  |   覆盖类中的方法，只执行一个
//   -----------------------------------------------------------------------------------
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
