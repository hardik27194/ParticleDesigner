//
//  EmitterLifeTimeHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-16.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmitterLifeTimeHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter lifeTimeTextField:(UITextField*)lifeTimeTextField;

- (void)updateLifeTime:(UISlider*)slider;

@end
