//
//  MATester.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/24.
//

#import "MATester.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

extern uintptr_t objc_debug_taggedpointer_obfuscator;

@interface MATester()
@property(nonatomic, strong) NSMutableArray *array;
@end

@implementation MATester

+ (instancetype)center{
    static dispatch_once_t once;
    static MATester *__center;
    dispatch_once(&once, ^{
        __center = [[MATester alloc] init];
    });
    return __center;
}

- (void)main{
    [self test11];
}

- (void)test1{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        /*async没有开启新线程，以下代码在主线程中运行*/
        NSLog(@"开始:%@", [NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"sync:%@", [NSThread currentThread]);
        });
        NSLog(@"结束:%@", [NSThread currentThread]);
    });
}

- (void)test2{
    dispatch_queue_t queue = dispatch_queue_create("com.app.serial", 0);
    dispatch_async(queue, ^{
        /*async开启1条新线程，以下代码在子线程中运行*/
        NSLog(@"开始:%@", [NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"sync:%@", [NSThread currentThread]);
        });
        NSLog(@"结束:%@", [NSThread currentThread]);
    });
}

- (void)test3{
    NSLog(@"开始:%@", [NSThread currentThread]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), dispatch_get_main_queue(), ^{
        NSLog(@"after:%@", [NSThread currentThread]);
    });
}

- (void)test4{
    dispatch_queue_t queue = dispatch_queue_create("com.app.concurrent", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        sleep(1);
//        NSLog(@"1:%@", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        sleep(1);
//        NSLog(@"2:%@", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        sleep(1);
//        NSLog(@"3:%@", [NSThread currentThread]);
//    });
//    NSLog(@"0-0:%@",[NSThread currentThread]);
//
//    //dispatch_barrier_async或dispatch_barrier_sync
//    dispatch_barrier_sync(queue, ^{
//        sleep(1);
//        NSLog(@"barrier:%@", [NSThread currentThread]);
//    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"4:%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        sleep(1);
        NSLog(@"5:%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"6:%@", [NSThread currentThread]);
    });
    NSLog(@"0-1:%@",[NSThread currentThread]);
}


- (void)test5{
    MATester *d1 = [MATester center];
    MATester *d2 = [MATester center];
    if(d1 == d2){
        NSLog(@"d1==d2");
    }
}

- (void)test6{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.app.concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i= 0; i < 10; i++){
        dispatch_group_enter(group);
        dispatch_async(queue, ^{
            NSLog(@"%d:%@", i, [NSThread currentThread]);
            dispatch_group_leave(group);
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"结束:%@", [NSThread currentThread]);
    });
}

- (void)test7{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.app.concurrent", DISPATCH_QUEUE_CONCURRENT);

    for (int i= 0; i < 10; i++){
        dispatch_group_async(group, queue, ^{
            NSLog(@"%d:%@", i, [NSThread currentThread]);
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"结束:%@", [NSThread currentThread]);
    });
}

- (void)test8{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.app.concurrent", DISPATCH_QUEUE_CONCURRENT);

    for (int i= 0; i < 10; i++){
        dispatch_group_async(group, queue, ^{
            sleep(2);
            NSLog(@"%d:%@", i, [NSThread currentThread]);
        });
    }
    //dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*2)
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"结束:%@", [NSThread currentThread]);
}

- (void)test9{
    for(NSInteger i = 0; i < 20000; i++){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            _array = [NSMutableArray array];
        });
    }
}

- (void)test10 {
//    NSLock *lock = [NSLock new];
//    for(NSInteger i = 0; i < 10; i++){
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            static void (^testmethod)(int);
//            testmethod = ^(int value){
//                if(value > 0){
//                    NSLog(@"value=%d", value);
//                    testmethod(value-1);
//                }
//            };
//
//            [lock lock];
//            testmethod(10);
//            [lock unlock];
//        });
//    }
    
//    NSRecursiveLock *recursiveLock = [NSRecursiveLock new];
//    for(NSInteger i = 0; i < 10; i++){
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            static void (^testmethod)(int);
//            testmethod = ^(int value){
//                if(value > 0){
//                    NSLog(@"value=%d", value);
//                    testmethod(value-1);
//                }
//            };
//
//            [recursiveLock lock];
//            testmethod(10);
//            [recursiveLock unlock];
//        });
//    }
    
//    NSConditionLock *conditionLock = [[NSConditionLock alloc] initWithCondition:2];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [conditionLock lockWhenCondition:2];
//        NSLog(@"------");
//        [conditionLock unlockWithCondition:2];
//        [conditionLock unlockWithCondition:1];
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [conditionLock lockWhenCondition:1];
//        NSLog(@"------");
//        [conditionLock unlockWithCondition:1];
//    });
}

