//
//  PositionHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-11.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "PositionHandler.h"

@implementation PositionHandler {
    BOOL _isExistDecimalPoint;
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _xPosTextField;
    __weak UITextField* _yPosTextField;
    __weak UITextField* _zPosTextField;
}

- (id)initWithEmitter:(CAEmitterLayer *)emitter xPosTextField:(UITextField *)x yPosTextField:(UITextField *)y zPosTextFielid:(UITextField *)z {
    
    if (self = [super init]) {
        _emitter = emitter;
        _isExistDecimalPoint = NO;
        _xPosTextField = x;
        _yPosTextField = y;
        _zPosTextField = z;
    }
    return self;
}

//  slider changed
- (void)updateValue:(UISlider*)slider {
    _emitter.zPosition = slider.value;
    _zPosTextField.text = [NSString stringWithFormat:@"%.1f", _emitter.zPosition];
}

#pragma mark
#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == _xPosTextField) {
        _emitter.position = CGPointMake([textField.text floatValue], _emitter.position.y);
        return;
    }
    
    if (textField == _yPosTextField) {
        _emitter.position = CGPointMake(_emitter.position.x, [textField.text floatValue]);
        return;
    }
}

#define kDecimal @"0123465789"
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    
    // 限制其只能输入数字和唯一一个小数点
    if ([string isEqualToString:@"."] && _isExistDecimalPoint == NO) {
        _isExistDecimalPoint = YES;
        return YES;
    }
    
    if ([string isEqualToString:@""]) {
        if ([textField.text rangeOfString:@"."].location == textField.text.length - 1) {
            _isExistDecimalPoint = NO;
            return YES;
        }
    }
    
    return [kDecimal rangeOfString:string].location != NSNotFound || [string isEqualToString:@""];
}

@end
