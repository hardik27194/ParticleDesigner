//
//  EmitterModeHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "EmitterModeHandler.h"

@implementation EmitterModeHandler {
    __weak NSArray* _dataSource;
    __weak CAEmitterLayer* _emitter;
}

- (id)initWithDataSource:(NSArray *)dataSource emitter:(CAEmitterLayer *)emitter {
    if (self = [super init]) {
        _dataSource = dataSource;
        _emitter = emitter;
    }
    return self;
}

#pragma mark
#pragma mark CPPickerViewDelegate

- (void)pickerView:(CPPickerView *)pickerView didSelectItem:(NSInteger)item {
    _emitter.emitterMode = [[[_dataSource objectAtIndex:item] allValues] objectAtIndex:0];
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
