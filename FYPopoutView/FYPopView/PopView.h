//
//  PayView.h
//  LibsDemo
//
//  Created by 樊杨 on 2017/6/9.
//  Copyright © 2017年 YHCRT.FY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LocationFromMiddle=0,//中间弹出
    LocationFromTop,//从顶部出现
    LocationFromBottom//从底部出现
} AnimationLocationType;

@interface PopView : UIView

//视图的背景颜色
@property(nonatomic,strong)UIColor *backColor;

//视图是否有圆角
@property(nonatomic,assign)BOOL isCorneradius;

//视图弹出是否有动画效果
@property(nonatomic,assign)BOOL isShowAnimation;

//动画从什么位置出现
@property(nonatomic,assign)AnimationLocationType locationType;

//文字描述
@property(nonatomic,strong)NSString * text;

//图片
@property(nonatomic,strong)UIImage * textImage;

//是否显示文字
@property(nonatomic,assign)BOOL isShowText;

//是否显示图片
@property(nonatomic,assign)BOOL isShowTextImage;

-(void)showAnimation;

@end
