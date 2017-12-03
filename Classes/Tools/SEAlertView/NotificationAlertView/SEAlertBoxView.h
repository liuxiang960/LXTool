//
//  SEAlertBoxView.h
//  SEUDApp
//
//  Created by Chengkai on 16/6/22.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "SeudPublic.h"
#import "UIColor+helper.h"
#import "SEUDColor.h"
#import "SEUDFont.h"
#import "UIView+Extends.h"
@interface SEAlertBoxView : UIView

@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *btnLeft;
@property (nonatomic, strong) UIButton *btnRight;
@property (nonatomic, assign) BOOL isLeftBtnHidde;
@property (nonatomic, strong)void (^closeBlock)(void);

-(void)setHtmlContent:(NSString *)htmlMessage;

@end
