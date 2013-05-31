//
//  EmitterSpinHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmitterSpinHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter spinTextField:(UITextField*)spinTextField;

- (void)updateSpin:(UISlider*)slider;

@end
