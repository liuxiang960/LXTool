//
//  LXComNetWorkView.m
//  SEUDApp
//
//  Created by 刘湘 on 17/5/16.
//  Copyright © 2017年 chuangwuxian. All rights reserved.
//

#import "LXComNetWorkView.h"

@implementation LXComNetWorkView
{
    UILabel *warinLable;
    NSTimer *pushTimer;
    NSInteger lastStopTime;//最后显示时间
}

+ (instancetype)sharedInstance
{
    if ([UIApplication sharedApplication].keyWindow) {
        static LXComNetWorkView *sharedInstance = nil;
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            sharedInstance = [[LXComNetWorkView alloc] init];
            [[UIApplication sharedApplication].keyWindow addSubview:sharedInstance];
            [sharedInstance mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.left.equalTo(@0);
                make.right.mas_equalTo([UIApplication sharedApplication].keyWindow.mas_right);
                make.height.equalTo(@64);
            }];
            [sharedInstance adds];
            sharedInstance.backgroundColor = SetRGBA(250, 58, 86, 1);
        });
        return sharedInstance;
    }
    return nil;
}

-(void)adds{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"lx_net_warn"];
    [self addSubview:imageView];
    warinLable = [[UILabel alloc] init];
    warinLable.textColor = [UIColor whiteColor];
    warinLable.textAlignment = NSTextAlignmentLeft;
    warinLable.font = SEUD_MediumFont_14;
    [self addSubview:warinLable];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
        make.top.equalTo(@30);
    }];
    
    [warinLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(10.0);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@20);
        make.top.equalTo(@30);
    }];
}

- (void)showTitle:(NSString *)til{
    if ([[SeudPublic getCurrentInterval] integerValue]-DE.intoFrontTime>3) {
        if (DE.NetworkStat) {
            
            [self performSelector:@selector(showView:) withObject:nil afterDelay:0];
        }else{
            [self showView:til];
        }
    }
}

-(void)showView:(NSString*)til{
    NSInteger currentTime = [[SeudPublic dateToFormatterString:[NSDate date]] integerValue];
    if(currentTime-lastStopTime<3){
        return;
    }
     lastStopTime = currentTime;
    if (!pushTimer) {
        [self creatTimer];
        if(!DE.NetworkStat){
        }
        til = @"当前网络有问题，请检查您的网络设置";
        [self show];
        warinLable.text = til;
    }

}

#pragma mark --timer 定时器
-(void)creatTimer{/**创建定时器*/
    if (!pushTimer) {
        pushTimer =[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(TimerRespons:) userInfo:nil repeats:NO];
        [DE.sectionTimer timeInterval];
    }
}

-(void)TimerRespons:(NSTimer*)time{
    [self allHidenData];
}

-(void)caculeTimer{/**销毁定时器*/
    [pushTimer invalidate];
    pushTimer = nil;
}


- (void)show{
//    self.bottom =0;
    [UIView animateWithDuration:1 animations:^{
//        self.bottom =64;
    } completion:^(BOOL finished) {
        self.hidden = NO;
    }];
}
- (void)hiden{
    if(!DE.NetworkStat){
        return;
    }
    [self caculeTimer];
    [self allHidenData];
}

-(void)allhiden{
    [UIView animateWithDuration:0.2 animations:^{
//        self.bottom =0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

-(void)allHidenData{
    [self caculeTimer];
    [self allhiden];
}

@end
