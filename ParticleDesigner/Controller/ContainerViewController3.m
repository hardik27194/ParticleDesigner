//
//  ContainerViewController3.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-16.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ContainerViewController3.h"
#import "UIGlossyButton.h"
#import "ParticleColorHandler.h"
#import "RedHandler.h"
#import "GreenHandler.h"
#import "BlueHandler.h"
#import "AlphaHandler.h"

@interface ContainerViewController3 ()

@property (nonatomic, weak) CAEmitterLayer* emitter;
@property (nonatomic, weak) CAEmitterCell* particle;

@property (nonatomic, strong) ParticleColorHandler* particleColorHandler;
@property (nonatomic, strong) RedHandler* redHandler;
@property (nonatomic, strong) GreenHandler* greenHandler;
@property (nonatomic, strong) BlueHandler* blueHandler;
@property (nonatomic, strong) AlphaHandler* alphaHandler;

@end

@implementation ContainerViewController3

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.emitter = [self.delegate containerViewControllerShouldGetEmitter];
    self.particle = [self.delegate containerViewControllerShouldGetParticle];
    
    [self initColorHandler];
    [self initRedHandler];
    [self initGreenHandler];
    [self initBlueHandler];
    [self initAlphaHandler];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGRect frame = self.view.frame;
    frame.size = [[UIScreen mainScreen] bounds].size;
    self.view.frame = frame;
}

- (void)initColorHandler {
    UIColor* particleColor = [UIColor colorWithCGColor:self.particle.color];
    
    CGFloat red, green, blue, alpha;
    [particleColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    self.colorPanButton.strokeType = kUIGlossyButtonStrokeTypeSolid;
    self.colorPanButton.buttonCornerRadius = 10;
    self.colorPanButton.tintColor = particleColor;
    
    self.redTextField.text = [NSString stringWithFormat:@"%.f", red * 255];
    self.greenTextField.text = [NSString stringWithFormat:@"%.f", green * 255];
    self.blueTextField.text = [NSString stringWithFormat:@"%.f", blue * 255];
    self.alphaTextField.text = [NSString stringWithFormat:@"%.f", alpha * 255];
    
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    self.alphaSlider.value = alpha;
    
    self.particleColorHandler = [[ParticleColorHandler alloc] initWithEmitter:self.emitter particle:self.particle colorButton:self.colorPanButton redTextField:self.redTextField greenTextField:self.greenTextField blueTextField:self.blueTextField alphaTextField:self.alphaTextField];
    
    [self.colorPanButton addTarget:self.particleColorHandler action:@selector(clickColorButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.redSlider addTarget:self.particleColorHandler action:@selector(updateRed:) forControlEvents:UIControlEventValueChanged];
    
    [self.greenSlider addTarget:self.particleColorHandler action:@selector(updateGreen:) forControlEvents:UIControlEventValueChanged];
    
    [self.blueSlider addTarget:self.particleColorHandler action:@selector(updateBlue:) forControlEvents:UIControlEventValueChanged];
    
    [self.alphaSlider addTarget:self.particleColorHandler action:@selector(updateAlpha:) forControlEvents:UIControlEventValueChanged];
}

- (void)initRedHandler {
    self.redRangeTextField.text = [NSString stringWithFormat:@"%.f", self.particle.redRange];
    self.redSpeedTextField.text = [NSString stringWithFormat:@"%.f", self.particle.redSpeed];
    self.redRangeSlider.value = self.particle.redRange;
    self.redSpeedSlider.value = self.particle.redSpeed;
    
    self.redHandler = [[RedHandler alloc] initWithEmitter:self.emitter particle:self.particle rangeTextField:self.redRangeTextField speedTextField:self.redSpeedTextField];
    
    [self.redRangeSlider addTarget:self.redHandler action:@selector(updateRange:) forControlEvents:UIControlEventValueChanged];
    [self.redSpeedSlider addTarget:self.redHandler action:@selector(updateSpeed:) forControlEvents:UIControlEventValueChanged];
}

- (void)initGreenHandler {
    self.greenRangeTextField.text = [NSString stringWithFormat:@"%.f", self.particle.greenRange];
    self.greenSpeedTextField.text = [NSString stringWithFormat:@"%.f", self.particle.greenSpeed];
    self.greenRangeSlider.value = self.particle.greenRange;
    self.greenSpeedSlider.value = self.particle.greenSpeed;
    
    self.greenHandler = [[GreenHandler alloc] initWithEmitter:self.emitter particle:self.particle rangeTextField:self.greenRangeTextField speedTextField:self.greenSpeedTextField];
    
    [self.greenRangeSlider addTarget:self.greenHandler action:@selector(updateRange:) forControlEvents:UIControlEventValueChanged];
    [self.greenSpeedSlider addTarget:self.greenHandler action:@selector(updateSpeed:) forControlEvents:UIControlEventValueChanged];
}

- (void)initBlueHandler {
    self.blueRangeTextField.text = [NSString stringWithFormat:@"%.f", self.particle.blueRange];
    self.blueSpeedTextField.text = [NSString stringWithFormat:@"%.f", self.particle.blueSpeed];
    self.blueRangeSlider.value = self.particle.blueRange;
    self.blueSpeedSlider.value = self.particle.blueSpeed;
    
    self.blueHandler = [[BlueHandler alloc] initWithEmitter:self.emitter particle:self.particle rangeTextField:self.blueRangeTextField speedTextField:self.blueSpeedTextField];
    
    [self.blueRangeSlider addTarget:self.blueHandler action:@selector(updateRange:) forControlEvents:UIControlEventValueChanged];
    [self.blueSpeedSlider addTarget:self.blueHandler action:@selector(updateSpeed:) forControlEvents:UIControlEventValueChanged];
}

- (void)initAlphaHandler {
    self.alphaRangeTextField.text = [NSString stringWithFormat:@"%.f", self.particle.alphaRange];
    self.alphaSpeedTextField.text = [NSString stringWithFormat:@"%.f", self.particle.alphaSpeed];
    self.alphaRangeSlider.value = self.particle.alphaRange;
    self.alphaSpeedSlider.value = self.particle.alphaSpeed;
    
    self.alphaHandler = [[AlphaHandler alloc] initWithEmitter:self.emitter particle:self.particle rangeTextField:self.alphaRangeTextField speedTextField:self.alphaSpeedTextField];
    
    [self.alphaRangeSlider addTarget:self.alphaHandler action:@selector(updateRange:) forControlEvents:UIControlEventValueChanged];
    [self.alphaSpeedSlider addTarget:self.alphaHandler action:@selector(updateSpeed:) forControlEvents:UIControlEventValueChanged];
}

@end








