//
//  MainViewController.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-9.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CPPickerView.h"

#import "ContainerViewControllerDelegate.h"

@class ParticleContentView;
@class ArgumentHandleView;

@interface MainViewController : UIViewController <ContainerViewControllerDelegate>

@property (nonatomic, weak) IBOutlet ParticleContentView* particleContentView;
@property (nonatomic, weak) IBOutlet UIView* separatorView;
@property (nonatomic, weak) IBOutlet UIImageView* separatorImageView;
@property (nonatomic, weak) IBOutlet ArgumentHandleView* argumentHandleView;

@end
