//
//  EmitterVelocityHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmitterVelocityHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter
    velocityTextField:(UITextField*)velocityTextField
       velocitySlider:(UISlider*)velocitySlider
 velocityMaxTextField:(UITextField*)velocityMaxTextField;

- (void)updateVelocity:(UISlider*)slider;
- (void)updateVelocityMax:(UISlider *)slider;

@end
