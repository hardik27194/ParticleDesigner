//
//  EmitterSizeHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-13.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmitterSizeHandler : NSObject

- (id)initWithWidthEmitter:(CAEmitterLayer*)emitter widthTextField:(UITextField*)widthTextField heightTextField:(UITextField*)heightTextField;

- (void)updateWidth:(UISlider*)slider;
- (void)updateHeight:(UISlider*)slider;

@end
