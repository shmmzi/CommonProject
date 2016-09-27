//
//  XX_BaseNavigationController.m
//  CommonProject
//
//  Created by xhw on 16/7/14.
//  Copyright © 2016年 xxx. All rights reserved.
//

#import "XX_BaseNavigationController.h"

@interface XX_BaseNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation XX_BaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
        //统一定义导航栏
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    // 导航栏都是栈管理的 当栈里面的内容大于0 说明push了
    if (self.viewControllers.count > 0) {
        // 隐藏tableBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    if (self.viewControllers.count > 0)
    {
        viewControllerToPresent.hidesBottomBarWhenPushed = YES;
    }
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        if (self.viewControllers.count > 1)
        {
            self.interactivePopGestureRecognizer.enabled = YES;
            self.interactivePopGestureRecognizer.delegate = self;
        }
        else
        {
            self.interactivePopGestureRecognizer.enabled = NO;
            self.interactivePopGestureRecognizer.delegate = nil;
        }
    }
}

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}


@end
