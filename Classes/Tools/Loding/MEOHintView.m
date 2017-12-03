//
//  MEOHintView.m
//  SEUDApp
//
//  Created by Meonardo on 16/1/27.
//  Copyright © 2016年 chuangwuxian. All rights reserved.
//

#import "MEOHintView.h"
#import "Masonry.h"
#import "UIColor+helper.h"

@interface MEOHintView ()
{
    UIView *_controllerView;
}
@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UILabel *hintLabel;
@property (nonatomic, strong) UIImageView *indicator;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation MEOHintView

+ (instancetype)sharedView
{
    static dispatch_once_t once;
    static MEOHintView *sharedView;
    dispatch_once(&once, ^ {
        sharedView = [[self alloc] init];
    });
    return sharedView;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.frame = CGRectZero;
        [self setUpBaseView];
        [self setUpHintLabel];
    }
    return self;
}

#pragma mark -
#pragma mark Show Method

+ (void)showHintViewWith:(nonnull NSString *)hintTitle onView:(nonnull UIView *)view
{
    if ([hintTitle isKindOfClass:[NSString class]] && view)
    {
        [self sharedView];
        [[self sharedView] dismiss];
        [[self sharedView] updatePosition:hintTitle onView:view];
        [[self sharedView] performSelector:@selector(dismiss) withObject:nil afterDelay:3.0f];
    }
}

+ (void)showHintViewWith:(nonnull NSString *)hintTitle
{
    UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIView *alerat = [keyWindow viewWithTag:9134];
    if (alerat&&!alerat.hidden) {//有弹窗就把tost去掉
        return;
    }
    if ([hintTitle isKindOfClass:[NSString class]])
    {
        UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
        [self sharedView];
        [[self sharedView] dismiss];
        [[self sharedView] updatePosition:hintTitle onView:window];
        [[self sharedView] performSelector:@selector(dismiss) withObject:nil afterDelay:3.0f];
    }
}

+ (void)showStatusWith:(NSString *)statusString
{
    [self sharedView];
    [[self sharedView] setUpStatusView:statusString onView:[[UIApplication sharedApplication].windows lastObject]];
    [[self sharedView] performSelector:@selector(dismiss) withObject:nil afterDelay:3.0f];
}

+ (void)showStatusWith:(NSString *)statusString inProgress:(CGFloat)progress userInteracted:(BOOL)userInteractable
{
    [self sharedView];
}

+ (void)dismiss
{
    for (UIView *v in [[UIApplication sharedApplication].windows lastObject].subviews)
    {
        if (v.tag == 1205)
        {
            [v removeFromSuperview];
            break;
        }
    }
}

#pragma mark -
#pragma mark Default Methods

- (void)setUpHintLabel
{
    _hintLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _hintLabel.backgroundColor = [UIColor clearColor];
    _hintLabel.adjustsFontSizeToFitWidth = YES;
    _hintLabel.textAlignment = NSTextAlignmentCenter;
    _hintLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    _hintLabel.numberOfLines = 0;
    _hintLabel.textColor = SEUD_Color_White_10;
    _hintLabel.font = [UIFont systemFontOfSize:15];

}

- (void)setUpBaseView
{
    _baseView = [[UIView alloc] initWithFrame:CGRectZero];
    _baseView.layer.cornerRadius = 5.0f;
    _baseView.backgroundColor = SEUD_Color_listBottom_gray_7;
    _baseView.layer.borderWidth = 1.0f;
    _baseView.layer.borderColor = SEUD_Color_White_10.CGColor;
}

- (void)setSubViewPosition
{
    CGSize size = _controllerView.bounds.size;
    
    [_controllerView addSubview:_baseView];
    
    [_baseView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_controllerView);
        make.size.equalTo(MASBoxValue(CGSizeMake(size.width - 100, 20)));
    }];
    
    [_baseView addSubview:_hintLabel];
}

- (UIImageView *)indicator
{
    UIImage *image = [UIImage imageNamed:@""];
    _indicator = [[UIImageView alloc] initWithImage:image];
    return _indicator;
}

- (UILabel *)statusLabel
{
    _statusLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _statusLabel.backgroundColor = [UIColor clearColor];
    _statusLabel.adjustsFontSizeToFitWidth = YES;
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    _statusLabel.numberOfLines = 0;
    _statusLabel.textColor = SEUD_Color_White_10;
    _statusLabel.font = [UIFont systemFontOfSize:14];
    return _statusLabel;
}

- (UIView *)contentView
{
    _contentView = [[UIView alloc] initWithFrame:CGRectZero];
    _contentView.layer.cornerRadius = 8.0f;
    _contentView.backgroundColor = SEUD_Color_Bg_Black_6;
    _contentView.layer.borderWidth = 1.0f;
    _contentView.layer.borderColor = SEUD_Color_Deep_Gray_13.CGColor;
    return _contentView;
}

