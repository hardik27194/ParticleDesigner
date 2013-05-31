//
//  ContainerViewController5.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContainerViewControllerDelegate.h"

@interface ContainerViewController5 : UIViewController

@property (nonatomic, weak) id<ContainerViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UITextField* latitudeTextField;
@property (nonatomic, weak) IBOutlet UISlider* latitudeSlider;
@property (nonatomic, weak) IBOutlet UITextField* longitudeTextField;
@property (nonatomic, weak) IBOutlet UISlider* longitudeSlider;
@property (nonatomic, weak) IBOutlet UITextField* emissionRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* emissionRangeSlider;

@property (nonatomic, weak) IBOutlet UITextField* velocityTextField;
@property (nonatomic, weak) IBOutlet UISlider* velocitySlider;
@property (nonatomic, weak) IBOutlet UITextField* velocityRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* velocityRangeSlider;
@property (nonatomic, weak) IBOutlet UITextField* xAccelerationTextField;
@property (nonatomic, weak) IBOutlet UISlider* xAccelerationSlider;
@property (nonatomic, weak) IBOutlet UITextField* yAccelerationTextField;
@property (nonatomic, weak) IBOutlet UISlider* yAccelerationSlider;
@property (nonatomic, weak) IBOutlet UITextField* zAccelerationTextField;
@property (nonatomic, weak) IBOutlet UISlider* zAccelerationSlider;

@end