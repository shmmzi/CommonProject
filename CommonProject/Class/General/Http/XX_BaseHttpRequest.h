//
//  XX_BaseHttpRequest.h
//  CommonProject
//
//  Created by xhw on 16/7/14.
//  Copyright © 2016年 xxx. All rights reserved.
//

#import "TYHttpRequest.h"

@interface XX_BaseHttpRequest : TYHttpRequest

@property (nonatomic,strong) NSMutableArray *imgArray;

+ (XX_BaseHttpRequest *)requestWithURL:(NSString *)url
                        withParameters:(NSDictionary *)parameters;

/**
 *  添加图片
 *
 *  @param image    图片内容
 *  @param name     名称 作为上传的key
 *  @param fileName 文件名
 */
- (void)appendImage:(UIImage *)image
               name:(NSString *)name
           fileName:(NSString *)fileName;

@end
