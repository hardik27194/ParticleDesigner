//
//  ScaleHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaleHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle  scaleTextField:(UITextField*)textField;

- (void)updateScale:(UISlider*)slider;

@end
