//
//  EmissionLongitudeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmissionLongitudeHandler.h"

@implementation EmissionLongitudeHandler

- (void)updateLongitude:(UISlider *)slider {
    _particle.emissionLongitude = slider.value * (M_PI / 180);
    _textField.text = [NSString stringWithFormat:@"%.f", slider.value];
    
    [self updateChanged];
}

@end
