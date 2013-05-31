//
//  EmissionLatitudeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmissionLatitudeHandler.h"

@implementation EmissionLatitudeHandler

- (void)updateLatitude:(UISlider *)slider {
    _particle.emissionLatitude = slider.value * (M_PI / 180);
    _textField.text = [NSString stringWithFormat:@"%.f", slider.value];
    
    [self updateChanged];
}

@end
