//
//  EmitterLifeTimeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-16.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterLifeTimeHandler.h"

@implementation EmitterLifeTimeHandler {
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _lifeTimeTextField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter lifeTimeTextField:(UITextField *)lifeTimeTextField {
    if (self = [super init]) {
        _emitter = emitter;
        _lifeTimeTextField = lifeTimeTextField;
    }
    return self;
}

- (void)updateLifeTime:(UISlider *)slider {
    _emitter.lifetime = slider.value;
    _lifeTimeTextField.text = [NSString stringWithFormat:@"%.1f", _emitter.lifetime];
}

@end
