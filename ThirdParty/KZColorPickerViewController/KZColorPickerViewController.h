//
//  KZColorPickerViewController.h
//  Quick Graph
//
//  Created by Alex Restrepo on 5/11/11.
//  Copyright 2011 KZLabs http://kzlabs.me
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZColorPicker.h"

@protocol KZColorPickerViewDelegate;

@interface KZColorPickerViewController : UIViewController 

@property(nonatomic, weak) id<KZColorPickerViewDelegate> delegate;
@property(nonatomic, strong) UIColor *selectedColor;
@end

@protocol KZColorPickerViewDelegate
- (void) colorPickerViewController:(KZColorPickerViewController *)controller didChangeColor:(UIColor *)color;
@end