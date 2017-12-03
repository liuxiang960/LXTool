//
//  DemonTableViewCell.h
//  HouseCommunity
//
//  Created by 程凯 on 15/11/5.
//  Copyright © 2015年 程凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"
#import "SeudPublic.h"
#import "SEUDColor.h"
#import "SEUDFont.h"
typedef NS_ENUM(NSUInteger, DemonTableViewCellSeparatorStyle)/**<自定义线条样式*/
{
    DemonTableViewCellSeparatorFull,/**<占满全屏幕*/
    DemonTableViewCellSeparatorSystem,/**<系统样式*/
    DemonTableViewCellSeparatorLeft,/**<左缩进*/
};


/*!
 *  @author 程凯, 15-12-16 16:12:16
 *
 *  @brief 自带底部分割线的cell，另外自带了箭头(默认隐藏);
 *
 *  @since 1.0
 */
@interface BaseTableViewCell : UITableViewCell
@property(nonatomic,strong,readonly) UIImageView *rightIndicator;/**<箭头属性*/
@property (nonatomic, assign) CGFloat separatorLineHeight;/**< 分割线的宽度 */

#pragma mark -
#pragma mark 显示右边按钮
- (void)showCellIndicator:(BOOL)isShow;/**<是否显示右边的箭头按钮*/

#pragma mark -
#pragma mark 底部分割线
- (void)setDemonSeparatorStyle:(DemonTableViewCellSeparatorStyle)separatorStyle;/**<设置分割线样式*/
- (void)setSeparatorLineColor:(UIColor *)color;/**<设置分割线的颜色*/
- (void)setSeparatorLineHide:(BOOL)isHide;/**<隐藏或显示分割线*/
- (void)setSeparatorLineLeft:(CGFloat)padding;/**<分割线左缩进*/
- (void)setSeparatorLineInset:(UIEdgeInsets)inset;/**<分割线布局*/

#pragma mark -
#pragma mark 顶部分割线
- (void)setTopLineStyle:(DemonTableViewCellSeparatorStyle)separatorStyle;
- (void)setTopSeparatorLineColor:(UIColor *)color;/**<设置分割线的颜色*/
- (void)setTopSeparatorLineHide:(BOOL)isHide;/**<隐藏或显示分割线*/
- (void)setTopSeparatorLineLeft:(CGFloat)padding;/**<分割线左缩进*/
- (void)seToptSeparatorLineInset:(UIEdgeInsets)inset;/**<分割线布局*/

#pragma mark - 
#pragma mark cell的高度
+(CGFloat)heightForCell;

#pragma mark - 
#pragma mark 设置cell的数据
-(void)loadData:(id)model;
#pragma mark 设置cell的数据设置4个放下线
-(void)isHidenTopLine:(BOOL)topLine BottomLine:(BOOL)bottomLine LeftLine:(BOOL)leftLine RightLine:(BOOL)rightLine Color:(UIColor *)color lineWight:(CGFloat)wight;


@end
