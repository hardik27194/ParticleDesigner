//
//  ParticleColorHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-16.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KZColorPickerViewController.h"

@class UIGlossyButton;

@interface ParticleColorHandler : NSObject <KZColorPickerViewDelegate>

- (id)initWithEmitter:(CAEmitterLayer*)emitter
             particle:(CAEmitterCell*)particle
          colorButton:(UIGlossyButton*)button
         redTextField:(UITextField*)redTextField
       greenTextField:(UITextField*)greenTextField
        blueTextField:(UITextField*)blueTextField
       alphaTextField:(UITextField*)alphaTextField;

- (void)clickColorButton:(UIButton*)button;
- (void)updateRed:(UISlider*)slider;
- (void)updateGreen:(UISlider*)slider;
- (void)updateBlue:(UISlider*)slider;
- (void)updateAlpha:(UISlider*)slider;

@end
