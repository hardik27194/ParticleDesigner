//
//  ContainerViewController1.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-13.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContainerViewControllerDelegate.h"

@interface ContainerViewController1 : UIViewController

@property (nonatomic, weak) id<ContainerViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIView* renderModePickerViewPlaceHolder;
@property (nonatomic, weak) IBOutlet UIView* emitterShapePickerViewPlaceHolder;
@property (nonatomic, weak) IBOutlet UIView* emitterModePickerViewPlaceHolder;
@property (nonatomic, weak) IBOutlet UITextField* xPosTextField;
@property (nonatomic, weak) IBOutlet UITextField* yPosTextField;
@property (nonatomic, weak) IBOutlet UITextField* zPosTextField;
@property (nonatomic, weak) IBOutlet UISlider* zPositionSlider;
@property (nonatomic, weak) IBOutlet UITextField* widthTextField;
@property (nonatomic, weak) IBOutlet UISlider* widthSlider;
@property (nonatomic, weak) IBOutlet UITextField* heightTextField;
@property (nonatomic, weak) IBOutlet UISlider* heightSlider;
@property (nonatomic, weak) IBOutlet UITextField* depthTextField;
@property (nonatomic, weak) IBOutlet UISlider* depthSlider;
@property (nonatomic, weak) IBOutlet UISwitch* depthSwitch;

@end
