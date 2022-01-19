//
//  MAViewController.h
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAViewController : UIViewController
@property (nonatomic, strong) UIView *contentView;

- (void)setupSubviews;
- (void)updateSubviews:(NSString *)operation value:(id)value;
@end

NS_ASSUME_NONNULL_END
