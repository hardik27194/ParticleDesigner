//
//  MinificationFilterHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPPickerView.h"

@interface MinificationFilterHandler : NSObject <CPPickerViewDelegate, CPPickerViewDataSource>

- (id)initWithDataSource:(NSArray*)dataSource emitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle minificationFilterBiasTextField:(UITextField*)textField minificationFilterBiasSlider:(UISlider*)slider;

- (void)updateMinificationFilterBias:(UISlider*)slider;

@end
