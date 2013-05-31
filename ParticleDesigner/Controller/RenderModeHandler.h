//
//  RenderModeHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-10.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPPickerView.h"

@interface RenderModeHandler : NSObject <CPPickerViewDelegate, CPPickerViewDataSource>

- (id)initWithDataSource:(NSArray*)dataSource emitter:(CAEmitterLayer*)emitter;

@end
