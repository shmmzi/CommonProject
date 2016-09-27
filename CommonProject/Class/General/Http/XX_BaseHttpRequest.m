//
//  XX_BaseHttpRequest.m
//  CommonProject
//
//  Created by xhw on 16/7/14.
//  Copyright © 2016年 xxx. All rights reserved.
//

#import "XX_BaseHttpRequest.h"
#import "AFNetworking.h"

@implementation XX_BaseHttpRequest

+ (XX_BaseHttpRequest *)requestWithURL:(NSString *)url
                        withParameters:(NSDictionary *)parameters
{
    XX_BaseHttpRequest *request = [[XX_BaseHttpRequest alloc] init];
    request.URLString = @"/xxx";
    request.parameters = parameters;;
    return request;
}

- (void)appendImage:(UIImage *)image name:(NSString *)name fileName:(NSString *)fileName
{
    if (self.imgArray == nil)
    {
        self.imgArray = [[NSMutableArray alloc] init];
    }
    
    NSData *imgData = nil;
    if ([fileName hasSuffix:@".png"])
    {
        imgData = UIImagePNGRepresentation(image);
    }
    else if ([fileName hasSuffix:@".jpg"] || [fileName hasSuffix:@".jpeg"])
    {
        // 原始数据
        imgData = UIImageJPEGRepresentation(image, 1.0);
        // 原始图片
        UIImage *image = [UIImage imageWithData:imgData];
        
        while (imgData.length > 1048576) {
            imgData = UIImageJPEGRepresentation(image, 0.5);
            image = [UIImage imageWithData:imgData];
        }
    }
    
    if (imgData == nil) {
        NSLog(@"\n图片错误，添加到网络请求失败\n");
        return;
    }
    
    NSString *contentType = nil;
    if ([fileName hasSuffix:@".jpeg"] || [fileName hasSuffix:@".jpg"])
    {
        contentType = @"image/jpeg";
    }
    else
    {
        contentType = @"image/png";
    }
    
    NSDictionary *dic = @{@"imgData":imgData, @"name":name, @"fileName":fileName, @"contentType":contentType};
    
    [self.imgArray addObject:dic];
}

- (void)load
{
    if (self.imgArray && self.imgArray.count > 0) {
        weakSelf(self);
        [self setConstructingBodyBlock:^(id<AFMultipartFormData> formData) {
            for (NSDictionary *dic in weakSelf.imgArray) {
                [formData appendPartWithFileData:dic[@"imgData"]
                                            name:dic[@"name"]
                                        fileName:dic[@"fileName"]
                                        mimeType:dic[@"contentType"]];
            }
        }];
    }
    
    [super load];
}

// 验证数据
- (BOOL)validResponseObject:(id)responseObject error:(NSError *__autoreleasing *)error
{
    [super validResponseObject:responseObject error:error];
    //验证数据的有效性，登录过期校验等
    
    return self.responseObject ? YES : NO;
}

@end
