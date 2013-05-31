//
//  ScaleHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ScaleHandler.h"

@implementation ScaleHandler {
    __weak CAEmitterCell* _particle;
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _textField;
}

- (id)initWithEmitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle  scaleTextField:(UITextField*)textField {
    if (self = [super init]) {
        _particle = particle;
        _emitter = emitter;
        _textField = textField;
    }
    return self;
}

- (void)updateScale:(UISlider *)slider {
    _particle.scale = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.1f", _particle.scale];
    
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
