//
//  BlueHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "BlueHandler.h"

@implementation BlueHandler {
    __weak CAEmitterLayer* _emitter;
    __weak CAEmitterCell* _particle;
    __weak UITextField* _rangeTextField;
    __weak UITextField* _speedTextField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter
             particle:(CAEmitterCell *)particle
       rangeTextField:(UITextField *)rangeTextField
       speedTextField:(UITextField *)speedTextField {
    if (self = [super init]) {
        _emitter = emitter;
        _particle = particle;
        _rangeTextField = rangeTextField;
        _speedTextField = speedTextField;
    }
    return self;
}

- (void)updateRange:(UISlider *)slider {
    _rangeTextField.text = [NSString stringWithFormat:@"%.f", slider.value * 255];
    _particle.blueRange = slider.value;
    
    [self updateChanged];
}

- (void)updateSpeed:(UISlider *)slider {
    _speedTextField.text = [NSString stringWithFormat:@"%.f", slider.value * 255];
    _particle.blueSpeed = slider.value;
    
    [self updateChanged];
}

- (void)updateChanged {
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
