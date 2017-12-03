//
//  OperateService.h
//  SEUDApp
//
//  Created by Souyun on 16/8/23.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import "BaseService.h"

@interface OperateService : BaseService

+(void)challenge:(NSString *)name callback:(void (^)(NSString *desc))callback;
+(void)popMessages:(void (^)(NSArray* list))callback;
+(void)validTradePermission:(NSString*)code;

+(void)beginLogPageView:(NSString*)name;
+(void)endLogPageView:(NSString*)name;
+(void)clickButton:(NSString*)name;
+(void)behaviorEvent:(NSString*)name value:(NSString*)value;

@end
