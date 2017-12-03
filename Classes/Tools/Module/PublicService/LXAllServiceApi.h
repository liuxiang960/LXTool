//
//  LXAllServiceApi.h
//  SEUDApp
//
//  Created by 刘湘 on 17/2/7.
//  Copyright © 2017年 chuangwuxian. All rights reserved.
//
/*!
 *  @author 刘湘, 17-08-16 11:08:11
 *
 *  @brief 所有接口配置
 *
 *  @return
 *
 *  @since <#1.1.1#>
 */

#import <Foundation/Foundation.h>

@interface LXAllServiceApi : NSObject
/*!
 *  @author 刘湘, 17-08-16 16:08:25
 *
 *  @brief 验证手机号码是否绑定该平台
 *
 *  @param bindedMobile 手机号码
 *  @param loginType   1微信 2、QQ 3、微博
 *  @param callback
 *
 *  @since <#1.1.1#>
 */
+(void)isBindThirdPartyBoard:(NSString *)bindeMobile  LoginType:(NSString*)loginType callback:(CallbackBlock)callback;
/*!
 *  @author 刘湘, 17-08-16 16:08:04
 *
 *  @brief 提交第三方绑定
 *
 *  @param params
 *  @param callback 
 *
 *  @since <#1.1.1#>
 */
+(void)submitBindThirdPartyBoardPamter:(NSDictionary *)params callback:(CallbackBlock)callback;
/**绑定三方平台(已登录)*/
+(void)submitBindLoginByUserCode:(NSDictionary *)params callback:(CallbackBlock)callback;
/*!
 *  @author 刘湘, 17-08-16 11:08:53
 *
 *  @brief 登陆接口
 *
 *  @param user     用户
 *  @param password 密码
    第三方登录
 *  @param tokenId  token
 *  @param openid
 *  @param platform 0：中证数登，1：微信，2：QQ，3：微博"
 *  @param callback
 *
 *  @since <#1.1.1#>
 */
+(void)login:(NSString *)user password:(NSString *)password  OrthirdLoginTokenId:(NSString *)tokenId OpenId:(NSString *)openid PlatformName:(NSString *)platform callback:(CallbackBlock)callback;
/*!
 *  @author 刘湘, 17-02-10 10:02:17
 *
 *  @brief 获取用户信息
 *
 *  @param callback 返回
 *
 *  @since <#1.0.4#>
 */
+ (void)loadUserData:(CallbackBlock)callback;
/*!
 *  @author dp, 17-02-07 17:02:32
 *
 *  @brief 开户接口
 *
 *  @param 参数

 *  @param callback 返回
 *
 *  @since <#1.0.4#>
 */
+ (void)openAccountWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/*!
 *  @author dp, 17-02-07 17:02:32
 *
 *  @brief 个人用户注册提交资料
 *
 *  @param 参数

 *  @param callback 返回
 *
 *  @since <#1.0.4#>
 */
+ (void)submitPersonMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/*!
 *  @author dp, 17-02-07 17:02:32
 *
 *  @brief 机构用户注册提交资料
 *
 *  @param 参数
 
 *  @param callback 返回
 *
 *  @since <#1.0.4#>
 */
+ (void)submitOrgMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/*!
 *  @author dp, 17-02-07 17:02:32
 *
 *  @brief 个人资料更改
 *
 *  @param 参数
 
 *  @param callback 返回
 *
 *  @since <#1.0.4#>
 */

+ (void)updatePersonMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/*!
 *  @author dp, 17-02-07 17:02:32
 *
 *  @brief 机构资料更改
 *
 *  @param 参数
 
 *  @param callback 返回
 *
 *  @since <#1.0.4#>
 */
/**查询用户绑定渠道列表*/
+ (void)getMembBindListWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**解除用户登录绑定关系*/
+ (void)unbundOpenIdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
+ (void)updateOrgMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**查询会员详情-根据会员编号/手机号码*/
+ (void)qryMemberDetailsByLikeNameWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;

/**发送短信*/
+ (void)sendMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**发送短信验证码*/
+ (void)sendMessageCheckNumWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;;
/**检查手机号是否被注册*/
+ (void)checkBindeMobileWithWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;

