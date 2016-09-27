//
//  XX_AppMacros.h
//  OA
//
//  Created by  shenfeng on 16/3/21.
//  Copyright © 2016年 UGU. All rights reserved.
//

#ifndef XX_AppMacros_h
#define XX_AppMacros_h

// -------> 快捷方法 <-------
#define Noti_Center       [NSNotificationCenter defaultCenter]

#define weakSelf(args)      __weak typeof(args) weakSelf = args

#define USER_DEFAULTS       [NSUserDefaults standardUserDefaults]

#define SCREEN_BOUNDS       [UIScreen mainScreen].bounds
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define PIXEL_SCALE         (SCREEN_WIDTH / 750.0)

#define CGSizeW(rect)       (rect.size.width)
#define CGSizeH(rect)       (rect.size.height)
#define CGOriginX(rect)     (rect.origin.x)
#define CGOriginY(rect)     (rect.origin.y)
#define CGEndX(rect)        (rect.origin.x + rect.size.width)
#define CGEndY(rect)        (rect.origin.y + rect.size.height)

#define WIDTH_3_5_INCH      320.f
#define HEIGHT_3_5_INCH     480.f

#define WIDTH_4_INCH        320.f
#define HEIGHT_4_INCH       568.f

#define WIDTH_4_7_INCH      375.f
#define HEIGHT_4_7_INCH     667.f

#define WIDTH_5_5_INCH      414.f
#define HEIGHT_5_5_INCH     736.f

#define WINDOW_3_5_INCH     ([[UIScreen mainScreen] bounds].size.height == HEIGHT_3_5_INCH)
#define WINDOW_4_INCH       ([[UIScreen mainScreen] bounds].size.height == HEIGHT_4_INCH)
#define WINDOW_4_7_INCH     ([[UIScreen mainScreen] bounds].size.height == HEIGHT_4_7_INCH)
#define WINDOW_5_5_INCH     ([[UIScreen mainScreen] bounds].size.height == HEIGHT_5_5_INCH)

#define IOS_7_OR_LATER      ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_8_OR_LATER      ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_9_OR_LATER      ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

// -------> UIColor <-------
// RGB颜色
#define XX_Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define XX_RandomColor UGUColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//UIColor 十六进制RGB_0x
#define XX_ColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// -------> 有效性 <-------
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isKindOfClass:[NSNull class]]) )
#define isValidStr(_ref) ((IsNilOrNull(_ref)==NO) && ([_ref length]>0))


#ifdef DEBUG // 处于开发阶段
#define NSLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define NSLog(...)
#endif

#endif /* XX_AppMacros_h */
