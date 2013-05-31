//
//  EmitterScaleHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmitterScaleHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter scaleTextField:(UITextField*)scaleTextField;

- (void)updateScale:(UISlider*)slider;

@end
