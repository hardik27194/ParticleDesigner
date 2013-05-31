//
//  EmitterScaleHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterScaleHandler.h"

@implementation EmitterScaleHandler {
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _scaleTextField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter scaleTextField:(UITextField *)scaleTextField {
    if (self = [super init]) {
        _emitter = emitter;
        _scaleTextField = scaleTextField;
    }
    return self;
}

- (void)updateScale:(UISlider*)slider {
    _emitter.scale = slider.value;
    _scaleTextField.text = [NSString stringWithFormat:@"%.1f", _emitter.scale];
}

@end
