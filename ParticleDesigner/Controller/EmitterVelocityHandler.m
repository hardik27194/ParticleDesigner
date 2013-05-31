//
//  EmitterVelocityHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterVelocityHandler.h"

@implementation EmitterVelocityHandler {
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _velocityTextField;
    __weak UISlider* _velocitySlider;
    __weak UITextField* _velocityMaxTextField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter
    velocityTextField:(UITextField *)velocityTextField
       velocitySlider:(UISlider *)velocitySlider 
 velocityMaxTextField:(UITextField *)velocityMaxTextField{
    if (self = [super init]) {
        _emitter = emitter;
        _velocityTextField = velocityTextField;
        _velocitySlider = velocitySlider;
        _velocityMaxTextField = velocityMaxTextField;
    }
    return self;
}

- (void)updateVelocity:(UISlider *)slider {
    _emitter.velocity = slider.value;
    _velocityTextField.text = [NSString stringWithFormat:@"%.1f", _emitter.velocity];
}

- (void)updateVelocityMax:(UISlider *)slider {
    _velocitySlider.maximumValue = slider.value;
    _velocityMaxTextField.text = [NSString stringWithFormat:@"%.f", slider.value];
}

@end
