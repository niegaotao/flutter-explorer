//
//  MAAudioViewController.h
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MAViewController.h"
#import "MADAV.h"

NS_ASSUME_NONNULL_BEGIN

@interface MAAudioViewController : MAViewController
@property (nonatomic, strong) MADAV *dav;
@property (nonatomic, strong) NSMutableArray *elements;
@end

NS_ASSUME_NONNULL_END
