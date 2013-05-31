//
//  ParticleColorHandler.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-16.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ParticleColorHandler.h"
#import "UIGlossyButton.h"

#define COLOR_PICKER_VIEW_SPEED 0.5

@interface ParticleColorHandler ()

@property (nonatomic, strong) KZColorPickerViewController* colorPickerViewController;

@end

@implementation ParticleColorHandler {
    __weak CAEmitterLayer* _emitter;
    __weak CAEmitterCell* _particle;
    __weak UIGlossyButton* _button;
    __weak UITextField* _redTextField;
    __weak UITextField* _greenTextField;
    __weak UITextField* _blueTextField;
    __weak UITextField* _alphaTextField;
}

- (id)initWithEmitter:(CAEmitterLayer*)emitter
             particle:(CAEmitterCell*)particle
          colorButton:(UIGlossyButton*)button
         redTextField:(UITextField*)redTextField
       greenTextField:(UITextField*)greenTextField
        blueTextField:(UITextField*)blueTextField
       alphaTextField:(UITextField*)alphaTextField {
    
    if (self = [super init]) {
        _emitter = emitter;
        _particle = particle;
        _button = button;
        _redTextField = redTextField;
        _greenTextField = greenTextField;
        _blueTextField = blueTextField;
        _alphaTextField = alphaTextField;
    }
    return self;
}

- (void)clickColorButton:(UIButton *)button {
    self.colorPickerViewController = [[KZColorPickerViewController alloc] init];
   self.colorPickerViewController.delegate = self;
    
    // 增加完成按钮
    UIGlossyButton* doneButton = [UIGlossyButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    doneButton.titleLabel.font = [UIFont systemFontOfSize:15];
    doneButton.strokeType = kUIGlossyButtonStrokeTypeSolid;
    doneButton.tintColor = [UIColor lightGrayColor];
    doneButton.buttonCornerRadius = 10;
    
    CGRect frame = CGRectMake(0, 0, 80, 40);
    doneButton.frame = frame;
    
    CGPoint point = self.colorPickerViewController.view.center;
    point.y = [[UIScreen mainScreen] bounds].size.height - 35;
    doneButton.center = point;
    
    [doneButton addTarget:self action:@selector(clickDoneButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.colorPickerViewController.view addSubview:doneButton];
    
    // 弹出 color picker view
    frame = self.colorPickerViewController.view.frame;
    frame.origin.y = [[UIScreen mainScreen] bounds].size.height;
    self.colorPickerViewController.view.frame = frame;
    
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    UIViewController* rootViewController = window.rootViewController;
    
    [rootViewController.view addSubview:self.colorPickerViewController.view];
    
    [UIView animateWithDuration:COLOR_PICKER_VIEW_SPEED animations:^{
        
        CGRect frame = self.colorPickerViewController.view.frame;
        frame.origin.y = 0;
        self.colorPickerViewController.view.frame = frame;
    }];
}

- (void)clickDoneButton:(UIButton*)button {
    [UIView animateWithDuration:COLOR_PICKER_VIEW_SPEED animations:^{
        
        CGRect frame = self.colorPickerViewController.view.frame;
        frame.origin.y = [[UIScreen mainScreen] bounds].size.height;
        self.colorPickerViewController.view.frame = frame;
        
    } completion:^(BOOL finished) {
        
        [self.colorPickerViewController.view removeFromSuperview];
        self.colorPickerViewController = nil;
    }];
}

- (void)updateRed:(UISlider *)slider {
    _redTextField.text = [NSString stringWithFormat:@"%.f", slider.value * 255];
    
    UIColor* particleColor = [UIColor colorWithCGColor:_particle.color];
    
    CGFloat red, green, blue, alpha;
    [particleColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    UIColor* newColor = [UIColor colorWithRed:slider.value green:green blue:blue alpha:alpha];
    _particle.color = newColor.CGColor;
    
    [self updateChanged];
    [self updateButtonWithColor:newColor];
}

- (void)updateGreen:(UISlider *)slider {
    _greenTextField.text = [NSString stringWithFormat:@"%.f", slider.value * 255];
    
    UIColor* particleColor = [UIColor colorWithCGColor:_particle.color];
    
    CGFloat red, green, blue, alpha;
    [particleColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    UIColor* newColor = [UIColor colorWithRed:red green:slider.value blue:blue alpha:alpha];
    _particle.color = newColor.CGColor;
    
    [self updateChanged];
    [self updateButtonWithColor:newColor];
}

- (void)updateBlue:(UISlider *)slider {
    _blueTextField.text = [NSString stringWithFormat:@"%.f", slider.value * 255];
    
    UIColor* particleColor = [UIColor colorWithCGColor:_particle.color];
    
    CGFloat red, green, blue, alpha;
    [particleColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    UIColor* newColor = [UIColor colorWithRed:red green:green blue:slider.value alpha:alpha];
    _particle.color = newColor.CGColor;
    
    [self updateChanged];
    [self updateButtonWithColor:newColor];
}

- (void)updateAlpha:(UISlider *)slider {
    _alphaTextField.text = [NSString stringWithFormat:@"%.f", slider.value * 255];
    
    UIColor* particleColor = [UIColor colorWithCGColor:_particle.color];
    
    CGFloat red, green, blue, alpha;
    [particleColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    UIColor* newColor = [UIColor colorWithRed:red green:green blue:blue alpha:slider.value];
    _particle.color = newColor.CGColor;
    
    [self updateChanged];
    [self updateButtonWithColor:newColor];
}

// 颜色改变时,并不马上反映,需要更改一下emitter的属性才有效.
- (void)updateChanged {
    _emitter.lifetime += 0.1;
    _emitter.lifetime -= 0.1;
}

- (void)updateButtonWithColor:(UIColor*)color {
    _button.tintColor = color;
    [_button setNeedsDisplay];
}

#pragma mark
#pragma mark KZColorPickerViewDelegate

- (void)colorPickerViewController:(KZColorPickerViewController *)controller
                   didChangeColor:(UIColor *)color {

    _particle.color = color.CGColor;
    [self updateChanged];
    [self updateButtonWithColor:color];
}

@end





