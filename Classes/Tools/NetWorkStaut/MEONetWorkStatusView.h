//
//  MEONetWorkStatusView.h
//  SEUDApp
//
//  Created by Meonardo on 16/2/22.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MEONetWorkStatusView;

typedef void(^NetWorkActionEventsBlock)(MEONetWorkStatusView *netWorkView);

typedef NS_ENUM(NSInteger, NetWorkStateDes){
    NetWorkStateDesDisconnected,
    NetWorkStateDesNoInternet = 1,
    NetWorkStateDesTimeOut = 2
};

@interface MEONetWorkStatusView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (nonatomic, assign) BOOL needShowDelayInfo;
@property (nonatomic, assign) NetWorkStateDes statusDes;
@property (strong, nonatomic) IBOutlet UIButton *refreshButton;
@property (weak, nonatomic) IBOutlet UIView *goBackBtn;

@property(nonatomic, copy) NetWorkActionEventsBlock netWorkEventBlock;
- (void)setNetWorkEventBlock:(NetWorkActionEventsBlock)netWorkEventBlock;

@end