- (void)test11{
    //NSObject-NSString->NSMutableString->__NSCFString->__NSCFConstantString
    //NSObject-NSString->NSTaggedPointerString
NSString *str1 = @"abcd";
NSString *str2 = [[NSString alloc] initWithString:str1];
NSString *str3 = [[NSString alloc] initWithFormat:@"%@", str1];
NSString *str4 = [[NSString alloc] initWithFormat:@"%@-%@-%@", str1,str1,str1];
NSLog(@"str1=%@, ptr=%p, class=%@;", str1, str1, [str1 class]);
NSLog(@"str2=%@, ptr=%p, class=%@;", str2, str2, [str2 class]);
NSLog(@"str3=%@, ptr=%p, class=%@;", str3, str3, [str3 class]);
NSLog(@"str4=%@, ptr=%p, class=%@;", str4, str4, [str4 class]);
    
#ifdef __x86_64__
    //a:   b1=0x0;b2=0x0;b3=0x0;b4=0x0;b5=0x0;b6=0x0;b7=0x61;
    //ab:  b1=0x0;b2=0x0;b3=0x0;b4=0x0;b5=0x0;b6=0x62;b7=0x61;
    //abcgefg:b1=0x67;b2=0x66;b3=0x65;b4=0x64;b5=0x63;b6=0x62;b7=0x61;
    //abcdefgh:b1=0x0;b2=0x22;b3=0x3;b4=0x8a;b5=0x1;b6=0x16;b7=0x95;
    id value = [NSString stringWithFormat:@"abcd"];
    uintptr_t ptrValue = objc_decodeTaggedPointer((__bridge const void * _Nullable)(value));
    NSLog(@"%p-%@-%@;0x%lx", value, value, [(NSObject *)value class], ptrValue);
    
    //x86-64:高4位时：最高位1表示tagpointer 其余三位表示数据类型， 2-NSString， 3-NSNumber，....
    uintptr_t left4 = ptrValue >> 60;
    uintptr_t right4 = ptrValue << 60 >> 60;

    NSLog(@"left4=0x%lx;right4=0x%lx;isTaggedPointer:%d,type=%d", left4, right4, left4>>3, left4<<1>>3);

    uintptr_t b1 = ptrValue << 4 >> 56;
    uintptr_t b2 = ptrValue << 12 >> 56;
    uintptr_t b3 = ptrValue << 20 >> 56;
    uintptr_t b4 = ptrValue << 28 >> 56;
    uintptr_t b5 = ptrValue << 36 >> 56;
    uintptr_t b6 = ptrValue << 44 >> 56;
    uintptr_t b7 = ptrValue << 52 >> 56;
    NSLog(@"b1=0x%lx;b2=0x%lx;b3=0x%lx;b4=0x%lx;b5=0x%lx;b6=0x%lx;b7=0x%lx;", b1, b2, b3, b4, b5, b6, b7);
#endif

#ifdef __arm64__
    //arm64:最高位是否为taggedpointer，最低三位是类型 1 60 3
    //2-字符串类型：从7-4 表示字符串长度
    //3-number类型：从7-4表示number内部的类型 char：0， short：1， int：2， long：3， float：4， double：5
    //4:NSIndexPath：
    //5:
    //6:
    //7-date类型：
    NSMutableArray *tgs = [NSMutableArray arrayWithCapacity:6];
    [tgs addObject:[NSString stringWithFormat:@"abcd"]];
    [tgs addObject:[NSString stringWithFormat:@"abcdefg"]];
    [tgs addObject:[NSNumber numberWithChar:1]];
    [tgs addObject:[NSNumber numberWithShort:3]];
    [tgs addObject:[NSNumber numberWithInt:7]];
    [tgs addObject:[NSNumber numberWithLong:1]];
    [tgs addObject:@(5.2)];
    [tgs addObject:@(5.7654321)];
    [tgs addObject:[[NSIndexPath alloc] initWithIndex:5]];
    [tgs addObject:[NSDate date]];
    //[tgs addObject:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    for (NSObject *objValue in tgs){
        uintptr_t ptrValue = objc_decodeTaggedPointer((__bridge const void * _Nullable)(objValue));
        NSLog(@"%p-%@-%@;0x%lx", objValue, objValue, [objValue class], ptrValue);
//        uintptr_t isTaggedPointer = ptrValue >> 63;
//        uintptr_t infoValue = ptrValue << 57 >> 57;
//        uintptr_t type = infoValue & 7;
//        uintptr_t length = infoValue >> 3;
//        uintptr_t playload = ptrValue << 1 >> 7;
//        NSLog(@"0x%lx-0x%lx-type=0x%lx-length=0x%lx-playload=0x%lx", isTaggedPointer, infoValue, type, length, playload);
    }
#endif
}

static inline uintptr_t objc_decodeTaggedPointer(const void * _Nullable ptr){
    return (uintptr_t)ptr ^ objc_debug_taggedpointer_obfuscator;
}

static inline void * _Nonnull objc_encodeTaggedPointer(uintptr_t ptr){
    uintptr_t value = (objc_debug_taggedpointer_obfuscator ^ ptr);
    return (void *)value;
}

@end