- (void)setUpStatusView:(NSString *)statusString onView:(UIView *)view
{
    BOOL flag = NO;
    UIView *backgroundView = nil;
    for (UIView *v in view.subviews)
    {
        if (v.tag == 1205)
        {
            backgroundView = v;
            flag = YES;
            break;
        }
    }
    
    if (!flag)
    {
        backgroundView = [[UIView alloc] initWithFrame:view.bounds];
        backgroundView.tag = 1205;
        backgroundView.backgroundColor = [UIColor colorWithHexString:@"0e0f1a" withAlpha:0.2f];
    }
    [view addSubview:backgroundView];
    UIView *contentView = [self contentView];
    UILabel *statusLabel = [self statusLabel];
    
    [backgroundView addSubview:contentView];
    UIImageView *indicator = [self indicator];
    [contentView addSubview:indicator];
    [contentView addSubview:statusLabel];
    statusLabel.text = statusString;
    
    CGFloat height = [self stringConvertToHeight:statusString];
    
    CGFloat indicatorHeight = 35;
    CGFloat contentViewHeight = 90;
    
    if (indicatorHeight + 5 + height > contentViewHeight)
    {
        contentViewHeight = (indicatorHeight + 5 + height);
    }
    
    [contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(backgroundView);
        make.size.equalTo(MASBoxValue(CGSizeMake(120, contentViewHeight)));
    }];
    
    [indicator mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.top.equalTo(@(15));
        make.size.equalTo(MASBoxValue(CGSizeMake(indicatorHeight, indicatorHeight)));
    }];
    
    [statusLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(indicator.mas_bottom).offset(5);
        make.centerX.equalTo(contentView);
        make.size.equalTo(MASBoxValue(CGSizeMake(100, height)));
    }];
}

#pragma mark -
#pragma mark Update Method

- (void)updatePosition:(NSString *)string onView:(UIView *)view
{
    CGFloat stringWidth = 0.0f;
    CGFloat stringHeight = 0.0f;
    _hintLabel.text = string;
    _controllerView = view;
    
    [self setSubViewPosition];
    
    if(string)
    {
        CGSize constraintSize = CGSizeMake(ScreenWidth - 90, 400.0f);
        CGRect stringRect;
        if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
        {
            stringRect = [string boundingRectWithSize:constraintSize options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)
                attributes:@{NSFontAttributeName: _hintLabel.font}
                context:NULL];
        }
        else
        {
            CGSize stringSize;
            if ([string respondsToSelector:@selector(sizeWithAttributes:)])
            {
                stringSize = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:_hintLabel.font.fontName size:_hintLabel.font.pointSize]}];
            }
            else
            {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
                stringSize = [string sizeWithFont:_hintLabel.font constrainedToSize:CGSizeMake(ScreenWidth - 100, 400.0f)];
#pragma clang diagnostic pop
            
            stringRect = CGRectMake(0.0f, 0.0f, stringSize.width, stringSize.height);
            }
        }
        stringWidth = stringRect.size.width;
        stringHeight = ceil(CGRectGetHeight(stringRect));
        
        [_hintLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_baseView);
            make.size.equalTo(MASBoxValue(CGSizeMake(stringWidth + 20, stringHeight)));
        }];
        
        [_baseView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_controllerView);
            make.size.equalTo(MASBoxValue(CGSizeMake(stringWidth + 20 + 5, stringHeight + 10 * 2)));
        }];
    }
}

#pragma mark -
#pragma mark Dismiss Method

- (void)dismiss
{
    if (_baseView.superview != nil)
    {
        [_baseView removeFromSuperview];
    }
    [MEOHintView dismiss];
}

- (CGFloat)stringConvertToHeight:(NSString *)string
{
    CGFloat stringWidth = 0.0f;
    CGFloat stringHeight = 0.0f;
    if(string)
    {
        CGSize constraintSize = CGSizeMake(100, 400.0f);
        CGRect stringRect;
        if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
        {
            stringRect = [string boundingRectWithSize:constraintSize options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)
                                           attributes:@{NSFontAttributeName: _hintLabel.font}
                                              context:NULL];
        }
        else
        {
            CGSize stringSize;
            if ([string respondsToSelector:@selector(sizeWithAttributes:)])
            {
                stringSize = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:_hintLabel.font.fontName size:_hintLabel.font.pointSize]}];
            }
            else
            {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
                stringSize = [string sizeWithFont:_hintLabel.font constrainedToSize:CGSizeMake(100, 400.0f)];
#pragma clang diagnostic pop
                
                stringRect = CGRectMake(0.0f, 0.0f, stringSize.width, stringSize.height);
            }
        }
        stringWidth = stringRect.size.width;
        stringHeight = ceil(CGRectGetHeight(stringRect));
        return stringHeight;
    }
    else
    {
        return 0;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

    
@end
