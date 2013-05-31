//
//  ContainerViewController5.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-18.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ContainerViewController5.h"

#import "EmissionLatitudeHandler.h"
#import "EmissionLongitudeHandler.h"
#import "EmissionRangeHandler.h"
#import "VelocityHandler.h"
#import "VelocityRangeHandler.h"
#import "XAccelerationHandler.h"
#import "YAccelerationHandler.h"
#import "ZAccelerationHandler.h"

@interface ContainerViewController5 ()

@property (nonatomic, weak) CAEmitterLayer* emitter;
@property (nonatomic, weak) CAEmitterCell* particle;

@property (nonatomic, strong) EmissionLatitudeHandler* emissionLatitudeHandler;
@property (nonatomic, strong) EmissionLongitudeHandler* emissionLongitudeHandler;
@property (nonatomic, strong) EmissionRangeHandler* emissionRangeHandler;

@property (nonatomic, strong) VelocityHandler* velocityHandler;
@property (nonatomic, strong) VelocityRangeHandler* velocityRangeHandler;
@property (nonatomic, strong) XAccelerationHandler* xAccelerationHandler;
@property (nonatomic, strong) YAccelerationHandler* yAccelerationHandler;
@property (nonatomic, strong) ZAccelerationHandler* zAccelerationHandler;

@end

@implementation ContainerViewController5

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.emitter = [self.delegate containerViewControllerShouldGetEmitter];
    self.particle = [self.delegate containerViewControllerShouldGetParticle];
    
    [self initEmissionLatitudeHandler];
    [self initEmissionLongitudeHandler];
    [self initEmissionRangeHandler];
    
    [self initVelocityHandler];
    [self initVelocityRangeHandler];
    [self initXAccelerationHandler];
    [self initYAccelerationHandler];
    [self initZAccelerationHandler];
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

- (void)initEmissionLatitudeHandler {
    self.latitudeSlider.value = self.particle.emissionLatitude / (M_PI / 180);
    self.latitudeTextField.text = [NSString stringWithFormat:@"%.f", self.latitudeSlider.value];
    
    self.emissionLatitudeHandler = [[EmissionLatitudeHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.latitudeTextField];
    
    [self.latitudeSlider addTarget:self.emissionLatitudeHandler action:@selector(updateLatitude:) forControlEvents:UIControlEventValueChanged];
}

- (void)initEmissionLongitudeHandler {
    self.longitudeSlider.value = self.particle.emissionLongitude / (M_PI / 180);
    self.longitudeTextField.text = [NSString stringWithFormat:@"%.f", self.longitudeSlider.value];
    
    self.emissionLongitudeHandler = [[EmissionLongitudeHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.longitudeTextField];
    
    [self.longitudeSlider addTarget:self.emissionLongitudeHandler action:@selector(updateLongitude:) forControlEvents:UIControlEventValueChanged];
}

- (void)initEmissionRangeHandler {
    self.emissionRangeSlider.value = self.particle.emissionRange / (M_PI / 180);
    self.emissionRangeTextField.text = [NSString stringWithFormat:@"%.f", self.emissionRangeSlider.value];
    
    self.emissionRangeHandler = [[EmissionRangeHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.emissionRangeTextField];
    
    [self.emissionRangeSlider addTarget:self.emissionRangeHandler action:@selector(updateEmissionRange:) forControlEvents:UIControlEventValueChanged];
}


- (void)initVelocityHandler {
    self.velocitySlider.value = self.particle.velocity;
    self.velocityTextField.text = [NSString stringWithFormat:@"%.f", self.particle.velocity];
    
    self.velocityHandler = [[VelocityHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.velocityTextField];
    
    [self.velocitySlider addTarget:self.velocityHandler action:@selector(updateVelocity:) forControlEvents:UIControlEventValueChanged];
}

- (void)initVelocityRangeHandler {
    self.velocityRangeSlider.value = self.particle.velocityRange;
    self.velocityRangeTextField.text = [NSString stringWithFormat:@"%.f", self.particle.velocityRange];
    
    self.velocityRangeHandler = [[VelocityRangeHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.velocityRangeTextField];
    
    [self.velocityRangeSlider addTarget:self.velocityRangeHandler action:@selector(updateVelocityRange:) forControlEvents:UIControlEventValueChanged];
}

- (void)initXAccelerationHandler {
    self.xAccelerationSlider.value = self.particle.xAcceleration;
    self.xAccelerationTextField.text = [NSString stringWithFormat:@"%.f", self.particle.xAcceleration];
    
    self.xAccelerationHandler = [[XAccelerationHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.xAccelerationTextField];
    
    [self.xAccelerationSlider addTarget:self.xAccelerationHandler action:@selector(updateXAcceleration:) forControlEvents:UIControlEventValueChanged];
}

- (void)initYAccelerationHandler {
    self.yAccelerationSlider.value = self.particle.yAcceleration;
    self.yAccelerationTextField.text = [NSString stringWithFormat:@"%.f", self.particle.yAcceleration];
    
    self.yAccelerationHandler = [[YAccelerationHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.yAccelerationTextField];
    
    [self.yAccelerationSlider addTarget:self.yAccelerationHandler action:@selector(updateYAcceleration:) forControlEvents:UIControlEventValueChanged];
}

- (void)initZAccelerationHandler {
    self.zAccelerationSlider.value = self.particle.zAcceleration;
    self.zAccelerationTextField.text = [NSString stringWithFormat:@"%.f", self.particle.zAcceleration];
    
    self.zAccelerationHandler = [[ZAccelerationHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.zAccelerationTextField];
    
    [self.zAccelerationSlider addTarget:self.zAccelerationHandler action:@selector(updateZAcceleration:) forControlEvents:UIControlEventValueChanged];
}

@end






