//
//  MAImageViewController.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MAImageViewController.h"
#import "MARequest.h"
#import <YYKit/UIImageView+YYWebImage.h>

@interface MAImageViewController ()

@end

@implementation MAImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.dav.name;
    [self setupSubviews];
    
    //图片显示
    NSMutableDictionary *imageHeaders =  [YYWebImageManager.sharedManager.headers mutableCopy];
    if(!imageHeaders){
        imageHeaders = [NSMutableDictionary dictionaryWithCapacity:2];
    }
    [imageHeaders setObject:[MARequest.center getAuthorization] forKey:@"Authorization"];
    YYWebImageManager.sharedManager.headers = imageHeaders;

    NSString *image = [[MARequest center] getURL:self.dav.path];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setImageWithURL:[NSURL URLWithString:image] placeholder:nil options:0 manager:nil progress:nil transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        NSLog(@"image-error:%@", error);
    }];
    [self.contentView addSubview:imageView];
}

@end
