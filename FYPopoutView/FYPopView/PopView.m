//
//  PayView.m
//  LibsDemo
//
//  Created by 樊杨 on 2017/6/9.
//  Copyright © 2017年 YHCRT.FY. All rights reserved.
//

#import "PopView.h"
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
@interface PopView()

@property(nonatomic,strong)UIView * backView;//背景遮罩

@end

@implementation PopView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self steupConfig];
    }
    return self;
}

-(void)steupConfig{
    
    self.backColor = [UIColor whiteColor];
    self.isCorneradius = YES;
    self.isShowAnimation = YES;
    self.locationType = LocationFromMiddle;
    self.isShowTextImage = YES;
    self.isShowText = YES;
    [self createUI];
}

-(void)createUI{
    
    self.backgroundColor = self.backColor;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

-(void)layoutSubviews{
    
    if (self.isShowTextImage) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2.0-10, self.bounds.size.height/2.0-20, 20, 20)];
        imageView.image = self.textImage;
        [self addSubview:imageView];
    }
    if (self.isShowText) {
        UILabel * textlabel = [[UILabel alloc]init];
        if (self.isShowText) {
           textlabel.frame = CGRectMake(0, self.bounds.size.height/2.0+5, self.bounds.size.width, self.bounds.size.height/2.0-5);
        }else{
            textlabel.frame = self.frame;
        }
        
        textlabel.text = self.text;
        textlabel.textColor = [UIColor blackColor];
        textlabel.numberOfLines = 0;
        textlabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textlabel];
    }
    
}

-(void)tapClick{
    //关闭背景
    [self hiddenAnimation];

    [_backView removeFromSuperview];

}

-(void)showAnimation{
    
    //加载背景遮罩
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _backView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [_backView addGestureRecognizer:tap];
    [[UIApplication sharedApplication].keyWindow addSubview:_backView];
    [_backView addSubview:self];
    
    if (self.locationType == LocationFromTop) {
        [self topAnimation];
    }else if (self.locationType == LocationFromBottom){
        [self bottomAnimation];
    }else{
        [self middleAnimation];
    }
    
}

-(void)middleAnimation{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    popAnimation.removedOnCompletion = NO;
    
    popAnimation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:popAnimation forKey:nil];

}

#pragma mark 顶部出现动画
-(void)topAnimation{
    //动画效果
    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.duration = 0.1;
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(self.frame.origin.y);
    basicAnimation.removedOnCompletion = NO;
    [self.layer addAnimation:basicAnimation forKey:@"position.y"];
}

#pragma mark 底部出现动画
-(void)bottomAnimation{
    //动画效果
    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.duration = 2;
    basicAnimation.fromValue = @(kScreenHeight);
    basicAnimation.toValue = @(self.frame.origin.y);
    basicAnimation.removedOnCompletion = NO;
    [self.layer addAnimation:basicAnimation forKey:@"position.y"];
}

#pragma mark 消失动画
-(void)hiddenAnimation{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:  CATransform3DIdentity],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3f, 1.3f, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)]];
    popAnimation.keyTimes = @[@1.0f, @0.75f, @0.5f, @0.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    popAnimation.removedOnCompletion = NO;
    
    popAnimation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:popAnimation forKey:nil];
    

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
