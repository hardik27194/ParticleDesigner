//
//  CellBirthRateHandler.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellBirthRateHandler : NSObject

- (id)initWithEmitter:(CAEmitterLayer*)emitter particle:(CAEmitterCell*)particle textField:(UITextField*)textField;

- (void)updateCellBirthRate:(UISlider*)slider;

@end
