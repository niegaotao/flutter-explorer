//
//  MACollection.h
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface MAArray : NSMutableArray
@property (nonatomic) dispatch_semaphore_t semaphore;
@end



@interface MARect : NSObject {
    CGRect _frame;
}
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@end


@interface MAElement : NSObject
@property (nonatomic, strong) MARect *ctxs;
@end


@interface MACollection : MAElement
@property (nonatomic, strong) NSMutableArray <NSObject *> *elements;
- (id)elementAtIndex:(NSInteger)index;
- (id)elementAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
