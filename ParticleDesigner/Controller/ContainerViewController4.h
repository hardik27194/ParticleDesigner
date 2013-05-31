//
//  ContainerViewController4.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContainerViewControllerDelegate.h"

@interface ContainerViewController4 : UIViewController

@property (nonatomic, weak) id<ContainerViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIView* magnificationFilterPickerViewPlaceHolder;
@property (nonatomic, weak) IBOutlet UIView* minificationFilterPickerViewPlaceHolder;
@property (nonatomic, weak) IBOutlet UITextField* minificationFilterBiasTextField;
@property (nonatomic, weak) IBOutlet UISlider* minificationFilterBiasSlider;
@property (nonatomic, weak) IBOutlet UITextField* scaleTextField;
@property (nonatomic, weak) IBOutlet UISlider* scaleSlider;
@property (nonatomic, weak) IBOutlet UITextField* scaleRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* scaleRangeSlider;
@property (nonatomic, weak) IBOutlet UITextField* scaleSpeedTextField;
@property (nonatomic, weak) IBOutlet UISlider* scaleSpeedSlider;
@property (nonatomic, weak) IBOutlet UITextField* spinTextField;
@property (nonatomic, weak) IBOutlet UISlider* spinSlider;
@property (nonatomic, weak) IBOutlet UITextField* spinRangeTextField;
@property (nonatomic, weak) IBOutlet UISlider* spinRangeSlider;

@end
