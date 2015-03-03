//
//  ViewController.m
//  UIImageToolsDemo
//
//  Created by kouliang on 15/3/3.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tools.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *capturedImgView;
@property (weak, nonatomic) IBOutlet UIImageView *circleImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)capture {
    
    UIImage *capturedImg = [UIImage imageWithCaptureView:self.view];
    self.capturedImgView.image=capturedImg;
    
}
- (IBAction)circle {
    
    UIImage *circleImg = [UIImage circleImageWithImageName:@"people_liudehua" boardWith:2.0 boardColor:[UIColor redColor]];
    self.circleImgView.image=circleImg;
    
    
}

@end
