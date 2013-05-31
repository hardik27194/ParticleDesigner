//
//  XAccelerationHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "XAccelerationHandler.h"

@implementation XAccelerationHandler

- (void)updateXAcceleration:(UISlider *)slider {
    _particle.xAcceleration = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.f", _particle.xAcceleration];
    
    [self updateChanged];
}

@end
