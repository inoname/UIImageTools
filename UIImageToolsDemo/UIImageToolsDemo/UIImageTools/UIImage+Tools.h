//
//  UIImage+Tools.h
//  02屏幕截屏
//
//  Created by kouliang on 14/12/29.
//  Copyright (c) 2014年 kouliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tools)

+ (instancetype)imageWithCaptureView:(UIView *)view;

+(instancetype)circleImageWithImageName:(NSString *)imaegName boardWith:(CGFloat)with boardColor:(UIColor *)color;
@end
