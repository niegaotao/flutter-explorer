//
//  NXAsyncableLabel.m
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2022/1/14.
//

#import "NXAsyncableLabel.h"
#include <CoreText/CoreText.h>

@implementation NXAsyncableLayer
- (void)setNeedsDisplay {
    NSLog(@"%s", __func__);
    [super setNeedsDisplay];
}

- (void)display {
    NSLog(@"%s", __func__);
    [super display];
}

- (void)drawInContext:(CGContextRef)ctx {
    NSLog(@"%s", __func__);
    [super drawInContext:ctx];
}

- (void)renderInContext:(CGContextRef)ctx{
    NSLog(@"%s", __func__);
    [super renderInContext:ctx];
}
@end


@implementation NXAsyncableLabel
- (void)setNeedsDisplay {
    NSLog(@"%s", __func__);
    [super setNeedsDisplay];
}

- (void)setNeedsDisplayInRect:(CGRect)rect{
    NSLog(@"%s", __func__);
    [super setNeedsDisplayInRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"%s", __func__);
    [super drawLayer:layer inContext:ctx];
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%s", __func__);
    [super drawRect:rect];
}

//- (void)displayLayer:(CALayer *)layer {
//    NSLog(@"%s", __func__);
//    CGSize size = self.frame.size;
//    CGFloat scale = UIScreen.mainScreen.scale;
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//       //1.异步绘制，切换至子线程
//       UIGraphicsBeginImageContextWithOptions(size, NO, scale);
//       //2.获取当前上下文
//       CGContextRef context = UIGraphicsGetCurrentContext();
//       //3.进行异步绘制（略）
//       //4.生成位图
//       UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//       UIGraphicsEndImageContext();
//
//       dispatch_async(dispatch_get_main_queue(), ^{
//           //5.子线程完成工作，切换至主线程
//           self.layer.contents = (__bridge id)image.CGImage;
//        });
//   });
//}

+ (Class)layerClass {
    return [NXAsyncableLayer class];
}
@end