/**检查邮箱是否已被注册*/
+ (void)checkBindeEmailWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;

/**检查机构证件号是否被注册*/
+ (void)checkOrganCodeWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**检查个人证件号是否被注册*/
+ (void)checkPersonIDWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**校验资金密码，登录密码是否正确*/
+ (void)checkPwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**修改绑定邮箱*/
+ (void)modifyEmailWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**修改资金密码*/
+ (void)modifyFundPwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**修改登录密码*/
+ (void)modifyLoginPwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**设置手势密码 */
+ (void)modGesturePwd:(NSString *)loginPass GesturePwd:(NSString *)gesturePwd callBack:(CallbackBlock)callback;
/**效验手势密码*/
+ (void)checkGesturePwd:(NSString *)gesturePwd callBack:(CallbackBlock)callback;
/**修改绑定手机号码*/
+ (void)modifyBondiedPhoneWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**设置绑定邮箱*/
+ (void)settingEmailWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**初始化资金密码,第一次设置不传验证码*/
+ (void)initFundPwdlWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**设置资金密码*/
+ (void)settingFundPwdlWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**找回登录密码验证*/
+ (void)retrievePwdWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**发送邮箱验证码*/
+ (void)sendEmailMessageWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;
/**查询所有省份*/
+ (void)qryCityListCallBack:(CallbackBlock)callback;
/**查询当前用户最后一次信息修改审核详情,1.未提交 2.审核通过 3.审核中 4.审核驳回*/
+ (void)qryMembInfoUpdateAuditInfoWithParams:(NSDictionary*)params callBack:(CallbackBlock)callback;


#pragma mark ---- 首页
/**获取首页中的所有数据*/
+ (void)getHomePageDataCallBack:(CallbackBlock)callback;

#pragma mark ---- 页面状态检测
/**页面状态检测*/
+ (void)checkPageStateWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback;

#pragma mark ---- 申购接口请求
/**新品申购、往期申购、申购品种详情*/
+ (void)GetPurchaseListWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback;
/**普通申购页面获取可申购数量信息*/
+ (void)GetPurchaseInfoWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback;
/**普通申购、配售确认计算费用*/
+ (void)CalculatePurchaseInfoWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback;
/**普通申购确认申购*/
+ (void)SaveApplyBuyOrderWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback;
/**配售申购确认配售*/
+ (void)SurePlacingByUserWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback;
/**放弃配售*/
+ (void)CancelPlacingByUserWithParams:(NSDictionary *)params callBack:(CallbackBlock)callback;
/**获取首页申购数据*/
+ (void)GetFirstPagePurchaseListCallBack:(CallbackBlock)callback;
/**申购记录列表*/
+ (void)QueryApplyBuyOrderByParam:(NSDictionary *)params callBack:(CallbackBlock)callback;
/**获取申购记录列表详情*/
+ (void)queryApplyBuyOrderDetailByParam:(NSDictionary *)params callBack:(CallbackBlock)callback needCache:(BOOL)need;
/**查询用户是否有配售的产品*/
+ (void)QueryPlacingByUserIdCallBack:(CallbackBlock)callback;
/**配售解冻细则*/
+ (void)QueryUnfreezeRuleByRuleId:(NSString *)ruleId callBack:(CallbackBlock)callback;
/**查询单个产品的配售信息*/
+ (void)QueryPlacingByUserIdByParam:(NSDictionary *)params callBack:(CallbackBlock)callback;

/**获取当天的中签分享信息*/
+ (void)GetUserLuckyInfoByParam:(NSDictionary *)params callBack:(CallbackBlock)callback;

