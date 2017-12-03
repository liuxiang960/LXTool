//
//  OperateService.m
//  SEUDApp
//
//  Created by Souyun on 16/8/23.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import "OperateService.h"
#import "DE.h"

static NSMutableDictionary* curLogTrack = nil;


@implementation OperateService{
   
}

+(void)challenge:(NSString *)name callback:(void (^)(NSString *desc))callback{
    if ( DE.isLogin ){
        [DE serverCall:@"operationChallenge" params:@{@"operationId":name,@"device":@"ios"} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
            return ;
            if ( success && data){
                NSDictionary *dataDic = (NSDictionary *)data;
                NSDictionary* map = dataDic[@"body"];
                if ( map[@"isShowChallenge"] && [map[@"isShowChallenge"]integerValue] == 1 && map[@"challengePage"] ){
                    NSString* url = map[@"challengePage"];
                    
                  
                    callback(@"成功");
                    
//                    callback(map[@"challengePage"]);
                }
            }
        }];
    }
}

+(void)popMessages:(void (^)(NSArray *))callback{
    [DE serverCall:@"popMessages" params:@{} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if ( success && data ){
            NSDictionary* map = (NSDictionary*)data;
            callback(map[@"data"]);
        }
    }];
}

+(void)validTradePermission:(NSString *)code{
    [DE serverCall:@"ValidTradePermission" params:@{@"permissionCode":code} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        if ( success && data ){
            NSDictionary* map = (NSDictionary*)data;
        }
    }];
}

#pragma mark -- user log track

+(NSString*)reportLogTrack{
    NSString* prevPageName = @"";
    if ( curLogTrack ){
        long long duration = [[NSDate date] timeIntervalSince1970]*1000 - [curLogTrack[@"duration"]longLongValue];
        [DE serverCall:@"behaviorTrack" params:@{@"ct":@"ios",@"did":[[[UIDevice currentDevice] identifierForVendor]UUIDString],@"userid":DE.userId,@"cid":curLogTrack[@"cid"],@"duration":@(duration),@"sourcetype":curLogTrack[@"sourcetype"],@"sourceid":curLogTrack[@"sourceid"]} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
            
        }];
        prevPageName = curLogTrack[@"cid"];
        curLogTrack = nil;
    }
    return prevPageName;
}

+(void)beginLogPageView:(NSString *)name{
    NSString* sourceid = [self reportLogTrack];
    curLogTrack = [[NSMutableDictionary alloc]init];
    curLogTrack[@"sourceid"] = sourceid;
    curLogTrack[@"sourcetype"] = @(0);
    curLogTrack[@"cid"] = name;
    curLogTrack[@"duration"] = [NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]*1000];
}

+(void)endLogPageView:(NSString *)name{
    [self reportLogTrack];
}

+(void)clickButton:(NSString *)name{
    if ( curLogTrack ){
        [DE serverCall:@"behaviorTrack" params:@{@"ct":@"ios",@"did":[[[UIDevice currentDevice] identifierForVendor]UUIDString],@"userid":DE.userId,@"cid":curLogTrack[@"cid"],@"sourcetype":curLogTrack[@"sourcetype"],@"sourceid":curLogTrack[@"sourceid"],@"act":name} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
            
        }];
    }
}

+(void)behaviorEvent:(NSString *)name value:(NSString *)value{
    [DE serverCall:@"behaviorTrack" params:@{@"ct":@"ios",@"did":[[[UIDevice currentDevice] identifierForVendor]UUIDString],@"userid":DE.userId,@"event":name,@"value":value} callback:^(BOOL success, int code, NSString *desc, NSObject *data) {
        
    }];
}

@end
