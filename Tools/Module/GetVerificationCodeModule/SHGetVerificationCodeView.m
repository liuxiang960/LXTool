//
//  SHGetVerificationCodeView.m
//  SEUDApp
//
//  Created by 自制力 on 16/11/3.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import "SHGetVerificationCodeView.h"
#import "MEOHintView.h"
#import "UIButton+Extends.h"
#import "LXAllServiceApi.h"

@interface SHGetVerificationCodeView ()
/**应用场景，1：免费开户；2：修改绑定邮箱；3：找回密码；4：修改资金密码；5：修改绑定手机；6：设置资金密码；7：绑定安全邮箱*/
@property (nonatomic, copy) NSString *style;
//类别，免费开户:1；修改绑定邮箱:2；找回密码:3、5；修改资金密码:4；修改绑定手机:4；设置资金密码:3

//(一)短信验证码：1. 免费开户 2. 修改绑定3手机3. 设置密码 4. 修改密码 5. 找回密码 6. 绑定银行卡 7. 出金操作 8  第三方平台绑定
//(二)邮箱验证码：1. 绑定邮箱 2. 修改绑定邮箱 3. 找回登陆密码 4. 修改资金密码 11. 签到信息
@property (nonatomic, copy) NSString *msgtype;
/**手机号或邮箱*/
@property (nonatomic, copy) NSString *telOrEmail;
//有效时间
@property (nonatomic, copy) NSString *liveTime;
//是否需要新的手机或邮箱
@property (nonatomic, assign) BOOL isNeedNewTelOrEmail;

@end

@implementation SHGetVerificationCodeView

- (NSDictionary *)schema{
    NSDictionary *dic = [self readSchema:@"GetVerificationCode"];
    return dic;
}

- (void)render{
    if ([self diff:@"style"]) {
        self.style = [self.state objectForKey:@"style"];
        
        NSInteger style = [_style integerValue];
        if (style == 1 || style == 2 || style == 5 || style == 7) {
            _isNeedNewTelOrEmail = YES;
        }else{
            _isNeedNewTelOrEmail = NO;
        }
    }
    
    if ([self diff:@"msgtype"]) {
        self.msgtype = [self.state objectForKey:@"msgtype"];
    }
    
    if ([self diff:@"telOrEmail"]) {
        self.telOrEmail = [self.state objectForKey:@"telOrEmail"];
        
    }
    
//    if ([self diff:@"verCode"]) {
//        NSString *verCode = [self.state objectForKey:@"verCode"];
//        self.vertificationCodeBlock(verCode);
//    }
    [super render];
}

- (void)didClickVerCodeBtnAction{
    if ([_style isEqualToString:@"1"]) {
        //免费开户
        [self isExsistForPhone:_telOrEmail];
    }else if ([_style isEqualToString:@"2"]) {
        //修改绑定邮箱
        [self isExsistForEmail:_telOrEmail];
    }else if ([_style isEqualToString:@"3"]){
        //找回密码
        if ([SeudPublic isStringBaoHanString:_telOrEmail myString:@"."]){
            //邮箱
            [self isExsistForEmail:_telOrEmail];
        }else{
            //手机
            [self isExsistForPhone:_telOrEmail];
        }
    }else if ([_style isEqualToString:@"4"]) {
        //修改资金密码
        [self getPhoneVerCode];
    }else if ([_style isEqualToString:@"5"]){
        //修改绑定手机
        [self isExsistForPhone:_telOrEmail];
    }else if ([_style isEqualToString:@"6"]){
        //设置资金密码
        [self getPhoneVerCode];
    }else if ([_style isEqualToString:@"7"]){
        //绑定安全邮箱
        [self isExsistForEmail:_telOrEmail];
    }else if ([_style isEqualToString:@"8"]){
        //第三方平台绑定
        [self getPhoneVerCode];
    }
}



#pragma mark ---- 判断手机号是否已被使用
- (void)isExsistForPhone:(NSString *)phone{
    [ViewCommon showLoadingView];
    [LXAllServiceApi checkBindeMobileWithWithParams:@{@"bindeMobile":phone} callBack:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if (success) {
            [ViewCommon dismissLoadingView];
            if (_isNeedNewTelOrEmail == YES) {
                [MEOHintView showHintViewWith:@"该手机号码已被注册"];
            }else{
                //找回密码
                [self getPhoneVerCode];
            }

        }else{
            [ViewCommon dismissLoadingView];
            if (_isNeedNewTelOrEmail == YES) {
                [self getPhoneVerCode];
            }else{
                [MEOHintView showHintViewWith:_T(@"该手机号码未注册!", @"100275")];
            }
        }
    }];
}

#pragma mark ---- 获取手机验证码
- (void)getPhoneVerCode{
    NSDictionary *params = @{@"mobileNo":_telOrEmail, @"msgtype":_msgtype, @"liveTime": [NSString stringWithFormat:@"%d", 1000*60*30]};
    [LXAllServiceApi sendMessageCheckNumWithParams:params callBack:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if (success && data) {
            [MEOHintView showHintViewWith:_T(@"验证码已发送", @"400060")];
            NSDictionary *dataDic = (NSDictionary *)data;
            if (_vertificationCodeBlock) {
                self.vertificationCodeBlock();
                NSString *str=dataDic[@"code"];
                if(str&&str.length>=6)
                HintOnWindow(str);
            }
            [_verCodeBtn startCountdown:60];
        }else{
            [MEOHintView showHintViewWith:desc];
        }
    }];
}



#pragma mark ---- 判断邮箱是否已被使用
- (void)isExsistForEmail:(NSString *)email{
    [LXAllServiceApi checkBindeEmailWithParams:@{@"bindedEmail":email} callBack:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if (success) {
            if (_isNeedNewTelOrEmail == YES) {
                [MEOHintView showHintViewWith:@"该邮箱已被使用"];
            }else{
                [self getEmailVerCode];
            }

        }else{
            if (_isNeedNewTelOrEmail == YES) {
                [self getEmailVerCode];
            }else{
                [MEOHintView showHintViewWith:_T(@"该邮箱号码不存在!", @"100268")];
            }

        }
    }];
    
}

#pragma mark ---- 获取邮箱验证码
- (void)getEmailVerCode{
    NSDictionary *params = @{@"bindedEmail":_telOrEmail, @"msgtype":_msgtype, @"liveTime": [NSString stringWithFormat:@"%d", 1000*60*30]};
    [LXAllServiceApi sendEmailMessageWithParams:params callBack:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if (success && data) {
            NSDictionary *dataDic = (NSDictionary *)data;
            self.vertificationCodeBlock();
            
            NSString *hintStr = [NSString stringWithFormat:@"验证码已经发送至您的邮箱: %@ 请查阅邮件并输入邮件中的验证码来完成验证", _telOrEmail];
            NSLog(@"---------------验证码------------------ %@", dataDic[@"code"]);
            HintOnWindow(dataDic[@"code"]);

            [MEOHintView showHintViewWith:hintStr];
            [_verCodeBtn startCountdown:60];
        }

    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
