//
//  CellLifeTimeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "CellLifeTimeHandler.h"

@implementation CellLifeTimeHandler {
    __weak CAEmitterLayer* _emitter;
    __weak CAEmitterCell* _particle;
    __weak UITextField* _textField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter particle:(CAEmitterCell *)particle textField:(UITextField *)textField {
    if (self = [super init]) {
        _emitter = emitter;
        _particle = particle;
        _textField = textField;
    }
    return self;
}

- (void)updateCellLifeTime:(UISlider *)slider {
    _particle.lifetime = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.1f", _particle.lifetime];
    
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
