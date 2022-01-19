//
//  MATableViewCell.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MATableViewCell.h"

@implementation MATableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews{
    
}

- (void)updateSubviews:(NSString *)operation value:(id)value{
    
}
@end
