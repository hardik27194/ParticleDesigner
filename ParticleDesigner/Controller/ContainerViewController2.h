//
//  ContainerViewController2.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContainerViewControllerDelegate.h"



@interface ContainerViewController2 : UIViewController

@property (nonatomic, weak) id<ContainerViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UITextField* scaleTextField;
@property (nonatomic, weak) IBOutlet UISlider* scaleSlider;
@property (nonatomic, weak) IBOutlet UITextField* spinTextField;
@property (nonatomic, weak) IBOutlet UISlider* spinSlider;
@property (nonatomic, weak) IBOutlet UITextField* velocityTextField;
@property (nonatomic, weak) IBOutlet UISlider* velocitySlider;
@property (nonatomic, weak) IBOutlet UITextField* velocityMaxTextField;
@property (nonatomic, weak) IBOutlet UISlider* velocityMaxSlider;
@property (nonatomic, weak) IBOutlet UITextField* birthRateTextField;
@property (nonatomic, weak) IBOutlet UISlider* birthRateSlider;
@property (nonatomic, weak) IBOutlet UITextField* lifeTimeTextField;
@property (nonatomic, weak) IBOutlet UISlider* lifeTimeSlider;

@property (nonatomic, weak) IBOutlet UITextField* cellBirthRateTextField;
@property (nonatomic, weak) IBOutlet UISlider* cellBirthRateSlider;
@property (nonatomic, weak) IBOutlet UITextField* cellLifeTimeTextField;
@property (nonatomic, weak) IBOutlet UISlider* cellLifeTimeSlider;
@property (nonatomic, weak) IBOutlet UITextField* cellLifeTimeRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* cellLifeTimeRangeSlider;

@end
