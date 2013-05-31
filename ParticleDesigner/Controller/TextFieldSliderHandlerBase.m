//
//  TextFieldSliderHandlerBase.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "TextFieldSliderHandlerBase.h"

@implementation TextFieldSliderHandlerBase

- (id)initWithEmitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle  textField:(UITextField*)textField {
    if (self = [super init]) {
        _particle = particle;
        _emitter = emitter;
        _textField = textField;
    }
    return self;
}

- (void)updateChanged {
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
