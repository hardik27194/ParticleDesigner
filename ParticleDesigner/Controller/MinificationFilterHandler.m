//
//  MinificationFilterHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "MinificationFilterHandler.h"

@implementation MinificationFilterHandler {
    __weak NSArray* _dataSource;
    __weak CAEmitterCell* _particle;
    __weak CAEmitterLayer* _emitter;
    __weak UITextField* _textField;
    __weak UISlider* _slider;
}

- (id)initWithDataSource:(NSArray *)dataSource emitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell *)particle minificationFilterBiasTextField:(UITextField *)textField minificationFilterBiasSlider:(UISlider *)slider {
    if (self = [super init]) {
        _dataSource = dataSource;
        _particle = particle;
        _emitter = emitter;
        _textField = textField;
        _slider = slider;
    }
    return self;
}

- (void)updateMinificationFilterBias:(UISlider *)slider {
    _textField.text = [NSString stringWithFormat:@"%.1f", slider.value];
    _particle.minificationFilterBias = slider.value;
}

#pragma mark
#pragma mark CPPickerViewDelegate

- (void)pickerView:(CPPickerView *)pickerView didSelectItem:(NSInteger)item {
    _particle.minificationFilter = [[[_dataSource objectAtIndex:item] allValues] objectAtIndex:0];
    
    if (_particle.minificationFilter == kCAFilterTrilinear) {
        _slider.enabled = YES;
    }
    else {
        _slider.enabled = NO;
    }
}

#pragma mark
#pragma mark CPPickerViewDataSource

- (NSInteger)numberOfItemsInPickerView:(CPPickerView *)pickerView {
    return _dataSource.count;
}

- (NSString *)pickerView:(CPPickerView *)pickerView titleForItem:(NSInteger)item {
    return [[[_dataSource objectAtIndex:item] allKeys] objectAtIndex:0];
}

@end
