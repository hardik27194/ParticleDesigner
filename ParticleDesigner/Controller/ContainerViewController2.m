//
//  ContainerViewController2.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-15.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ContainerViewController2.h"
#import "EmitterScaleHandler.h"
#import "EmitterSpinHandler.h"
#import "EmitterVelocityHandler.h"
#import "EmitterBirthRateHandler.h"
#import "EmitterLifeTimeHandler.h"

#import "CellBirthRateHandler.h"
#import "CellLifeTimeHandler.h"
#import "CellLifeTimeRangeHandler.h"


#import "UIGlossyButton.h"

@interface ContainerViewController2 ()

@property (nonatomic, weak) CAEmitterLayer* emitter;
@property (nonatomic, weak) CAEmitterCell* particle;

@property (nonatomic, strong) EmitterScaleHandler* emitterScaleHandler;
@property (nonatomic, strong) EmitterSpinHandler* emitterSpinHandler;
@property (nonatomic, strong) EmitterVelocityHandler* emitterVelocityHandler;
@property (nonatomic, strong) EmitterBirthRateHandler* emitterBirthRateHandler;
@property (nonatomic, strong) EmitterLifeTimeHandler* emitterLifeTimeHandler;

@property (nonatomic, strong) CellBirthRateHandler* cellBirthRateHandler;
@property (nonatomic, strong) CellLifeTimeHandler* cellLifeTimeHandler;
@property (nonatomic, strong) CellLifeTimeRangeHandler* cellLifeTimeRangeHandler;

@end

@implementation ContainerViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.emitter = [self.delegate containerViewControllerShouldGetEmitter];
    self.particle = [self.delegate containerViewControllerShouldGetParticle];
    
    [self initEmitterScaleHandler];
    [self initEmitterSpinHandler];
    [self initEmitterVelocityHandler];
    [self initEmitterBirthRateHandler];
    [self initEmitterLifeTimeHandler];
    
    [self initCellBirthRateHandler];
    [self initCellLifeTimeHandler];
    [self initCellLifeTimeRangeHandler];
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

- (void)initEmitterScaleHandler {
    self.scaleTextField.text = [NSString stringWithFormat:@"%.1f", self.emitter.scale];
    self.scaleSlider.value = self.emitter.scale;
    
    self.emitterScaleHandler = [[EmitterScaleHandler alloc] initWithEmitter:self.emitter scaleTextField:self.scaleTextField];
    
    [self.scaleSlider addTarget:self.emitterScaleHandler action:@selector(updateScale:) forControlEvents:UIControlEventValueChanged];
}

- (void)initEmitterSpinHandler {
    self.spinTextField.text = [NSString stringWithFormat:@"%.1f", self.emitter.spin];
    self.spinSlider.value = self.emitter.spin;
    
    self.emitterSpinHandler = [[EmitterSpinHandler alloc] initWithEmitter:self.emitter spinTextField:self.spinTextField];
    
    [self.spinSlider addTarget:self.emitterSpinHandler action:@selector(updateSpin:) forControlEvents:UIControlEventValueChanged];
}

- (void)initEmitterVelocityHandler {
    self.velocityTextField.text = [NSString stringWithFormat:@"%.1f", self.emitter.velocity];
    self.velocityMaxTextField.text = [NSString stringWithFormat:@"%.f", self.velocityMaxSlider.value];
    self.velocitySlider.maximumValue = self.velocityMaxSlider.value;
    self.velocitySlider.value = self.emitter.velocity;
    
    self.emitterVelocityHandler = [[EmitterVelocityHandler alloc] initWithEmitter:self.emitter velocityTextField:self.velocityTextField velocitySlider:self.velocitySlider velocityMaxTextField:self.velocityMaxTextField];
    
    [self.velocitySlider addTarget:self.emitterVelocityHandler action:@selector(updateVelocity:) forControlEvents:UIControlEventValueChanged];
    [self.velocityMaxSlider addTarget:self.emitterVelocityHandler action:@selector(updateVelocityMax:) forControlEvents:UIControlEventValueChanged];
}

- (void)initEmitterBirthRateHandler {
    self.birthRateTextField.text = [NSString stringWithFormat:@"%.1f", self.emitter.birthRate];
    self.birthRateSlider.value = self.emitter.birthRate;
    
    self.emitterBirthRateHandler = [[EmitterBirthRateHandler alloc] initWithEmitter:self.emitter birthRateTextField:self.birthRateTextField];
    
    [self.birthRateSlider addTarget:self.emitterBirthRateHandler action:@selector(updateBirthRate:) forControlEvents:UIControlEventValueChanged];
}

- (void)initEmitterLifeTimeHandler {
    self.lifeTimeTextField.text = [NSString stringWithFormat:@"%.1f", self.emitter.lifetime];
    self.lifeTimeSlider.value = self.emitter.lifetime;
    
    self.emitterLifeTimeHandler = [[EmitterLifeTimeHandler alloc] initWithEmitter:self.emitter lifeTimeTextField:self.lifeTimeTextField];
    
    [self.lifeTimeSlider addTarget:self.emitterLifeTimeHandler action:@selector(updateLifeTime:) forControlEvents:UIControlEventValueChanged];
}

- (void)initCellBirthRateHandler {
    self.cellBirthRateTextField.text = [NSString stringWithFormat:@"%.f", self.particle.birthRate];
    self.cellBirthRateSlider.value = self.particle.birthRate;
    
    self.cellBirthRateHandler = [[CellBirthRateHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.cellBirthRateTextField];
    
    [self.cellBirthRateSlider addTarget:self.cellBirthRateHandler action:@selector(updateCellBirthRate:) forControlEvents:UIControlEventValueChanged];
}

- (void)initCellLifeTimeHandler {
    self.cellLifeTimeTextField.text = [NSString stringWithFormat:@"%.1f", self.particle.lifetime];
    self.cellLifeTimeSlider.value = self.particle.lifetime;
    
    self.cellLifeTimeHandler = [[CellLifeTimeHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.cellLifeTimeTextField];
    
    [self.cellLifeTimeSlider addTarget:self.cellLifeTimeHandler action:@selector(updateCellLifeTime:) forControlEvents:UIControlEventValueChanged];
}

- (void)initCellLifeTimeRangeHandler {
    self.cellLifeTimeRangeTextField.text = [NSString stringWithFormat:@"%.1f", self.particle.lifetimeRange];
    self.cellLifeTimeRangeSlider.value = self.particle.lifetimeRange;
    
    self.cellLifeTimeRangeHandler = [[CellLifeTimeRangeHandler alloc] initWithEmitter:self.emitter particle:self.particle textField:self.cellLifeTimeRangeTextField];
    
    [self.cellLifeTimeRangeSlider addTarget:self.cellLifeTimeRangeHandler action:@selector(updateCellLifeTimeRange:) forControlEvents:UIControlEventValueChanged];
}

@end











