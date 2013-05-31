//
//  EmitterSizeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-13.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterSizeHandler.h"

@implementation EmitterSizeHandler {
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _widthTextField;
    __weak UITextField* _heightTextField;
}

- (id)initWithWidthEmitter:(CAEmitterLayer *)emitter widthTextField:(UITextField *)widthTextField heightTextField:(UITextField *)heightTextField {
    if (self = [super init]) {
        _emitter = emitter;
        _widthTextField = widthTextField;
        _heightTextField = heightTextField;
    }
    return self;
}

- (void)updateWidth:(UISlider*)slider {
    _emitter.emitterSize = CGSizeMake(slider.value, _emitter.emitterSize.height);
    _widthTextField.text = [NSString stringWithFormat:@"%.f", _emitter.emitterSize.width];
}

- (void)updateHeight:(UISlider*)slider {
    _emitter.emitterSize = CGSizeMake(_emitter.emitterSize.width, slider.value);
    _heightTextField.text = [NSString stringWithFormat:@"%.f", _emitter.emitterSize.height];
}

@end
