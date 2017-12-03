//
//  LXAllServiceApi.m
//  SEUDApp
//  Created by 刘湘 on 17/2/7.
//  Copyright © 2017年 chuangwuxian. All rights reserved.
//

#import "LXAllServiceApi.h"
#import "MEOHintView.h"
@implementation LXAllServiceApi
#pragma mark - registerAndOpenAccount
/**<验证手机号码是否绑定该平台 1微信 2、QQ 3、微博*/
+(void)isBindThirdPartyBoard:(NSString *)bindeMobile  LoginType:(NSString*)loginType callback:(CallbackBlock)callback{
    if (!bindeMobile) {
        callback(NO,1,@"参数异常",@{});
         return;
    }
    [DE serverCall:@"IsBindThirdPartyBoard" params:@{@"bindedMobile":bindeMobile,@"loginType":loginType} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**<bindedMobile  loginType openid  loginPwd  agentUserCode*/
+(void)submitBindThirdPartyBoardPamter:(NSDictionary *)params callback:(CallbackBlock)callback{
    if (!params) {
        callback(NO,1,@"参数异常",@{});
        return;
    }
    [DE serverCall:@"SubmitBindThirdPartyBoard" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**绑定三方平台(已登录)*/
+(void)submitBindLoginByUserCode:(NSDictionary *)params callback:(CallbackBlock)callback{
    if (!params) {
        callback(NO,1,@"参数异常",@{});
        return;
    }
    [DE serverCall:@"SubmitBindLoginByUserCode" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**登录接口 输入user 和pass 是账号登录反之第三方  platform 0：中证数登，1：微信，2：QQ，3：微博"*/
+(void)login:(NSString *)user password:(NSString *)password  OrthirdLoginTokenId:(NSString *)tokenId OpenId:(NSString *)openid PlatformName:(NSString *)platform callback:(CallbackBlock)callback{
    NSDictionary *info;
    if(!user&&!tokenId){
        callback(NO,1,@"",@{});
        return;
    }
    if (tokenId&&tokenId.length>0) {
         info = @{@"tokenId":tokenId,@"openId":openid,@"platformName":platform};
    }else{
         
         info = @{@"cellPhone":user, @"loginPwd":password};
    }
    [DE serverCall:@"LoginInfo" params:info callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**查询用户绑定渠道列表*/
+ (void)getMembBindListWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"GetMembBindList" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        
        callback(success, code, desc, data);
    }];
}

/**查询用户绑定渠道列表*/
+ (void)unbundOpenIdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"UnbundOpenId" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        
        callback(success, code, desc, data);
    }];
}

/**开户接口*/
+ (void)openAccountWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"OpenAccount" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        
        callback(success, code, desc, data);
    }];
}
+ (void)loadUserData:(CallbackBlock)callback{
    [DE serverCall:@"UserMessageInfo" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        
        callback(success, code, desc, data);
    }];
}
/**个人注册提交资料*/
+ (void)submitPersonMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"ApplyPersonAuthen" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**机构注册提交资料*/
+ (void)submitOrgMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"ApplyOrganAuthen" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**个人资料更改*/
+ (void)updatePersonMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"UpdatePersonAuthen" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**机构资料更改*/
+ (void)updateOrgMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"UpdateOrganAuthen" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**查询会员详情-根据会员编号/手机号码*/
+ (void)qryMemberDetailsByLikeNameWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"QryMemberDetailsByLikeName" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

