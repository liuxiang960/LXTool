
//
//  ttwzNetworkTODetermine.m
//  ttwz
//
//  Created by 刘湘 on 14-10-30.
//  Copyright (c) 2014年 千里及. All rights reserved.
//

#import "ttwzNetworkTODetermine.h"
#import "Reachability.h"
@interface ttwzNetworkTODetermine()
{
    NSString *stat;

}
@end

@implementation ttwzNetworkTODetermine
//异步网络判断
-(void)NetworkToDeterMine
{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
            {
                NSLog(@"StatusUnknown");
                stat=@"StatusUnknown";
                DE.NetworkStat = NO;
                break;
            }
            case 0:
            {
                NSLog(@"NotReachable");
                stat=@"NotReachable";
                DE.NetworkStat = NO;
                break;
            }
            case 1:
            {
                NSLog(@"ReachableViaWWAN");
                stat=@"ReachableViaWWAN";
                DE.NetworkStat = YES;
                break;
            }
            case 2:
            {
                NSLog(@"ReachableViaWiFi");
                stat=@"ReachableViaWiFi";
                DE.NetworkStat = YES;
                break;
            }
            default:
                break;
        }
        
    }];
}


+(id)shardNetwork
{
    static ttwzNetworkTODetermine* sharedInstance=nil;
    if (sharedInstance==nil) {
        sharedInstance=[[ttwzNetworkTODetermine alloc] init];
    }
    return sharedInstance;
}

-(NSString *)getNetworkstaus
{
    return  stat;
}
@end



