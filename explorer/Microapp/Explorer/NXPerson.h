//
//  NXPerson.h
//  Microapp
//
//  Created by 聂高涛 on 2021/12/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol NXPersonDelegate <NSObject>
- (void)eat;
@end

@interface NXPerson : NSObject {
    NSInteger _uuid;
}
@property (nonatomic, copy) NSString *name;
- (void)run;

- (void)func1;
- (void)func2;
- (void)func3;
- (void)func4;
- (void)func5;
- (void)func6;
- (void)func7;
- (void)func8;
@end

NS_ASSUME_NONNULL_END
