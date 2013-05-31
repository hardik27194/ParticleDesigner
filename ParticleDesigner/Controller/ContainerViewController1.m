//
//  ContainerViewController1.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-13.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "ContainerViewController1.h"
#import "CPPickerView.h"
#import "RenderModeHandler.h"
#import "PositionHandler.h"
#import "EmitterModeHandler.h"
#import "EmitterShapeHandler.h"
#import "EmitterDepthHandler.h"
#import "EmitterSizeHandler.h"

@interface ContainerViewController1 ()

@property (nonatomic, weak) NSArray* renderMode;
@property (nonatomic, weak) CAEmitterLayer* emitter;
@property (nonatomic, weak) NSArray* emitterShape;
@property (nonatomic, weak) NSArray* emitterMode;

@property (nonatomic, strong) CPPickerView* renderModePickerView;
@property (nonatomic, strong) RenderModeHandler* renderModeHandler;
@property (nonatomic, strong) PositionHandler* positionHandler;
@property (nonatomic, strong) CPPickerView* emitterShapePickerView;
@property (nonatomic, strong) EmitterShapeHandler* emitterShapeHandler;
@property (nonatomic, strong) CPPickerView* emitterModePickerView;
@property (nonatomic, strong) EmitterModeHandler* emitterModeHandler;
@property (nonatomic, strong) EmitterDepthHandler* emitterDepthHandler;
@property (nonatomic, strong) EmitterSizeHandler* emitterSizeHandler;


@end

@implementation ContainerViewController1

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.renderMode = [self.delegate containerViewControllerShouldGetRenderMode];
    self.emitter = [self.delegate containerViewControllerShouldGetEmitter];
    self.emitterShape = [self.delegate containerViewControllerShouldGetEmitterShape];
    self.emitterMode = [self.delegate containerViewControllerShouldGetEmitterMode];
    
    [self initRenderModeHandler];
    [self initEmitterShapeHandler];
    [self initEmitterModeHandler];
    [self initPositionHandler];
    [self initEmitterDepthHandler];
    [self initEmitterSizeHandler];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGRect frame = self.view.frame;
    frame.size = [[UIScreen mainScreen] bounds].size;
    self.view.frame = frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initRenderModeHandler {
    self.renderModePickerView = [[CPPickerView alloc] initWithFrame:self.renderModePickerViewPlaceHolder.bounds];
    
    self.renderModePickerView.itemFont = [UIFont systemFontOfSize:14];
    
    self.renderModeHandler = [[RenderModeHandler alloc] initWithDataSource:self.renderMode emitter:self.emitter];
    
    self.renderModePickerView.delegate = self.renderModeHandler;
    self.renderModePickerView.dataSource = self.renderModeHandler;
    [self.renderModePickerView reloadData];
    [self.renderModePickerView selectItemAtIndex:4 animated:NO];
    [self.renderModePickerViewPlaceHolder addSubview:self.renderModePickerView];
}

- (void)initEmitterShapeHandler {
    self.emitterShapePickerView = [[CPPickerView alloc] initWithFrame:self.emitterShapePickerViewPlaceHolder.bounds];
    
    self.emitterShapePickerView.itemFont = [UIFont systemFontOfSize:14];
    self.emitterShapeHandler = [[EmitterShapeHandler alloc] initWithDataSource:self.emitterShape emitter:self.emitter];
    
    self.emitterShapePickerView.delegate = self.emitterShapeHandler;
    self.emitterShapePickerView.dataSource = self.emitterShapeHandler;
    [self.emitterShapePickerView reloadData];
    [self.emitterShapePickerViewPlaceHolder addSubview:self.emitterShapePickerView];
}

- (void)initEmitterModeHandler {
    self.emitterModePickerView = [[CPPickerView alloc] initWithFrame:self.emitterModePickerViewPlaceHolder.bounds];
    
    self.emitterModePickerView.itemFont = [UIFont systemFontOfSize:14];
    self.emitterModeHandler = [[EmitterModeHandler alloc] initWithDataSource:self.emitterMode emitter:self.emitter];
    
    self.emitterModePickerView.delegate = self.emitterModeHandler;
    self.emitterModePickerView.dataSource = self.emitterModeHandler;
    [self.emitterModePickerView reloadData];
    [self.emitterModePickerView selectItemAtIndex:3 animated:NO];
    [self.emitterModePickerViewPlaceHolder addSubview:self.emitterModePickerView];
}

- (void)initPositionHandler {
    self.xPosTextField.text = [NSString stringWithFormat:@"%.f", self.emitter.position.x];
    self.yPosTextField.text = [NSString stringWithFormat:@"%.f", self.emitter.position.y];
    self.zPosTextField.text = [NSString stringWithFormat:@"%.f", self.emitter.zPosition];
    
    self.zPositionSlider.value = self.emitter.zPosition;
    
    self.positionHandler = [[PositionHandler alloc] initWithEmitter:self.emitter xPosTextField:self.xPosTextField yPosTextField:self.yPosTextField zPosTextFielid:self.zPosTextField];
    
    [self.zPositionSlider addTarget:self.positionHandler action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
    
    self.xPosTextField.delegate = self.positionHandler;
    self.yPosTextField.delegate = self.positionHandler;
    self.zPosTextField.delegate = self.positionHandler;
}

- (void)initEmitterDepthHandler {
    self.depthTextField.text = [NSString stringWithFormat:@"%.1f", self.emitter.emitterDepth];
    self.depthSlider.value = self.emitter.emitterDepth;
    self.depthSwitch.on = self.emitter.preservesDepth;
    
    self.emitterDepthHandler = [[EmitterDepthHandler alloc] initWithEmitter:self.emitter depthTextField:self.depthTextField depthSlider:self.depthSlider];
    
    [self.depthSlider addTarget:self.emitterDepthHandler action:@selector(updateDepth:) forControlEvents:UIControlEventValueChanged];
    [self.depthSwitch addTarget:self.emitterDepthHandler action:@selector(switchDepth:) forControlEvents:UIControlEventValueChanged];
}

- (void)initEmitterSizeHandler {
    self.widthTextField.text = [NSString stringWithFormat:@"%.f", self.emitter.emitterSize.width];
    self.heightTextField.text = [NSString stringWithFormat:@"%.f", self.emitter.emitterSize.height];
    
    self.widthSlider.value = self.emitter.emitterSize.width;
    self.heightSlider.value = self.emitter.emitterSize.height;
    
    self.emitterSizeHandler = [[EmitterSizeHandler alloc] initWithWidthEmitter:self.emitter widthTextField:self.widthTextField heightTextField:self.heightTextField];
    
    [self.widthSlider addTarget:self.emitterSizeHandler action:@selector(updateWidth:) forControlEvents:UIControlEventValueChanged];
    [self.heightSlider addTarget:self.emitterSizeHandler action:@selector(updateHeight:) forControlEvents:UIControlEventValueChanged];
}



@end










