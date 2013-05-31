//
//  TextFieldSliderHandlerBase.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextFieldSliderHandlerBase : NSObject {
    @protected
    __weak CAEmitterCell* _particle;
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _textField;
}

- (id)initWithEmitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle textField:(UITextField*)textField;

- (void)updateChanged;

@end
