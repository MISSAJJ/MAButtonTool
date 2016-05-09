//
//  MABaseViewController.m
//  MAButtonTool
//
//  Created by MISSAJJ on 16/4/4.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import "MABaseViewController.h"
#import "MAButtonTool.h"
#import <Accelerate/Accelerate.h>
#import "UIImage+FontAwesome.h"
#import "MAHUDTool.h"
@interface MABaseViewController ()

@end

@implementation MABaseViewController


- (void)viewDidLoad {
    
      [super viewDidLoad];
    
    
    //解决navi显示后会自动调整为去掉导航栏的高度的，控件会自动在导航栏以下摆放的问题
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    
    //创建模糊背景
    [self setBlurImageBackground];
    
    //创建自定义图片按钮
    [self setCustomImageButton];
    
    
    //创建FontAwesomeBlock按钮
    [self setFontAwesomeBlockButton];
    
  
}

//创建FontAwesomeBlock按钮
- (void)setFontAwesomeBlockButton{

    //创建FontAwesome按钮
    UIImage *icon = [UIImage imageWithIcon:@"fa-github" backgroundColor:nil iconColor:[UIColor whiteColor] fontSize:45];
    
    
    
    //block方式创建图片按钮
    UIButton * blockAwesomeBtn =  [MAButtonTool createBlockButton:icon :^(UIButton *btn) {
      
        [self showHUDText:@"FontAwesome Block Button" detailStr:@"+ (UIButton *)createBlockButton:(id)imageStr :(ButtonBlock)block"];
        
        
        
    }];

    
    blockAwesomeBtn.center = self.view.center;
    CGRect rect  = blockAwesomeBtn.frame;
    rect.size  = CGSizeMake(50, 50);
    rect.origin.y += 100;
    blockAwesomeBtn.frame = rect;
    blockAwesomeBtn.backgroundColor = [UIColor redColor];
    blockAwesomeBtn.layer.masksToBounds = YES;
    blockAwesomeBtn.layer.cornerRadius = blockAwesomeBtn.frame.size.height * 0.5;
    [self.view addSubview:blockAwesomeBtn];
 
}

- (void)clickCustomButton
{
    [self showHUDText:@"Custom Button" detailStr:@"+ (UIButton *)createButton:(id)imageStr"];

}
//创建自定义图片按钮
- (void)setCustomImageButton{

    UIButton * customBtn = [MAButtonTool createButton:@"music"];
    customBtn.center = self.view.center;
    [customBtn addTarget:self action:@selector(clickCustomButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customBtn];
    
    
    UIView * shadowView = [[UIView alloc]initWithFrame:CGRectMake(customBtn.frame.origin.x -50 , customBtn.frame.origin.y - 200, customBtn.frame.size.width + 100, customBtn.frame.size.height + 100)];
    shadowView.layer.shadowOffset = CGSizeMake(0, 4);
    shadowView.layer.shadowOpacity = 0.5;
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    [self.view addSubview:shadowView];
    
    //block方式创建图片按钮
    UIButton * blockBtn1 = [MAButtonTool createBlockButton:@"MISSAJJ_ICON" :^(UIButton *btn) {
        
        [self shareMethod];
    }];
    
    blockBtn1.frame =shadowView.bounds;
    blockBtn1.layer.masksToBounds = YES;
    blockBtn1.layer.cornerRadius = blockBtn1.frame.size.width  * 0.5;
    blockBtn1.layer.shadowRadius = 5;//阴影圆角 扩散的范围控制
    blockBtn1.layer.borderWidth=4.0f; //边框宽度
    blockBtn1.layer.borderColor=[[UIColor whiteColor] CGColor];//边框颜色
    [shadowView addSubview:blockBtn1];


}
//创建模糊背景
- (void)setBlurImageBackground{

    
    UIImage *backImg = [self blurryImage:[UIImage imageNamed:@"MADesignNote_Work_2"] withBlurLevel:0.5];
    UIImageView * imageV = [[UIImageView alloc]initWithImage:backImg];
    imageV. contentMode = UIViewContentModeScaleAspectFill;
    imageV.frame = self.view.frame;
    [self.view addSubview:imageV];

}

- (void)shareMethod {
    
    NSString *string = @"MAButtonTool－－by MISSAJJ";
    NSURL *URL = [NSURL URLWithString:@"https://github.com/MISSAJJ/MAButtonTool"];
    
    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:@[string, URL]
                                      applicationActivities:nil];
    [self presentViewController:activityViewController
                       animated:YES
                     completion:^{
                         // ...
                     }];
    
}


#pragma mark - Blur 加模糊效果，image是图片，blur是模糊度
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur
{
    
    if (image==nil)
        
    {
        NSLog(@"error:为图片添加模糊效果时，未能获取原始图片");
        return nil;
    }
    
    //模糊度,
    if ((blur < 0.1f) || (blur > 2.0f)) {
        blur = 0.5f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    //NSLog(@"boxSize:%i",boxSize);
    //图像处理
    CGImageRef img = image.CGImage;
    //需要引入#import <Accelerate/Accelerate.h>
    /*
     This document describes the Accelerate Framework, which contains C APIs for vector and matrix math, digital signal processing, large number handling, and image processing.
     本文档介绍了Accelerate Framework，其中包含C语言应用程序接口（API）的向量和矩阵数学，数字信号处理，大量处理和图像处理。
     */
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    //    NSLog(@"字节组成部分：%zu",CGImageGetBitsPerComponent(img));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);   //多余的释放
    CGImageRelease(imageRef);
    
    return returnImage;
}

- (void)showHUDText:(NSString*)str detailStr:(NSString*)detailStr{
 
    [[MAHUDTool sharedMAHUDTool]showHUDInView:nil withString:str detailString:detailStr];
    
   [self performSelector:@selector(hideHUD) withObject:self afterDelay:2.0];
   
}
- (void)hideHUD{
    
    [[MAHUDTool sharedMAHUDTool]hideHUD];
    
}
@end
