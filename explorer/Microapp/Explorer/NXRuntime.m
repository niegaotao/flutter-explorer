//
//  NXRuntime.m
//  Microapp
//
//  Created by 聂高涛 on 2021/12/10.
//

#import "NXRuntime.h"
#import "NXPerson.h"
#import <objc/message.h>

struct NX_bucket {
    SEL _sel;
    IMP _imp;
};

struct NX_cache {
    struct NX_bucket *_buckets;
    uint32_t    _maybeMask;
    uint16_t    _flags;
    uint16_t    _occupied;
};

struct NX_bits {
    uintptr_t bits;
};

struct NX_objc_class {
    Class isa;
    Class superclass;
    struct NX_cache cache;
    struct NX_bits bits;
};



@interface NXWorker : NSObject
- (void)t1;
- (void)t2;
- (void)t3;
- (void)t4;
- (void)t5;
- (void)t6;
- (void)t7;
- (void)t8;
@end

@implementation NXWorker
- (void)t1{NSLog(@"%s",__func__);}
- (void)t2{NSLog(@"%s",__func__);}
- (void)t3{NSLog(@"%s",__func__);}
- (void)t4{NSLog(@"%s",__func__);}
- (void)t5{NSLog(@"%s",__func__);}
- (void)t6{NSLog(@"%s",__func__);}
- (void)t7{NSLog(@"%s",__func__);}
- (void)t8{NSLog(@"%s",__func__);}
@end
/*
 alloc+[NXWorker class]
 _maybeMask=0,_flags=32784,_occupied=0
 [__w t1]:_maybeMask=3,_flags=32784,_occupied=1
                                index=0, t1, 0x1fb90
 [__w t1/t2]:_maybeMask=3,_flags=32784,_occupied=2
                                index=0, t1, 0x11b88
                                index=1, (null), 0x0
 [__w t1/t2/t3]:_maybeMask=7,_flags=32784,_occupied=1
                                index=0, (null), 0x0
 [__w t1/t2/t3/t4]:_maybeMask=7,_flags=32784,_occupied=2
                            index=0, (null), 0x0
                            index=1, t3, 0x11a50
 [__w t1/t2/t3/t4/t5]:_maybeMask=7,_flags=32784,_occupied=3
                             index=0, t5, 0x31a08
                             index=1, t3, 0x31a68
                             index=2, (null), 0x0
 [__w t1/t2/t3/t4/t5/t6]:_maybeMask=7,_flags=32784,_occupied=4
                             index=0, t5, 0x3fae0
                             index=1, t3, 0x3fa80
                             index=2, t6, 0x3fa10
                             index=3, (null), 0x0
 [__w t1/t2/t3/t4/t5/t6/t7]:_maybeMask=7,_flags=32784,_occupied=5
                             index=0, t5, 0x2fad8
                             index=1, t3, 0x2fb78
                             index=2, t6, 0x2fa08
                             index=3, (null), 0x0
                             index=4, t4, 0x2faa8
 [__w t1/t2/t3/t4/t5/t6/t7/t8]:_maybeMask=15,_flags=32784,_occupied=1
                            index=0, (null), 0x0
 
 
*/

@implementation NXRuntime
- (void)main{
//    NXWorker *__w = [NXWorker alloc];
//    [__w t1];
//    [__w t2];
//    [__w t3];
//    [__w t4];
//    [__w t5];
//    [__w t6];
//    [__w t7];
//    [__w t8];
//
//    struct NX_objc_class *__class = (__bridge struct NX_objc_class *)[NXWorker class];
//    NSLog(@"_maybeMask=%d,_flags=%d,_occupied=%d", __class->cache._maybeMask, __class->cache._flags,__class->cache._occupied);
//    for (int i = 0; i < __class->cache._occupied; i++){
//        struct NX_bucket bucket = __class->cache._buckets[i];
//        NSLog(@"index=%d, %@, %p", i, NSStringFromSelector(bucket._sel), bucket._imp);
//    }
    
    [self test];
}


- (void)test{
//    //将类对象强制转换成我们自定义的结构体。
//    struct NX_objc_class *__class = (__bridge  struct NX_objc_class *)[NXPerson class];
//    
//    //创建一个实例对象，后面会使用该实例对象调用实例方法。这里没有执行init方法，是为了排除init方法的干扰,init也会进行缓存。
//    NXPerson *p = [NXPerson alloc];
//    //顺序调用如下方法，每调用一个方法都打印一下当前的_maybeMask(当前开辟的内存容量大小)和_occupied(已占用的个数)
//    NSArray *funcs = @[@"func1", @"func2", @"func3", @"func4", @"func5", @"func6", @"func7", @"func8"];
//    for(int i = 0; i < funcs.count; i++){
//        NSString *func = funcs[i];
//        //调用方法。这里没有使用performSelector方法，是为了排除performSelector的干扰，performSelector也会进行缓存。
//        objc_msgSend(p, NSSelectorFromString(func));
//        //打印_maybeMask、_occupied
//        NSLog(@"\n\nfunc=%@;_maybeMask=%d;_occupied=%d", func, __class->cache._maybeMask, __class->cache._occupied);
//        //一次打印_buckets中的信息
//        for (int i = 0; i < __class->cache._maybeMask; i++){
//            struct NX_bucket bucket = __class->cache._buckets[i];
//            NSLog(@"index:%d,_sel=%@,_imp=%p", i,NSStringFromSelector(bucket._sel), bucket._imp);
//        }
//    }
}

- (void)runloop {
    NSRunLoop *current = [NSRunLoop currentRunLoop];
    CFRunLoopRun();
}
@end
