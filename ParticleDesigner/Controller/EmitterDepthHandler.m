//
//  EmitterDepthHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-13.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterDepthHandler.h"

@implementation EmitterDepthHandler {
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _textField;
    __weak UISlider* _slider;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter
       depthTextField:(UITextField *)textField
          depthSlider:(UISlider *)depthSlider {
    if (self = [super init]) {
        _emitter = emitter;
        _textField = textField;
        _slider = depthSlider;
    }
    return self;
}

- (void)updateDepth:(UISlider*)slider {
    _emitter.emitterDepth = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.1f", _emitter.emitterDepth];
}

- (void)switchDepth:(UISwitch *)depthSwitch {
    _emitter.preservesDepth = depthSwitch.on;
    _slider.enabled = depthSwitch.on;
}

@end
