//
//  ScaleRangeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ScaleRangeHandler.h"

@implementation ScaleRangeHandler {
    __weak CAEmitterCell* _particle;
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _textField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter particle:(CAEmitterCell *)particle scaleRangeTextField:(UITextField *)textField {
    if (self = [super init]) {
        _emitter = emitter;
        _particle = particle;
        _textField = textField;
    }
    return self;
}

- (void)updateScaleRange:(UISlider *)slider {
    _particle.scaleRange = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.1f", _particle.scaleRange];
    
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
