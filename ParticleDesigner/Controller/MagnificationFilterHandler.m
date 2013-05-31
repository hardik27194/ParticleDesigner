//
//  MagnificationFilterHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "MagnificationFilterHandler.h"

@implementation MagnificationFilterHandler {
    __weak NSArray* _dataSource;
    __weak CAEmitterCell* _particle;
    __weak CAEmitterLayer* _emitter;
}

- (id)initWithDataSource:(NSArray *)dataSource emitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell *)particle {
    if (self = [super init]) {
        _dataSource = dataSource;
        _particle = particle;
        _emitter = emitter;
    }
    return self;
}

#pragma mark
#pragma mark CPPickerViewDelegate

- (void)pickerView:(CPPickerView *)pickerView didSelectItem:(NSInteger)item {
    _particle.magnificationFilter = [[[_dataSource objectAtIndex:item] allValues] objectAtIndex:0];
    
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
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
