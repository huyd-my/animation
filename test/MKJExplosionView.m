//
//  MKJExplosionView.m
//  test
//
//  Created by apple7 on 16/12/5.
//  Copyright © 2016年 apple7. All rights reserved.
//

#import "MKJExplosionView.h"
#import <QuartzCore/QuartzCore.h>

@interface MKJExplosionView()

@property(nonatomic,strong) CAEmitterLayer *emitterLayer;

@end

@implementation MKJExplosionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) layoutSubviews {
    [super layoutSubviews];
    [self preparedAnimation];
}

-(void) preparedAnimation {
    self.clipsToBounds = NO;//default is NO
    self.userInteractionEnabled = NO;//default is NO
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = @"snow";
    cell.contents = (id)[UIImage imageNamed:@"favorite_hl"].CGImage;
    cell.lifetime = 10.0f;
    cell.lifetimeRange = 100.0;
    cell.birthRate = 10;
    cell.velocity = 10.0;
    cell.velocityRange = 10.0;
    cell.yAcceleration = 2;
    cell.scale = 0.5;
    cell.scaleRange = 0.02;
    
    
    _emitterLayer = [CAEmitterLayer layer];
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    _emitterLayer.emitterSize = CGSizeMake(self.bounds.size.width * 2, 100);
    _emitterLayer.emitterCells = @[cell];
    _emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    _emitterLayer.emitterMode = kCAEmitterLayerSurface;
    _emitterLayer.masksToBounds = NO;
    _emitterLayer.frame = [UIScreen mainScreen].bounds;
    _emitterLayer.emitterPosition = CGPointMake(100, -40);
    
    [self.layer addSublayer:_emitterLayer];
}

-(void) startAnimated {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.emitterLayer.beginTime = CACurrentMediaTime();
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"emitterCells.explosion.birthRate"];
        animation.fromValue = @(10);
        animation.toValue = @(100);
        [_emitterLayer addAnimation:animation forKey:nil];
        
    });
}

@end
