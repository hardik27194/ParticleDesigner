//
//  ContainerViewController4.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-17.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ContainerViewController4.h"
#import "CPPickerView.h"
#import "MagnificationFilterHandler.h"
#import "MinificationFilterHandler.h"
#import "ScaleHandler.h"
#import "ScaleRangeHandler.h"
#import "ScaleSpeedHandler.h"
#import "SpinHandler.h"
#import "SpinRangeHandler.h"

@interface ContainerViewController4 ()

@property (nonatomic, weak) CAEmitterLayer* emitter;
@property (nonatomic, weak) CAEmitterCell* particle;
@property (nonatomic, weak) NSArray* magnificationFilter;
@property (nonatomic, weak) NSArray* minificationFilter;

@property (nonatomic, strong) CPPickerView* magnificationFilterPickerView;
@property (nonatomic, strong) MagnificationFilterHandler* magnificationFilterHandler;
@property (nonatomic, strong) CPPickerView* minificationFilterPickerView;
@property (nonatomic, strong) MinificationFilterHandler* minificationFilterHandler;
@property (nonatomic, strong) ScaleHandler* scaleHandler;
@property (nonatomic, strong) ScaleRangeHandler* scaleRangeHandler;
@property (nonatomic, strong) ScaleSpeedHandler* scaleSpeedHandler;
@property (nonatomic, strong) SpinHandler* spinHandler;
@property (nonatomic, strong) SpinRangeHandler* spinRangeHandler;

@end

@implementation ContainerViewController4

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.emitter = [self.delegate containerViewControllerShouldGetEmitter];
    self.particle = [self.delegate containerViewControllerShouldGetParticle];
    self.magnificationFilter = [self.delegate containerViewControllerShouldGetScalingFilters];
    self.minificationFilter = [self.delegate containerViewControllerShouldGetScalingFilters];
    
    [self initMagnificationFilterHandler];
    [self initMinificationFilterHandler];
    [self initScaleHandler];
    [self initScaleRangeHandler];
    [self initScaleSpeedHandler];
    [self initSpinHandler];
    [self initSpinRangeHandler];
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

- (void)initMagnificationFilterHandler {
    self.magnificationFilterPickerView = [[CPPickerView alloc] initWithFrame:self.magnificationFilterPickerViewPlaceHolder.bounds];
    
    self.magnificationFilterPickerView.itemFont = [UIFont systemFontOfSize:14];
    self.magnificationFilterHandler = [[MagnificationFilterHandler alloc] initWithDataSource:self.magnificationFilter emitter:self.emitter particle:self.particle];
    
    self.magnificationFilterPickerView.delegate = self.magnificationFilterHandler;
    self.magnificationFilterPickerView.dataSource = self.magnificationFilterHandler;
    [self.magnificationFilterPickerView reloadData];
    [self.magnificationFilterPickerViewPlaceHolder addSubview:self.magnificationFilterPickerView];
}

- (void)initMinificationFilterHandler {
    self.minificationFilterBiasTextField.text = [NSString stringWithFormat:@"%.1f",self.particle.minificationFilterBias];
    
    self.minificationFilterPickerView = [[CPPickerView alloc] initWithFrame:self.minificationFilterPickerViewPlaceHolder.bounds];
    
    self.minificationFilterPickerView.itemFont = [UIFont systemFontOfSize:14];
    self.minificationFilterHandler = [[MinificationFilterHandler alloc] initWithDataSource:self.minificationFilter emitter:self.emitter particle:self.particle minificationFilterBiasTextField:self.minificationFilterBiasTextField minificationFilterBiasSlider:self.minificationFilterBiasSlider];
    
    self.minificationFilterPickerView.delegate = self.minificationFilterHandler;
    self.minificationFilterPickerView.dataSource = self.minificationFilterHandler;
    [self.minificationFilterPickerView reloadData];
    [self.minificationFilterPickerViewPlaceHolder addSubview:self.minificationFilterPickerView];
    
    [self.minificationFilterBiasSlider addTarget:self.minificationFilterHandler action:@selector(updateMinificationFilterBias:) forControlEvents:UIControlEventValueChanged];
}

- (void)initScaleHandler {
    self.scaleTextField.text = [NSString stringWithFormat:@"%.1f", self.particle.scale];
    self.scaleSlider.value = self.particle.scale;
    
    self.scaleHandler = [[ScaleHandler alloc] initWithEmitter:self.emitter particle:self.particle scaleTextField:self.scaleTextField];
    
    [self.scaleSlider addTarget:self.scaleHandler action:@selector(updateScale:) forControlEvents:UIControlEventValueChanged];
}

- (void)initScaleRangeHandler {
    self.scaleRangeTextField.text = [NSString stringWithFormat:@"%.1f", self.particle.scaleRange];
    self.scaleRangeSlider.value = self.particle.scaleRange;
    
    self.scaleRangeHandler = [[ScaleRangeHandler alloc] initWithEmitter:self.emitter particle:self.particle scaleRangeTextField:self.scaleRangeTextField];
    
    [self.scaleRangeSlider addTarget:self.scaleRangeHandler action:@selector(updateScaleRange:) forControlEvents:UIControlEventValueChanged];
}

- (void)initScaleSpeedHandler {
    self.scaleSpeedTextField.text = [NSString stringWithFormat:@"%.1f", self.particle.scaleSpeed];
    self.scaleSpeedSlider.value = self.particle.scaleSpeed;
    
    self.scaleSpeedHandler = [[ScaleSpeedHandler alloc] initWithEmitter:self.emitter particle:self.particle scaleSpeedTextField:self.scaleSpeedTextField];
    
    [self.scaleSpeedSlider addTarget:self.scaleSpeedHandler action:@selector(updateScaleSpeed:) forControlEvents:UIControlEventValueChanged];
}

- (void)initSpinHandler {
    self.spinTextField.text = [NSString stringWithFormat:@"%.1f", self.particle.spin];
    self.spinSlider.value = self.particle.spin;
    
    self.spinHandler = [[SpinHandler alloc] initWithEmitter:self.emitter particle:self.particle spinTextField:self.spinTextField];
    
    [self.spinSlider addTarget:self.spinHandler action:@selector(updateSpin:) forControlEvents:UIControlEventValueChanged];
}

- (void)initSpinRangeHandler {
    self.spinRangeTextField.text = [NSString stringWithFormat:@"%.1f", self.particle.spinRange];
    self.spinRangeSlider.value = self.particle.spinRange;
    
    self.spinRangeHandler = [[SpinRangeHandler alloc] initWithEmitter:self.emitter particle:self.particle spinRangeTextField:self.spinRangeTextField];
    
    [self.spinRangeSlider addTarget:self.spinRangeHandler action:@selector(updateSpinRange:) forControlEvents:UIControlEventValueChanged];
}

@end











