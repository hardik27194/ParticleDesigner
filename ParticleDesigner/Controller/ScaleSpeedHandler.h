//
//  ScaleSpeedHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaleSpeedHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle  scaleSpeedTextField:(UITextField*)textField;

- (void)updateScaleSpeed:(UISlider*)slider;

@end
