//
//  SpinHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpinHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle spinTextField:(UITextField*)textField;

- (void)updateSpin:(UISlider*)slider;

@end
