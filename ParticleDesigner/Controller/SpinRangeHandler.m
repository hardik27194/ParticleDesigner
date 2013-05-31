//
//  SpinRangeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "SpinRangeHandler.h"

@implementation SpinRangeHandler {
    __weak CAEmitterCell* _particle;
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _textField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter particle:(CAEmitterCell *)particle spinRangeTextField:(UITextField *)textField {
    if (self = [super init]) {
        _emitter = emitter;
        _particle = particle;
        _textField = textField;
    }
    return self;
}

- (void)updateSpinRange:(UISlider *)slider {
    _particle.spinRange = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.1f", _particle.spinRange];
    
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
