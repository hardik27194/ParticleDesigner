//
//  EmitterSpinHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterSpinHandler.h"

@implementation EmitterSpinHandler {
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _spinTextField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter spinTextField:(UITextField *)spinTextField {
    if (self = [super init]) {
        _emitter = emitter;
        _spinTextField = spinTextField;
    }
    return self;
}

- (void)updateSpin:(UISlider *)slider {
    _emitter.spin = slider.value;
    _spinTextField.text = [NSString stringWithFormat:@"%.1f", _emitter.spin];
}

@end
