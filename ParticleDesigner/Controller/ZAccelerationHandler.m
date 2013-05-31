//
//  ZAccelerationHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ZAccelerationHandler.h"

@implementation ZAccelerationHandler

- (void)updateZAcceleration:(UISlider *)slider {
    _particle.zAcceleration = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.f", _particle.zAcceleration];
    
    [self updateChanged];
}

@end
