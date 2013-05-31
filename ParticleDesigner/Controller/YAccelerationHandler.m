//
//  YAccelerationHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "YAccelerationHandler.h"

@implementation YAccelerationHandler

- (void)updateYAcceleration:(UISlider *)slider {
    _particle.yAcceleration = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.f", _particle.yAcceleration];
    
    [self updateChanged];
}

@end
