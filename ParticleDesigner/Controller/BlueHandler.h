//
//  BlueHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlueHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter
             particle:(CAEmitterCell*)particle
       rangeTextField:(UITextField*)rangeTextField
       speedTextField:(UITextField*)speedTextField;

- (void)updateRange:(UISlider*)slider;
- (void)updateSpeed:(UISlider*)slider;

@end
