//
//  MsgBubbleView.h
//  SEUDApp
//
//  Created by Chengkai on 16/6/22.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MsgBubbleCallbackBlock)();

@interface MsgBubbleView : UIView

+ (instancetype)sharedInstance;

@property (nonatomic, assign) BOOL isShowing;/**< 是否正在展示消息 */

-(void)showBubble:(NSString *)msg callback:(MsgBubbleCallbackBlock)callback;

@end