#pragma mark --记录查询
/**获取出入金记录*/
+ (void)GetPaymentInfoRecordsParams:(NSDictionary *)params CallBack:(CallbackBlock)callback needCache:(BOOL)need;
/**出入金详情*/
+ (void)GetPaymentInfoDetailsParams:(NSDictionary *)params CallBack:(CallbackBlock)callback needCache:(BOOL)need;
#pragma mark --资产
/**获取用户资产*/
+ (void)GetUserTotalAccountParams:(NSDictionary*)params CallBack:(CallbackBlock)callback needCache:(BOOL)need;
/**获取用户资金*/
+ (void)GetUserAccountFunds:(NSDictionary*)params CallBack:(CallbackBlock)callback needCache:(BOOL)need;
#pragma mark -- 交易
/**获取交易税率明细最小费用*/
+ (void)QueryCertificateIssuingWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**通过ID查询买单详情*/
+ (void)QryBuyDetailsWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**通过ID查询卖单详情*/
+ (void)QrySellDetailsWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**获取买和卖方手续费*/
+ (void)CaculateTaxWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**获取持仓列表*/
+ (void)GetPositionListsWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback needCache: (BOOL)needCache;
/**获取最大可买*/
+ (void)getMaxCanBuyWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**买入委托*/
+ (void)entrusBuyWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**卖出委托*/
+ (void)entrusSellWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**冻结解冻历史列表*/
+ (void)GetProdFrozenInfoWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**冻结解冻详情数据*/
+ (void)GetProdFrozenDetailWithParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**交易代码搜索*/
+(void)GetIssueListForFrontSearchKey:(NSString*)key callback:(CallbackBlock)callback;

#pragma mark - 点选交易
/**点选买卖*/
+ (void)ManualDealParams:(NSDictionary*)params CallBack:(CallbackBlock)callback;
/**委托详情*/
+ (void)QueryEntrustListDetailEntrustType:(NSString *)entrustType IssueCode:(NSString *)issueCode Price:(NSString *)price CallBack:(CallbackBlock)callback;
#pragma mark ---- 历史成交、当日委托
/**历史成交列表*/
+ (void)QueryTradeRecordParams:(NSDictionary *)params CallBack:(CallbackBlock)callback;

/**历史成交详情，买入、卖出、协议买、协议卖*/
+ (void)QueryTradeRecordDetailParams:(NSDictionary *)params CallBack:(CallbackBlock)callback;

/**当日委托列表*/
+ (void)QueryTradeRecordOfTodayParams:(NSDictionary *)params CallBack:(CallbackBlock)callback;

#pragma mark ---- 绑卡、出入金
/**出入金时间 101:民生，102：钱宝*/
+(void)GetInputOutFundTimeCallBack:(CallbackBlock)callback;
/**渠道开户*/
+(void)OpenChannelAccountParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
/**绑卡*/
+(void)BindBankCardParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
/**获取出金手续费*/
+(void)QueryFeeParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
/**出金*/
+(void)OutFundParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
/**入金*/
+(void)InputFundParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
/** 获取绑卡信息-----1:交易会员账户3:发行商募集资金账户7:运营公司账户8:市场公司账户  iAccountType*/
+(void)GetBindCardInfoParams:(NSDictionary *)params CallBack:(CallbackBlock)callback NeedCache:(BOOL)need;
/**判断是否可以解绑*/
+(void)CanUNBindBankCardCallBack:(CallbackBlock)callback;
/**解绑*/
+(void)UNBindBankCardParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
/**更新明生银行状态*/
+(void)UpdateTradeUserFundAccParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
+(void)BankOpenAccountFailParams:(NSDictionary *)parmas CallBack:(CallbackBlock)callback;
#pragma mark ---- 行情
/**获取某个批次涨跌幅*/
+(void)queryChgConfigStoke:(NSString *)stoke callback:(CallbackBlock)callback;
/**获取行情列表*/
+(void)MarketListCallback:(CallbackBlock)callback needCache:(BOOL)need;
/**获取实时行情--不包括名称*/
+(void)MarketRealtimeStoke:(NSString *)stoke callback:(CallbackBlock)callback needCache:(BOOL)need;
/**获取产品名称委托发售方等*/
+(void)QueryAssetIssuerInfoForTradeStock:(NSString *)stock callback:(CallbackBlock)callback Need:(BOOL)need;
/**获取行情 分时 k 等*/
+(void)MarketHistoryStoke:(NSString *)stoke  Cycle:(NSString *)cycle callback:(CallbackBlock)callback;
/**获取盘口数据数据*/
+(void)QueryEntrustListParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**获取逐笔交易数据*/
+(void)MarketOrderParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**获取交易时间-----stock没有传nil*/
+(void)isTransactionTimeStock:(NSString *)stock callback:(CallbackBlock)callback;
#pragma mark ---- 委托买入卖出撤单
/**委托买单撤销*/
+(void)CancelBuyOrderParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**委托卖单撤销*/
+(void)CancelSellOrderParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;

