//
//  EmitterShapeHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-12.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPPickerView.h"

@interface EmitterShapeHandler : NSObject <CPPickerViewDelegate, CPPickerViewDataSource>

- (id)initWithDataSource:(NSArray*)dataSource emitter:(CAEmitterLayer*)emitter;

@end
