//
//  VelocityRangeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "VelocityRangeHandler.h"

@implementation VelocityRangeHandler

- (void)updateVelocityRange:(UISlider *)slider {
    _particle.velocityRange = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.f", _particle.velocityRange];
    
    [self updateChanged];
}

@end
