//
//  EmitterDepthHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-13.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmitterDepthHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter depthTextField:(UITextField*)textField depthSlider:(UISlider*)depthSlider;

- (void)updateDepth:(UISlider*)slider;
- (void)switchDepth:(UISwitch*)depthSwitch;

@end
