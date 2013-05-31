//
//  CellLifeTimeRangeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "CellLifeTimeRangeHandler.h"

@implementation CellLifeTimeRangeHandler {
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

- (void)updateCellLifeTimeRange:(UISlider *)slider {
    _particle.lifetimeRange = slider.value;
    _textField.text = [NSString stringWithFormat:@"%.1f", _particle.lifetimeRange];
    
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

@end
