//
//  MACollection.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MACollection.h"

@implementation MAArray
- (instancetype)init {
    if(self = [super init]){
        self.semaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)addObject:(id)anObject {
    dispatch_semaphore_wait(self.semaphore, dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1));
    [super addObject:anObject];
    dispatch_semaphore_signal(self.semaphore);
}

- (NSUInteger)count {
    dispatch_semaphore_wait(self.semaphore, dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1));
    NSUInteger _count = [super count];
    dispatch_semaphore_signal(self.semaphore);
    return _count;
}
@end


@implementation MARect

@end


@implementation MAElement
- (instancetype)init {
    if(self = [super init]){
        self.ctxs = [[MARect alloc] init];
    }
    return self;
}
@end

@implementation MACollection
- (instancetype)init {
    if(self = [super init]){
        self.elements = [NSMutableArray arrayWithCapacity:2];
    }
    return self;
}

- (id)elementAtIndex:(NSInteger)index{
    if (index >= 0 && index < self.elements.count){
        id __element = self.elements[index];
        if(__element && [__element isKindOfClass:[MAElement class]]){
            return (MAElement *)__element;
        }
    }
    return nil;
}

- (id)elementAtIndexPath:(NSIndexPath *)indexPath{
    id __collection = [self elementAtIndex:indexPath.section];
    if(__collection && [__collection isKindOfClass:[MACollection class]]){
        return [(MACollection *)__collection elementAtIndex:indexPath.row];
    }
    return nil;
}
@end
