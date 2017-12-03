//
//  SHGetVerificationCodeView.h
//  SEUDApp
//
//  Created by 自制力 on 16/11/3.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import "BaseView.h"

typedef void(^VertificationCodeBlock)();

@interface SHGetVerificationCodeView : BaseView
/**获取验证码按钮*/
@property (weak, nonatomic) IBOutlet UIButton *verCodeBtn;

/**返回验证码*/
@property (nonatomic, copy) VertificationCodeBlock vertificationCodeBlock;

/**点击获取验证码按钮是调用事件*/
- (void)didClickVerCodeBtnAction;
@end
