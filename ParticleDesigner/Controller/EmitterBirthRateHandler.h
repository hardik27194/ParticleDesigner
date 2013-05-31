//
//  EmitterBirthRateHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmitterBirthRateHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter
   birthRateTextField:(UITextField*)birthRateTextField;

- (void)updateBirthRate:(UISlider*)slider;

@end
