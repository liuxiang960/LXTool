//
//  MEOHintView.h
//  SEUDApp
//
//  Created by Meonardo on 16/1/27.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HintOnWindow(hintTitle) [MEOHintView showHintViewWith:hintTitle]
#define HT MEOHintView

@interface MEOHintView : UIView

+ (void)showHintViewWith:(nonnull NSString *)hintTitle onView:(nonnull UIView *)view;
+ (void)showHintViewWith:(nonnull NSString *)hintTitle;

+ (void)showStatusWith:(nullable NSString *)statusString;
+ (void)showStatusWith:(nullable NSString *)statusString inProgress:(CGFloat)progress userInteracted:(BOOL)userInteractable;
+ (void)dismiss;

@end
