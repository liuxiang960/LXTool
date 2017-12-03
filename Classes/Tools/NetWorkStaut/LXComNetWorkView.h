//
//  LXComNetWorkView.h
//  SEUDApp
//
//  Created by 刘湘 on 17/5/16.
//  Copyright © 2017年 chuangwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXComNetWorkView : UIView
+ (instancetype)sharedInstance;
- (void)showTitle:(NSString *)til;
- (void)show;
- (void)hiden;
@end
