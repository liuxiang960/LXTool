//
//  MEONetWorkStatusView.m
//  SEUDApp
//
//  Created by Meonardo on 16/2/22.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import "MEONetWorkStatusView.h"

@interface MEONetWorkStatusView ()
{
    
}




@end

@implementation MEONetWorkStatusView

- (UIViewController*)findTopViewController
{
    id  topControler  = [self topMostController];
    UIViewController* topViewController;
    
    if([topControler isKindOfClass:[UINavigationController class]])
    {
        topViewController = [[(UINavigationController*)topControler viewControllers] lastObject];
    }
    else if ([topControler isKindOfClass:[UITabBarController class]])
    {
        topViewController = [(UITabBarController *)topControler selectedViewController];
        if ([topViewController isKindOfClass:[UINavigationController class]])
        {
            topViewController = [[(UINavigationController *)topViewController viewControllers] lastObject];
        }
        
    }
    else
    {
        topViewController = (UIViewController*)topControler;
    }
    return topViewController;
}

- (UIViewController*)topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController)
    {
        topController = topController.presentedViewController;
    }
    return topController;
}

- (IBAction)goBackAction:(UIButton *)sender
{
    [self removeFromSuperview];
    UIViewController *vc = [self findTopViewController];
    if (vc.navigationController)
    {
        [vc.navigationController popViewControllerAnimated:YES];
    }
}



- (IBAction)buttonDidTouch:(UIButton *)sender
{
    if (_netWorkEventBlock)
    {
        _netWorkEventBlock(self);
    }
}

- (void)setStatusDes:(NetWorkStateDes)statusDes
{
    _statusDes = statusDes;
    
    //将键盘收回
    UIViewController *vc = [self findTopViewController];
    for (UIView *v in vc.view.subviews)
    {
        [v endEditing:YES];
    }
    
    switch (_statusDes)
    {
        case NetWorkStateDesTimeOut:
        {
            _refreshButton.hidden = NO;
            _imageView.highlighted = YES;
            _textLabel.text = @"系统繁忙, 客官请稍后";
        }
            break;
        case NetWorkStateDesDisconnected:
        {
            _refreshButton.hidden = YES;
            _imageView.highlighted = YES;
            _textLabel.text = @"已与服务器断开连接, 请检查您的网络";
        }
            break;
        case NetWorkStateDesNoInternet:
        {
            _refreshButton.hidden = YES;
            _imageView.highlighted = NO;
            _textLabel.text = @"当前无网络, 请重新连接后重试";
        }
            break;
        default:
            break;
    }
}

- (void)setNeedShowDelayInfo:(BOOL)needShowDelayInfo
{
    _needShowDelayInfo = needShowDelayInfo;
    if (_needShowDelayInfo)
    {
        _imageView.highlighted = YES;
        _textLabel.text = @"3月1日平台正式开放账户注册功能, 其他精彩功能即将上线, 敬请期待!";
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
