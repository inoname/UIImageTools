//
//  UIImage+Tools.m
//  02屏幕截屏
//
//  Created by kouliang on 14/12/29.
//  Copyright (c) 2014年 kouliang. All rights reserved.
//

#import "UIImage+Tools.h"

@implementation UIImage (Tools)
+ (instancetype)imageWithCaptureView:(UIView *)view
{
    // 屏幕截屏,从当前view生成图像
    
    // 开启位图上下文
    // 什么时候需要用不透明,只要上下文的尺寸跟绘制图片的尺寸一样,就用不透明
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 把控制器的view的layer渲染上去
    // layer只能渲染,不能绘制
    [view.layer renderInContext:ctx];
    //    [self.view.layer drawInContext:ctx];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return img;
    
}

+(instancetype)circleImageWithImageName:(NSString *)imageName boardWith:(CGFloat)with boardColor:(UIColor *)color{
    //1.加载图片
    UIImage *image=[UIImage imageNamed:imageName];
    
    //2.计算上下文尺寸
    CGFloat bigW=image.size.width+2*with;
    CGFloat bigH=image.size.height+2*with;
    CGRect bigRect=CGRectMake(0, 0, bigW, bigH);
    
    //3.开启一个位图上下文
    // 只要绘制内容没有填充上下文,用透明,NO
    UIGraphicsBeginImageContextWithOptions(bigRect.size, NO, 0);
    
    //4.画大圆
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:bigRect];
    //设置圆环颜色
    [color set];
    [path fill];
    
    
    //5.设置图片裁剪区域
    CGRect imageRect=CGRectMake(with, with, image.size.width, image.size.height);
    UIBezierPath *clipPath=[UIBezierPath bezierPathWithOvalInRect:imageRect];
    [clipPath addClip];
    
    //6.画图片
    [image drawInRect:imageRect];
    
    //7.把上下文生成一个新的图片
    UIImage *circleImage=UIGraphicsGetImageFromCurrentImageContext();
    
    //8.关闭上下文
    UIGraphicsEndImageContext();
    
    return circleImage;
    
    
    
    
    
}
@end
