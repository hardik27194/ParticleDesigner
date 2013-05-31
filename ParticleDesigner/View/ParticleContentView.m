//
//  ParticleContentView.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-9.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ParticleContentView.h"

@implementation ParticleContentView

- (void)awakeFromNib {
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterCell = [CAEmitterCell emitterCell];
    
    [self.layer addSublayer:self.emitterLayer];
    self.emitterLayer.emitterCells = [NSArray arrayWithObject:self.emitterCell];
    
    [self initEmitter];
    [self initParticle];
}

- (void)initEmitter {
    // 渲染模式
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    // 发射器位置
    _emitterLayer.position = self.center;
    
    // 发射器形状
    _emitterLayer.emitterShape = kCAEmitterLayerPoint;
    
    // 发射器Z轴坐标
    _emitterLayer.zPosition = 0.0;
    
    // 发射器的形状深度, 根据emitterShape, 这个值可能被忽略.
    _emitterLayer.emitterDepth = 0.0;
    
    // 发射器的大小, 根据emitterShape, 这个值可能被忽略.
    _emitterLayer.emitterSize = CGSizeMake(0.0, 0.0);
    
    // 缩放比例
    _emitterLayer.scale = 1.0;
    
    // 用于初始化随机数产生的种子
//    _emitterLayer.seed = 0;
    
    // 自旋速率
    _emitterLayer.spin = 1.0;
    
    // 粒子速度
    _emitterLayer.velocity = 2.0;
    
    // 粒子产生速率
    _emitterLayer.birthRate = 3.0;
    
    // 发射模式
    _emitterLayer.emitterMode = kCAEmitterLayerVolume;
    
    // 粒子寿命
    _emitterLayer.lifetime = 1.0;
    
    // 粒子是否平展在层上 (YES的话会展现成三维的)
    _emitterLayer.preservesDepth = NO;
}

- (void)initParticle {
    // 粒子纹理
    _emitterCell.contents = (__bridge_transfer id)([[UIImage imageNamed:@"particle.png"] CGImage]);
    
    // 粒子绘制的矩形
    _emitterCell.contentsRect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    
    // 粒子发射的子粒子
    _emitterCell.emitterCells = nil;
    
    // 粒子是否被渲染
    _emitterCell.enabled = YES;
    
    // 粒子的颜色
    _emitterCell.color = [[UIColor colorWithRed:0 green:0.2 blue:0.9 alpha:0.5] CGColor];
    
    // 一个粒子的颜色red 能改变的范围
    _emitterCell.redRange = 0;
    
    // 一个粒子的颜色green 能改变的范围
    _emitterCell.greenRange = 0;
    
    // 一个粒子的颜色blue 能改变的范围
    _emitterCell.blueRange = 0;
    
    // 一个粒子的颜色alpha能改变的范围
    _emitterCell.alphaRange = 0;
    
    // 粒子的颜色red 在生命周期内每秒的改变速率
    _emitterCell.redSpeed = 0;
    
    // 粒子的颜色green 在生命周期内每秒的改变速率
    _emitterCell.greenSpeed = 0;
    
    // 粒子的颜色blue 在生命周期内每秒的改变速率
    _emitterCell.blueSpeed = 0;
    
    // 粒子的颜色alpha 在生命周期内每秒的改变速率
    _emitterCell.alphaSpeed = 0;
    
    // 增大自身的过滤器
    _emitterCell.magnificationFilter = kCAFilterLinear;
    
    // 减小自身的过滤器
    _emitterCell.minificationFilter = kCAFilterLinear;
    
    // 减小自身的因子
    _emitterCell.minificationFilterBias = 0.0;
    
    // 缩放比例
    _emitterCell.scale = 0.5;
    
    // 缩放比例的范围
    _emitterCell.scaleRange = 0.2;
    
    // 缩放比例改变的速率
    _emitterCell.scaleSpeed = 0;
    
    // 粒子的名字
    _emitterCell.name = nil;
    
    // 不祥
    _emitterCell.style = nil;
    
    // 粒子旋转的速率, 以弧度每秒测量
    _emitterCell.spin = 0.5;
    
    // 粒子旋转的范围
    _emitterCell.spinRange = 0.0;
    
    // z轴的发射角度 (余弦)
    _emitterCell.emissionLatitude = 0.0 * M_PI / 180;
    
    // 在xy平面内的发射角 (方位角)
    _emitterCell.emissionLongitude = 0.0 * M_PI / 180;
    
    // 粒子发射角度的范围
    _emitterCell.emissionRange = 360 * M_PI / 180;
    
    // 粒子的生命周期, 以秒计量
    _emitterCell.lifetime = 1.0;
    
    // 粒子的生命周期范围
    _emitterCell.lifetimeRange = 1;
    
    // 每秒产生的粒子
    _emitterCell.birthRate = 80.0;
    
    // 粒子的初速度
    _emitterCell.velocity = 10.0;
    
    // 粒子初速度的范围
    _emitterCell.velocityRange = 20.0;
    
    // 粒子x轴的加速度
    _emitterCell.xAcceleration = 0.0;
    
    // 粒子y轴的加速度
    _emitterCell.yAcceleration = 0.0;
    
    // 粒子z轴的加速度
    _emitterCell.zAcceleration = 0.0;
}


- (void)layoutSubviews {
    self.emitterLayer.position = self.center;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
