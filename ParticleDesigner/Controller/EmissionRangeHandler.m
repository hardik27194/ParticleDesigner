//
//  EmissionRangeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmissionRangeHandler.h"

@implementation EmissionRangeHandler

- (void)updateEmissionRange:(UISlider *)slider {
    _particle.emissionRange = slider.value * (M_PI / 180);
    _textField.text = [NSString stringWithFormat:@"%.f", slider.value];
    
    [self updateChanged];
}

@end
