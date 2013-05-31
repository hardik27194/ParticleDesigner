//
//  PositionHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-11.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PositionHandler : NSObject <UITextFieldDelegate>

- (id)initWithEmitter:(CAEmitterLayer*)emitter
        xPosTextField:(UITextField*)x
        yPosTextField:(UITextField*)y
       zPosTextFielid:(UITextField*)z;

- (void)updateValue:(UISlider*)slider;

@end