#pragma mark - 经济会员
/**申请成为经济会员*/
+(void)applyManagerMemberWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**再次申请成为经济会员*/
+(void)againApplyManagerMemberWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**查询经纪会员申请失败原因*/
+(void)queryFailReasonForApplyManagerMemberWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**经济会员主界面初始化*/
+(void)mangerMemberMianInterfaceWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**成长记录数据*/
+(void)queryUserHistoryWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**搜索直属/下级会员*/
+(void)SearchAccountWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**直属/下级会员详情列表*/
+(void)AgentMemberDetailsWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**获取默认经纪会员未点亮图标*/
+(void)getDefaultHierarchyInfoByTypeWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**根据会员编码获取等级信息*/
+(void)getHierarchyInfoListByUserCodeWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**经纪会员关系图*/
+(void)QueryFrontAgentUserRelationShipWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**推荐会员列表*/
+(void)QryRecommendMemberPageInfoWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
#pragma mark - 我的自选
/**查询自选数据列表*/
+(void)qryOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**查询自选数据列表可缓存*/
+(void)qryOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache;
/**添加自选*/
+(void)addOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**删除自选*/
+(void)removeOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**是否自选*/
+(void)IsOptionalWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;

#pragma mark - 消息相关
/**获取消息列表*/
+(void)MessageListWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache;
/**删除消息*/
+(void)DeleteMessageWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**设置消息已读*/
+(void)SettingMessageReadedWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**获取未读消息数*/
+ (void)getMessUnreadCount:(void (^)(BOOL, NSString *, id))callback;
/**获取弹窗消息列表*/
+ (void)ListPushWithPopupCallback:(CallbackBlock)callback;



#pragma mark - 分享
/**分享*/
+(void)OperationShareWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache;


#pragma mark ---- 公共接口
/**邀请二维码*/
+ (void)inviteQrCodeWithParmas:(NSDictionary *)params callback:(CallbackBlock)callback;
/**关注微信公众号*/
+ (void)getQRCodeCallback:(CallbackBlock)callback;
/**获取公告弹框*/
+ (void)PopMessagesCallback:(CallbackBlock)callback;
/**提示语版本版本*/
+ (void)GetHintVersionCallback:(CallbackBlock)callback;
/**码表信息*/
+ (void)GetHintCollectionCallback:(CallbackBlock)callback;
/**获取文章列表  该字段可输入标题，品种编号，品种名称 stoke*/
+ (void)GetProductInformationKeyStokeCode:(NSString *)stoke Callback:(CallbackBlock)callback;


