//
//  NXBlock.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/24.
//

#import "NXBlock.h"

struct Block_byrefValue {
//    struct Block_byref_localValue *forward;
    int localValue;
};

@interface NXBlock()
@property (nonatomic, retain) NSString *value;
@end

@implementation NXBlock
- (void)dealloc {
    NSLog(@"NXBlock-dealloc");
    [super dealloc];
}

- (void)main{
    [self t6];
}

//- (void)t1{
//    int localValue = 10;
//    void(^noneBlock)(void) = ^(){
//        NSLog(@"localValue=%d", localValue);
//    };
//    noneBlock();
//}

- (void)t3{
//    {
//        int localValue = 10;
//        void(^withBlock)(void) = ^(){
//            NSLog(@"localValue=%d", localValue);
//        };
//        withBlock();
//    }
//    
//    {
//        __block int localValue = 10;
//        void(^withBlock)(void) = ^(){
//            NSLog(@"localValue=%d", localValue);
//        };
//        withBlock();
//    }
//
//    {
//        static int localValue = 10;
//        void(^withBlock)(void) = ^(){
//            NSLog(@"localValue=%d", localValue);
//        };
//        withBlock();
//    }
    
//    {
//        NSString *localValue = @"MyValue";
//        NSLog(@"self:%d;weakself:%d", [self retainCount],[weakself retainCount]);
//        void(^withBlock)(void) = ^(){
//            NSLog(@"localValue=%@", localValue);
//        };
//        withBlock();
//        NSLog(@"self:%d;weakself:%d", [self retainCount],[weakself retainCount]);
//    }
}

//- (void)t3{
//    __block int localValue = 10;
//    NSString *(^stackBlock)(void) = ^NSString *(){
//        return [NSString stringWithFormat:@"&localValue=%p", &localValue];
//    };
//    NSLog(@"拷贝前:%@-%@", stackBlock, stackBlock());
//    NSString *(^mallocBlock)(void) = [stackBlock copy];
//    NSLog(@"拷贝后:%@-%@", stackBlock, stackBlock());
//    NSLog(@"拷贝后:%@-%@", mallocBlock, mallocBlock());
//}
//
//- (void)t4{
//    self.value = @"value";
//    NSLog(@"self:%d", [self retainCount]);
//    NXBlock *weakself = [self retain];
//    NSLog(@"self:%d;weakself:%d", [self retainCount],[weakself retainCount]);
////    void(^stackBlock)(void) = ^(){
////        NSLog(@"weakself:%d", [weakself retainCount]);
////    };
////    stackBlock();
////    NSLog(@"self:%d;weakself:%d", [self retainCount],[weakself retainCount]);
//}

- (void)t5{
//    _assginvalue = 25;
//    void(^noneBlock)(void) = ^(){
//        NSLog(@"localValue=%d", _assginvalue);
//        _assginvalue = 3;
//    };
//    noneBlock();
//    NSLog(@"localValue=%d", _assginvalue);
//    _assginvalue = 38;
//    noneBlock();
}

- (void)t6{
    NSObject *obj = [[NSObject alloc] init];
    [obj retain];
    
}

@end
