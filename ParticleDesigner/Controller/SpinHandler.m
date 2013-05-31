//
//  SpinHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "SpinHandler.h"

@implementation SpinHandler {
    __weak CAEmitterCell* _particle;
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _textField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter particle:(CAEmitterCell *)particle spinTextField:(UITextField *)textField {
    if (self = [super init]) {
        _emitter = emitter;
        _particle = particle;
        _textField = textField;
    }
    return self;
}

- (void)updateSpin:(UISlider *)slider {
    _particle.spin = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.1f", _particle.spin];
    
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