#pragma mark ---- 清除用户sessionId
/**清除用户sessionId*/
+ (void)RemoveTokenCallback:(CallbackBlock)callback;
/**获取所有协议*/
+ (void)GetParamterValueCallSpecialCode:(NSString *)specialCode Back:(CallbackBlock)callback;
#pragma mark ---- 获取首页文章列表
/**获取首页轮播图*/
+ (void)GetTopTemplateJsonCallback:(CallbackBlock)callback;
/**获取首页文章列表*/
+ (void)ListPageBySpecialCodePublishCallback:(CallbackBlock)callback;
/**获取未读消息数*/
+ (void)GetUnreadAllCallback:(CallbackBlock)callback;
#pragma mark ---- 协议转让
/**获取协议转让可转让列表接口*/
+(void)GetNegoSelectListIssude:(NSString *)issueCode CallBack:(CallbackBlock)callback;
/**查询品种可转让数量与规则信息*/
+(void)GetNegoNumDetailDescIssude:(NSString *)issueCode CallBack:(CallbackBlock)callback;
/**通过委托单号查解冻规则*/
+(void)GetEntrustNegoNumDetailDescEntrustId:(NSString *)entrustId  CallBack:(CallbackBlock)callback;
/**根据转让数量与同比转让比例计算冻结与非冻结数量*/
+(void)ReCaculateTogeNegoPro:(NSString *)togeNegoPro Total:(NSString*)total CallBack:(CallbackBlock)callback;
/**协议卖*/
+ (void)TransferSellParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**协议转让时间*/
+(void)IsTransferTimeParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback;
/**协议买*/
+ (void)TransferBuyParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**协议当日委托列表*/
+ (void)QueryTransferRecordOfTodayParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**协议转让撤销*/
+(void)CancelTransferOrderEntrustId:(NSString *)entrustId CallBack:(CallbackBlock)callback;
/**效验买方买入金额*/
+(void)IsTransferBuyUserCode:(NSString *)buyId Money:(NSString *)moeny CallBack:(CallbackBlock)callback;
/**查询品种可转让数量与规则信息*/
+(void)GetDealNegoNumDetailDescOrdId:(NSString *)orderId CallBack:(CallbackBlock)callback;
#pragma mark - 前端权限验证接口
/**前端权限验证接口*/
+ (void)ValidTradePermissionWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
#pragma mark - 资金流水
/**资金流水*/
+(void)GetFundRecordFlowWithParmas:(NSDictionary *)parmas callback:(CallbackBlock)callback needCache:(BOOL)needCache;
#pragma mark - 获取最小变动价格
+ (void)GetAllPriceRangeDataWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
#pragma mark - 佣金相关
/**每日佣金*/
+ (void)CommissionEverydayDataWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**品种返佣*/
+ (void)CommissionDetailsDataWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;




#pragma mark - 新开户流程接口
/**个人实名认证提交资料*/
+ (void)ApplyPersonAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**个人实名认证完善资料*/
+ (void)UpdatePersonInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**个人实名认证修改资料*/
+ (void)UpdatePersonAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**机构实名认证提交资料*/
+ (void)ApplyOrganAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**机构实名认证修改资料*/
+ (void)UpdateOrganAuthenNewWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;
/**机构实名认证完善资料*/
+ (void)UpdateOrganInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;

#pragma 中证
/**登记*/
+ (void)RegisterAssetInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;

/**获取登记界面信息*/
+ (void)GetZzUserAssetInfoWithParams:(NSDictionary*)params Callback:(CallbackBlock)callback;

/**登记记录*/
+ (void)QueryRegisterAssetRecordByPageParams:(NSDictionary*)params Callback:(CallbackBlock)callback;

/**中证入金获取最大最小值和随机金额*/
+ (void)DepositInitCallback:(CallbackBlock)callback;
/**中证入金接口*/
+ (void)ReqInMoneyRemit:(NSString *)money Callback:(CallbackBlock)callback;
/**查询银行列表*/
+ (void)GetBankListCallback:(CallbackBlock)callback;
/**查询银行支行列表*/
+ (void)GetBrankBranchListBankCode:(NSString *)bankCode CityCode:(NSString *)cityCode Callback:(CallbackBlock)callback;
/**<获取城市列表*/
+ (void)GetCityListCallback:(CallbackBlock)callback;
/**判断是否登记成功 返回"0004", "会员账户不存在" "0002", "未进行实名认证"*/
+ (void)RealNameRegistCallback:(CallbackBlock)callback;
/**中证绑卡接口是否需要验证码*/
+ (void)ZzsdbindBankCardParams:(NSDictionary*)params Call:(CallbackBlock)callback NeedVerification:(BOOL)bol;
/**获取绑卡信息接口接口*/
+ (void)ZzsdGetBindCardInfo:(CallbackBlock)callback;
/**获取汇款单详情*/
+ (void)GetOneRemit:(CallbackBlock)callback;
/**取消汇款单*/
+ (void)CloseReqInMoneyRemitOrder:(NSString *)order Caback:(CallbackBlock)callback;
/**出金接口 1.交易会员 2.经纪会员*/
+ (void)ReqOutMoney:(NSString *)money iAccountType:(NSString*)itype Caback:(CallbackBlock)callback;
/**效验验证码*/
+(void)VerifyCheckCode:(NSString*)checkCode Caback:(CallbackBlock)callback;
@end
