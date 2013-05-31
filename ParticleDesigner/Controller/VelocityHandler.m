//
//  VelocityHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "VelocityHandler.h"

@implementation VelocityHandler

- (void)updateVelocity:(UISlider *)slider {
    _particle.velocity = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.f", _particle.velocity];
    
    [self updateChanged];
}

@end
