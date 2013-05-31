//
//  ContainerViewController3.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-16.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContainerViewControllerDelegate.h"

@class UIGlossyButton;

@interface ContainerViewController3 : UIViewController

@property (nonatomic, weak) id<ContainerViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIGlossyButton* colorPanButton;
@property (nonatomic, weak) IBOutlet UITextField* redTextField;
@property (nonatomic, weak) IBOutlet UISlider* redSlider;
@property (nonatomic, weak) IBOutlet UITextField* greenTextField;
@property (nonatomic, weak) IBOutlet UISlider* greenSlider;
@property (nonatomic, weak) IBOutlet UITextField* blueTextField;
@property (nonatomic, weak) IBOutlet UISlider* blueSlider;
@property (nonatomic, weak) IBOutlet UITextField* alphaTextField;
@property (nonatomic, weak) IBOutlet UISlider* alphaSlider;

@property (nonatomic, weak) IBOutlet UITextField* redRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* redRangeSlider;
@property (nonatomic, weak) IBOutlet UITextField* redSpeedTextField;
@property (nonatomic, weak) IBOutlet UISlider* redSpeedSlider;

@property (nonatomic, weak) IBOutlet UITextField* greenRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* greenRangeSlider;
@property (nonatomic, weak) IBOutlet UITextField* greenSpeedTextField;
@property (nonatomic, weak) IBOutlet UISlider* greenSpeedSlider;

@property (nonatomic, weak) IBOutlet UITextField* blueRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* blueRangeSlider;
@property (nonatomic, weak) IBOutlet UITextField* blueSpeedTextField;
@property (nonatomic, weak) IBOutlet UISlider* blueSpeedSlider;

@property (nonatomic, weak) IBOutlet UITextField* alphaRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* alphaRangeSlider;
@property (nonatomic, weak) IBOutlet UITextField* alphaSpeedTextField;
@property (nonatomic, weak) IBOutlet UISlider* alphaSpeedSlider;

@end