#pragma mark - message 
/**发送短信*/
+ (void)sendMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"SendMessage" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**发送短信验证码*/
+ (void)sendMessageCheckNumWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"sendCheckCode" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**发送邮箱验证码*/
+ (void)sendEmailMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"SendEmailMessage" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - securityCenter
/**检查手机号是否被注册*/
+ (void)checkBindeMobileWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"CheckBindeMobile" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**检查机构证件号是否被注册*/
+ (void)checkOrganCodeWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"CheckOrganCode" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**检查个人证件号是否被注册*/
+ (void)checkPersonIDWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"CheckIdentificationCode" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**校验资金密码，登录密码是否正确*/
+ (void)checkPwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"CheckPwd" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**设置手势密码 */
+ (void)modGesturePwd:(NSString *)loginPass GesturePwd:(NSString *)gesturePwd callBack:(CallbackBlock)callback{
    NSDictionary *params =@{@"loginPwd":loginPass,@"gesturePwd":gesturePwd};
    [DE serverCall:@"ModGesturePwd" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**效验手势密码*/
+ (void)checkGesturePwd:(NSString *)gesturePwd callBack:(CallbackBlock)callback{
    NSDictionary *params =@{@"gesturePwd":gesturePwd};
    [DE serverCall:@"CheckGesturePwd" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**修改绑定邮箱*/
+ (void)modifyEmailWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"ModEmail" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**修改资金密码*/
+ (void)modifyFundPwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"ModFundPwd" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**修改登录密码*/
+ (void)modifyLoginPwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"ModLoginPwd" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**修改绑定手机号码*/
+ (void)modifyBondiedPhoneWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"ModTelPhone" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**设置绑定邮箱*/
+ (void)settingEmailWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"SetEmail" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**初始化资金密码,第一次设置不传验证码*/
+ (void)initFundPwdlWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"InitFundPwd" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**设置资金密码*/
+ (void)settingFundPwdlWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"SetFundPwd" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**找回登录密码验证*/
+ (void)retrievePwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"RetrieveLoginPwdChecked" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**检查手机号是否被注册*/
+ (void)checkBindeMobileWithWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback {
    [DE serverCall:@"CheckBindeMobile" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**检查邮箱是否被注册*/
+ (void)checkBindeEmailWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"CheckBindedEmail" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**查询所有省份加证件类型*/
+ (void)qryCityListCallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetAllDictData" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**查询当前用户最后一次信息修改审核详情*/
+ (void)qryMembInfoUpdateAuditInfoWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"QryMembInfoUpdateAuditInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


#pragma mark ---- 首页
//获取首页中的所有数据
+ (void)getHomePageDataCallBack:(CallbackBlock)callback{
    [DE serverCall:@"HomePage" params:@{@"imgIndex":@"1"} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}


#pragma mark ---- 页面状态检测
/**页面状态检测*/
+ (void)checkPageStateWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"CheckPageState" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


#pragma mark - 申购接口请求
/**新品申购、往期申购、申购品种详情*/
+ (void)GetPurchaseListWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"GetPurchaseList" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**普通申购页面获取可申购数量信息*/
+ (void)GetPurchaseInfoWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"GetPurchaseInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**普通申购、配售确认计算费用*/
+ (void)CalculatePurchaseInfoWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"CalculatePurchaseInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**普通申购确认申购*/
+ (void)SaveApplyBuyOrderWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"SaveApplyBuyOrder" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**配售申购确认配售*/
+ (void)SurePlacingByUserWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"SurePlacingByUser" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**放弃配售*/
+ (void)CancelPlacingByUserWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"CancelPlacingByUser" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取首页申购数据*/
+ (void)GetFirstPagePurchaseListCallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetFirstPagePurchaseList" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**申购记录列表*/
+ (void)QueryApplyBuyOrderByParam:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryApplyBuyOrderByParam" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**申购记录列表记录详情*/
+ (void)queryApplyBuyOrderDetailByParam:(NSDictionary *)params callBack:(CallbackBlock)callback needCache:(BOOL)need{
    [DE serverCall:@"QueryApplyBuyOrderDetail" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:need];
}

/**查询用户是否有配售的产品*/
+ (void)QueryPlacingByUserIdCallBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryPlacingByUserId" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:NO];
}

/**配售解冻细则*/
+ (void)QueryUnfreezeRuleByRuleId:(NSString *)ruleId callBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryUnfreezeRuleByRule" params:@{@"ruleId":ruleId} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    } needCache:NO];
}

/**查询单个产品的配售信息*/
+ (void)QueryPlacingByUserIdByParam:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryPlacingByUserId" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:NO];
}

/**获取当天的中签分享信息*/
+ (void)GetUserLuckyInfoByParam:(NSDictionary *)params callBack:(CallbackBlock)callback{
    [DE serverCall:@"GetUserLuckyInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


#pragma mark - 记录类 出入金记录、交易记录、资金流水
/**获取出入金流水*/
+ (void)GetPaymentInfoRecordsParams:(NSDictionary *)params CallBack:(CallbackBlock)callback needCache:(BOOL)need{
    [DE serverCall:@"GetPaymentInfoRecords" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:need];
}

+ (void)GetPaymentInfoDetailsParams:(NSDictionary *)params CallBack:(CallbackBlock)callback needCache:(BOOL)need{
    [DE serverCall:@"GetPaymentInfoDetails" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:need];
}
#pragma mark - 用户资产
/**获取用户资产*/
+ (void)GetUserTotalAccountParams:(NSDictionary*)params CallBack:(CallbackBlock)callback needCache:(BOOL)need{
    [DE serverCall:@"GetUserTotalAccount" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:NO];
}

/**获取用户资金*/
+ (void)GetUserAccountFunds:(NSDictionary*)params CallBack:(CallbackBlock)callback needCache:(BOOL)need{
    [DE serverCall:@"GetFundAccountByType" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:need];
}
#pragma mark - 点选交易
//点选买卖 <field name="entrustType" type="STRING" comment="1-买入，0-卖出" />
+ (void)ManualDealParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
    [DE serverCall:@"ManualDeal" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
//获取委托详情 <field name="entrustType" type="STRING" comment="1-买入，0-卖出" />
+ (void)QueryEntrustListDetailEntrustType:(NSString *)entrustType IssueCode:(NSString *)issueCode Price:(NSString *)price CallBack:(CallbackBlock)callback {
    NSDictionary *params;
    if (!issueCode) {
        callback(NO,1,@"请传入issueCode",@"");
        return;
    }
    params = @{@"issueCode":issueCode,@"pageNum":@"1",@"pageSize":@"1000",@"price":price,@"entrustType":entrustType};
    [DE serverCall:@"QueryEntrustListDetail" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - 交易
/**获取交易税率明细最小费用*/
+ (void)QueryCertificateIssuingWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
    [DE serverCall:@"QueryCertificateIssuingConf" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**通过ID查询买单详情*/
+ (void)QryBuyDetailsWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
//    NSDictionary *dict = @{@"ciid":@"201702241310370005",@"userCode":@"111"} ;
   [DE serverCall:@"QueryBuyDetailsById" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
   }];
}
/**通过ID查询卖单详情*/
+(void)QrySellDetailsWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
//    NSDictionary *dict = @{@"ciid":@"201702241310370005",@"userCode":@"111"} ;
    [DE serverCall:@"QuerySellDetailsById" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取买和卖方手续费
 #define  orderTypeCodeBuy  @"2"//买税费
 #define  orderTypeCodeSale @"3"//卖税费
 #define  orderTypeCodeAgreetTransferSale @"16"//协议卖类型
 #define  orderTypeCodeAgreetTransferBuy @"17"//协议买类型*
 <field name="certificateIssuingId" type="STRING" comment="发行ID" />
 <field name="num" type="STRING" comment="数量" />
 <field name="orderTypeCode" type="STRING" comment="类型" />
 <field name="price" type="STRING" comment="价格" />
 */
+ (void)CaculateTaxWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
    [DE serverCall:@"Calculate" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取持仓列表*/
+ (void)GetPositionListsWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback needCache: (BOOL)needCache {
//        NSDictionary *dict = @{@"countPerPages":@"1000", @"pageNumbers":@"1",@"userCode":@"111"};
//    NSDictionary *info=@{@"issueCode":@""};
    [DE serverCall:@"GetAssetInfoList" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
         callback(success, code, desc, data);
    } needCache:needCache];
}
/**获取最大可买*/
+ (void)getMaxCanBuyWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
    [DE serverCall:@"GetCanBuyCount" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**买入委托*/
+ (void)entrusBuyWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
    [DE serverCall:@"Buy" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**卖出委托*/
+ (void)entrusSellWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback {
    [DE serverCall:@"Sell" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**冻结解冻历史列表*/
+ (void)GetProdFrozenInfoWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetProdFrozenInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        [SeudPublic isWriteFieil:(NSDictionary*)data tabName:@"冻结解冻"];
        callback(success, code, desc, data);
    }];
}

/**冻结解冻详情数据*/
+ (void)GetProdFrozenDetailWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetProdFrozenDetail" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


#pragma mark - 历史成交、当日委托
/**历史成交列表*/
+ (void)QueryTradeRecordParams:(NSDictionary *)params CallBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryTradeRecord" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**历史成交详情，买入、卖出、协议买、协议卖*/
+ (void)QueryTradeRecordDetailParams:(NSDictionary *)params CallBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryTradeRecordDetail" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**当日委托列表*/
+ (void)QueryTradeRecordOfTodayParams:(NSDictionary *)params CallBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryTradeRecordOfToday" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - 绑卡、出入金
/**出入金时间 101:民生，102：钱宝*/
+(void)GetInputOutFundTimeCallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetInputOutFundTime" params:@{@"bankChannelId":@"101"} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**渠道开户*/
+(void)OpenChannelAccountParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"OpenChannelAccount" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**绑卡*/
+(void)BindBankCardParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"BindBankCard" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取出金手续费*/
+(void)QueryFeeParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"QueryFee" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**出金*/
+(void)OutFundParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"OutFund" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**入金*/
+(void)InputFundParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"InputFund" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/** 获取绑卡信息-----1:交易会员账户3:发行商募集资金账户7:运营公司账户8:市场公司账户  iAccountType----"绑卡状态1：未绑卡，2：未激活，3绑卡成功"  输出  if (success && data) {
 call(YES,@"审核通过",0);
 } else {
 call(NO,@"未绑卡",100)
 };*/

+(void)GetBindCardInfoParams:(NSDictionary *)params CallBack:(CallbackBlock)callback NeedCache:(BOOL)need{
    [DE serverCall:@"GetBindCardInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if (success) {
            NSMutableDictionary *muData=[[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)data];
            NSInteger bindState=[[(NSDictionary *)data objectForKey:@"bindState"] integerValue];
            NSString  *bbBandstatus=@"100";
            switch (bindState) {
                case 1:
                    bbBandstatus=@"100";
                    break;
                case 2:
                    bbBandstatus=@"1";
                    break;
                case 3:
                    bbBandstatus=@"0";
                    break;
                    
                default:
                    break;
            }
            if ([bbBandstatus isEqualToString:@"100"]) {//未绑卡
                callback(YES, code, desc, nil);
                return ;
            }else if ([bbBandstatus isEqualToString:@"1"]){//未激活
                callback(YES, code, @"未激活", muData);
                return ;
            }
            [muData setObject:bbBandstatus forKey:@"bbBandstatus"];//1、3都是以绑卡
            callback(success, code, desc, muData);
        }else{
            callback(NO, code, desc, data);
        }
    }];
}
/**判断是否可以解绑*/
+(void)CanUNBindBankCardCallBack:(CallbackBlock)callback{
    [DE serverCall:@"CanUNBindBankCard" params:@{@"iAccountType":@(1)} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**解绑*/
+(void)UNBindBankCardParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"UNBindBankCard" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**更新明生银行状态*/
+(void)UpdateTradeUserFundAccParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"UpdateTradeUserFundAcc" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
+(void)BankOpenAccountFailParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback{
    [DE serverCall:@"BankOpenAccountFail" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - 行情
/**获取某个批次涨跌幅*/
+(void)queryChgConfigStoke:(NSString *)stoke callback:(CallbackBlock)callback{
    [DE serverCall:@"/exchange/api/trans/queryChgConfig" params:@{@"ciid":stoke} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取行情列表*/
+(void)MarketListCallback:(CallbackBlock)callback needCache:(BOOL)need{
    [DE serverCall:@"MarketList" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}

/**获取实时行情---无名称*/
+(void)MarketRealtimeStoke:(NSString *)stoke callback:(CallbackBlock)callback needCache:(BOOL)need{
    [DE serverCall:@"MarketRealtime" params:@{@"ciid":stoke} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        NSArray *ar=[(NSDictionary *)data objectForKey:@"result"];
        NSDictionary * info=@{};
        if (ar.count) {
            info=ar[0];
        }
        callback(success, code, desc,  @{@"result":info});
    }needCache:need];
}

/**获取产品名称委托发售方等*/
+(void)QueryAssetIssuerInfoForTradeStock:(NSString *)stock callback:(CallbackBlock)callback Need:(BOOL)need{
    if (!stock&&stock.length<1) {
        callback(NO, 1, @"请传stock", @{});
        return;
    }
    [DE serverCall:@"QueryAssetIssuerInfoForTrade" params:@{@"issueCode":stock} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


/**获取行情 分时 k 等*/
+(void)MarketHistoryStoke:(NSString *)stoke  Cycle:(NSString *)cycle callback:(CallbackBlock)callback{
    NSDictionary *info= @{@"stockCode":stoke,@"cycle":cycle};
    [DE serverCall:@"MarketHistory" params:info callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}

/**获取交易时间*/
+(void)isTransactionTimeStock:(NSString *)stock callback:(CallbackBlock)callback{
    NSDictionary *info=nil;
    if (!stock){
        info=nil;
    }else {
        info=@{@"stockCode":stock};
    }
    [DE serverCall:@"TradeTime" params:info callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        NSDictionary *info = (NSDictionary *)data;
        if(![info[@"retCode"] isEqualToString:@"0000"]){
             callback(NO, [[info objectForKey:@"retCode"] intValue], info[@"retMsg"], data);
        }else{
             callback(success, code, desc, data);
        }
       
    }];
}
/**协议转让时间*/
+(void)IsTransferTimeParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"IsTransferTime" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}

/**获取逐笔交易数据*/
+(void)MarketOrderParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"MarketOrder" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}
/**获取盘口数据数据*/
+(void)QueryEntrustListParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"QueryEntrustList" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}

/**搜素交易代码*/
+(void)GetIssueListForFrontSearchKey:(NSString*)key callback:(CallbackBlock)callback{
    [DE serverCall:@"GetIssueListForFront" params:@{@"likeName":key} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}
#pragma mark - 委托买入卖出撤单
/**委托买单撤销*/
+(void)CancelBuyOrderParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"CancelBuyOrder" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];

}
/**委托卖单撤销*/
+(void)CancelSellOrderParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"CancelSellOrder" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];

}

#pragma mark - 经济会员
/**申请成为经济会员*/
+(void)applyManagerMemberWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"ApplyBorkerUser" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**再次申请成为经济会员*/
+(void)againApplyManagerMemberWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"ResetApplyBorkerUser" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}
/**查询经纪会员申请失败原因*/
+(void)queryFailReasonForApplyManagerMemberWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback {
    [DE serverCall:@"QryBorkerAuditInfo" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**经济会员主界面初始化*/
+(void)mangerMemberMianInterfaceWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"QryBorkerDetails" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**成长记录数据*/
+(void)queryUserHistoryWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"QueryUserHistory" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**直属/下级会员详情列表*/
+(void)AgentMemberDetailsWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"AgentMemberDetails" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**搜索直属/下级会员*/
+(void)SearchAccountWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"SearchAccount" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取默认经纪会员未点亮图标*/
+(void)getDefaultHierarchyInfoByTypeWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"GetDefaultHierarchyInfoByType" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**根据会员编码获取等级信息*/
+(void)getHierarchyInfoListByUserCodeWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"GetHierarchyInfoListByUserCode" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**经纪会员关系图*/
+(void)QueryFrontAgentUserRelationShipWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"QueryFrontAgentUserRelationShip" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**推荐会员列表*/
+(void)QryRecommendMemberPageInfoWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"QryRecommendMemberPageInfo" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - 我的自选
/**查询自选数据列表*/
+(void)qryOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"QryOptional" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**查询自选数据列表可缓存*/
+(void)qryOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache{
    [DE serverCall:@"QryOptional" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
          callback(success, code, desc, data);
    } needCache:needCache];
}
/**添加自选*/
+(void)addOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"AddOptional" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**删除自选*/
+(void)removeOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"RemoveOptional" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**是否自选*/
+(void)IsOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"IsOptional" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

#pragma mark - 消息相关
/**获取消息列表*/
+(void)MessageListWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache{
    [DE serverCall:@"MessageList" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    } needCache:needCache];
}
/**删除消息*/
+(void)DeleteMessageWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"DeleteMessage" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**设置消息已读*/
+(void)SettingMessageReadedWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback{
    [DE serverCall:@"SettingMessageReaded" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取未读消息数*/
+ (void)getMessUnreadCount:(void (^)(BOOL, NSString *, id))callback{
    [DE serverCall:@"GetUnreadAll" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if (success && data) {
            callback(success, desc, data);
        }
    }];
}
/**获取弹窗消息列表*/
+ (void)ListPushWithPopupCallback:(CallbackBlock)callback{
    [DE serverCall:@"ListPushWithPopup" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}



#pragma mark - 分享
/**分享*/
+(void)OperationShareWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache{
    if(DE.isUserNewRegiser){
        [DE serverCall:@"QueryShareItemInfoInfo" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
            NSDictionary *info =@{};
            if(success){
                NSArray *arr = [(NSDictionary*)data objectForKey:@"resultsList"];
                if (arr&&arr.count>0) {
                    info = arr[0];
                }
            }
            callback(success, code, desc, info);
        } needCache:needCache];
    }else{
        [DE serverCall:@"OperationShare" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
            callback(success, code, desc, data);
        } needCache:needCache];
    }

}


#pragma mark ---- 公共接口
/**邀请二维码*/
+ (void)inviteQrCodeWithParmas:(NSDictionary *)params callback:(CallbackBlock)callback{
    [DE serverCall:@"InviteQrCode" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    } needCache:YES];
}

/**关注微信公众号*/
+ (void)getQRCodeCallback:(CallbackBlock)callback{
    [DE serverCall:@"GetQRCode" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    } needCache:YES];
}

/**获取公告弹框*/
+ (void)PopMessagesCallback:(CallbackBlock)callback{
    [DE serverCall:@"PopMessages" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
    
}

/**提示语版本版本*/
+ (void)GetHintVersionCallback:(CallbackBlock)callback{
    [DE serverCall:@"GetHintVersion" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
    
}

/**码表信息*/
+ (void)GetHintCollectionCallback:(CallbackBlock)callback{
    [DE serverCall:@"GetHintCollection" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}

/**获取文章列表  该字段可输入标题，品种编号，品种名称*/
+ (void)GetProductInformationKeyStokeCode:(NSString *)stoke Callback:(CallbackBlock)callback{
    if (!stoke||stoke.length<=0) {
        return;
    }
    NSDictionary *dict=@{@"certificateIssuingId":stoke};
    [DE serverCall:@"GetProductInformation" params:dict callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**获取协议地址
 bmcagreement : 经纪会员合作协议
 atagreement : 会员入市协议书
 minformation : 会员须知
 rwarning : 风险提示书
 purchaseinformation:申购须知
*/
+ (void)GetParamterValueCallSpecialCode:(NSString *)specialCode Back:(CallbackBlock)callback{
    [DE serverCall:@"GetParamterValue" params:@{@"specialCode":specialCode} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    } needCache:YES];
}
#pragma mark ---- 清除用户sessionId
/**清除用户sessionId*/
+ (void)RemoveTokenCallback:(CallbackBlock)callback{
    [DE serverCall:@"RemoveToken" params:@{@"sessionId":DE.userSession} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


#pragma mark ---- 获取首页文章列表
/**获取首页轮播图*/
+ (void)GetTopTemplateJsonCallback:(CallbackBlock)callback{
    [DE serverCall:@"GetTopTemplateJson" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


/**获取首页文章列表*/
+ (void)ListPageBySpecialCodePublishCallback:(CallbackBlock)callback{
    [DE serverCall:@"ListPageBySpecialCodePublish" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**获取未读消息数*/
+ (void)GetUnreadAllCallback:(CallbackBlock)callback{
    [DE serverCall:@"GetUnreadAll" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - 协议转让
/**获取协议转让可转让列表接口*/
+(void)GetNegoSelectListIssude:(NSString *)issueCode CallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetNegoSelectList" params:@{@"issueCode":issueCode} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:NO];
}

/**根据转让数量与同比转让比例计算冻结与非冻结数量
 <field name="togeNegoPro" type="STRING" comment="同比转让比例" />
 <field name="total" type="STRING" comment="转让数量" />
 */
+(void)ReCaculateTogeNegoPro:(NSString *)togeNegoPro Total:(NSString*)total CallBack:(CallbackBlock)callback{
    [DE serverCall:@"ReCaculate" params:@{@"togeNegoPro":togeNegoPro,@"total":total} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:NO];
}

/**查询品种可转让数量与规则信息*/
+(void)GetNegoNumDetailDescIssude:(NSString *)issueCode CallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetNegoNumDetailDesc" params:@{@"issueCode":issueCode} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**查询成交订单的可转让数量与规则信息*/

+(void)GetDealNegoNumDetailDescOrdId:(NSString *)orderId CallBack:(CallbackBlock)callback{
    [DE serverCall:@"GetDealNegoNumDetailDesc" params:@{@"orderId":orderId} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**协议卖*/
+ (void)TransferSellParams:(NSDictionary*)params Callback:(CallbackBlock)callback{
    [DE serverCall:@"TransferSell" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**协议买*/
+ (void)TransferBuyParams:(NSDictionary*)params Callback:(CallbackBlock)callback{
    [DE serverCall:@"TransferBuy" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**协议当日委托列表*/
+ (void)QueryTransferRecordOfTodayParams:(NSDictionary*)params Callback:(CallbackBlock)callback{
    [DE serverCall:@"QueryTransferRecordOfToday" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**协议转让撤销*/
+(void)CancelTransferOrderEntrustId:(NSString *)entrustId CallBack:(CallbackBlock)callback{
    [DE serverCall:@"CancelTransferOrder" params:@{@"entrustId":entrustId} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**通过委托单号查解冻规则*/
+(void)GetEntrustNegoNumDetailDescEntrustId:(NSString *)entrustId  CallBack:(CallbackBlock)callback{
    if (!entrustId||[entrustId isEqualToString:@""]) {
        [MEOHintView showHintViewWith:@"请传入委托单号"];
        return;
    }
    [DE serverCall:@"GetEntrustNegoNumDetailDesc" params:@{@"entrustId":entrustId} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**效验买方买入金额*/
+(void)IsTransferBuyUserCode:(NSString *)buyId Money:(NSString *)moeny CallBack:(CallbackBlock)callback{
    if (!buyId||[buyId isEqualToString:@""]) {
        [MEOHintView showHintViewWith:@"请传入买方id"];
        return;
    }else{
        [DE serverCall:@"IsTransfer" params:@{@"buyUserCode":buyId,@"money":moeny} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
            callback(success, code, desc, data);
        }];
    }
}

#pragma mark - 前端权限验证接口
/**前端权限验证接口*/
+ (void)ValidTradePermissionWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback{
    [DE serverCall:@"ValidTradePermission" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - 资金流水
/**资金流水*/
+(void)GetFundRecordFlowWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache{
    [DE serverCall:@"GetFundRecordFlow" params:parmas callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    } needCache:needCache];
}
#pragma mark - 获取最小变动价格
+ (void)GetAllPriceRangeDataWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback{
    [DE serverCall:@"GetAllPriceRangeData" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
#pragma mark - 佣金相关
/**每日佣金*/
+ (void)CommissionEverydayDataWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback{
    [DE serverCall:@"CommissionEveryday" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**品种返佣*/
+ (void)CommissionDetailsDataWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback{
    [DE serverCall:@"CommissionDetails" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}





#pragma mark - 新开户流程接口
/**个人实名认证提交资料*/
+ (void)ApplyPersonAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"ApplyPersonAuthenNew" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**个人实名认证完善资料*/
+ (void)UpdatePersonInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"UpdatePersonInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**个人实名认证修改资料*/
+ (void)UpdatePersonAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"UpdatePersonAuthenNew" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**机构实名认证提交资料*/
+ (void)ApplyOrganAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"ApplyOrganAuthenNew" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**机构实名认证修改资料*/
+ (void)UpdateOrganAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"UpdateOrganAuthenNew" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**机构实名认证完善资料*/
+ (void)UpdateOrganInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"UpdateOrganInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**登记*/
+ (void)RegisterAssetInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"RegisterAssetInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**获取登记界面信息*/
+ (void)GetZzUserAssetInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"GetZzUserAssetInfo" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**登记记录*/
+ (void)QueryRegisterAssetRecordByPageParams:(NSDictionary*)params Callback:(CallbackBlock)callback {
    [DE serverCall:@"QueryRegisterAssetRecordByPage" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**中证入金获取最大最小值和随机金额*/
+ (void)DepositInitCallback:(CallbackBlock)callback {
    [DE serverCall:@"DepositInit" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**中证入金接口*/
+ (void)ReqInMoneyRemit:(NSString *)money Callback:(CallbackBlock)callback {
    if (!money||[money floatValue]<=0) {
        callback(NO,1,@"入金金额不能为0",nil);
        return;
    }
    [DE serverCall:@"ReqInMoneyRemit" params:@{@"amt":money,@"iAccountType":@"1"} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**查询银行列表*/
+ (void)GetBankListCallback:(CallbackBlock)callback {
    [DE serverCall:@"GetBankList" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**查询银行支行列表*/
+ (void)GetBrankBranchListBankCode:(NSString *)bankCode CityCode:(NSString *)cityCode Callback:(CallbackBlock)callback {
    NSDictionary *params = @{@"bankCode":bankCode,@"cityCode":cityCode};
    [DE serverCall:@"GetBrankBranchList" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**获取城市列表银行用*/
+ (void)GetCityListCallback:(CallbackBlock)callback {
    [DE serverCall:@"GetCityBankList" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }needCache:YES];
}
/**判断是否认证登记成功*/
+ (void)RealNameRegistCallback:(CallbackBlock)callback {
    [DE serverCall:@"RealNameRegist" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**中证绑卡接口是否需要验证码*/
+ (void)ZzsdbindBankCardParams:(NSDictionary*)params Call:(CallbackBlock)callback NeedVerification:(BOOL)bol{

        [DE serverCall:@"ZzsdbindBankCard" params:params callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
            callback(success, code, desc, data);
        }];
}
/**获取绑卡信息接口接口 返回有data 就有绑卡*/
+ (void)ZzsdGetBindCardInfo:(CallbackBlock)callback {
    [DE serverCall:@"ZzsdGetBindCardInfo" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        NSObject *info;
        if (success&&data) {
            NSString *str = [[(NSDictionary*)data objectForKey:@"result"] objectForKey:@"bbBankaccountno"];
            if (str&&str.length>1) {
                info =data;
            }
        }
        callback(success, code, desc, info);
    }];
}
/**获取汇款单详情*/
+ (void)GetOneRemit:(CallbackBlock)callback {
    [DE serverCall:@"GetOneRemit" params:nil callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**取消汇款单*/
+ (void)CloseReqInMoneyRemitOrder:(NSString *)order Caback:(CallbackBlock)callback {
    if(!order||order.length<1){
        callback(NO, 100, @"汇款单单号不能为空", nil);
        return;
    }
    [DE serverCall:@"CloseReqInMoneyRemit" params:@{@"paymentId":order} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}

/**出金接口 1.交易会员 2.经纪会员*/
+ (void)ReqOutMoney:(NSString *)money iAccountType:(NSString*)itype Caback:(CallbackBlock)callback {
    [DE serverCall:@"ReqOutMoney" params:@{@"amt":money,@"iAccountType":itype} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}
/**效验验证码*/
+(void)VerifyCheckCode:(NSString*)checkCode Caback:(CallbackBlock)callback{
    [DE serverCall:@"verifyCheckCode" params:@{@"mobileNo":DE.userPhoneNum,@"code":checkCode} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        callback(success, code, desc, data);
    }];
}


@end
