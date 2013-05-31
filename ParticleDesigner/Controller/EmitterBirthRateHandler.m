//
//  EmitterBirthRateHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterBirthRateHandler.h"

@implementation EmitterBirthRateHandler {
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _birthRateTextField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter
   birthRateTextField:(UITextField *)birthRateTextField {
    if (self = [super init]) {
        _emitter = emitter;
        _birthRateTextField = birthRateTextField;
    }
    return self;
}

- (void)updateBirthRate:(UISlider *)slider {
    _emitter.birthRate = slider.value;
    _birthRateTextField.text = [NSString stringWithFormat:@"%.1f", _emitter.birthRate];
}

@end
