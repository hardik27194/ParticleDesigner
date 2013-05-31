//
//  MainViewController.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-9.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "MainViewController.h"
#import "Data.h"
#import "ParticleContentView.h"
#import "ArgumentHandleView.h"
#import "ContainerViewController1.h"
#import "ContainerViewController2.h"
#import "ContainerViewController3.h"
#import "ContainerViewController4.h"
#import "ContainerViewController5.h"

@interface MainViewController ()

@property (nonatomic, strong) Data* data;
@property (nonatomic, strong) ContainerViewController1* container1;
@property (nonatomic, strong) ContainerViewController2* container2;
@property (nonatomic, strong) ContainerViewController3* container3;
@property (nonatomic, strong) ContainerViewController4* container4;
@property (nonatomic, strong) ContainerViewController5* container5;

@end

@implementation MainViewController {
    CGRect _separatorViewCurrentFrame;
    CGRect _particleContentViewCurrentFrame;
    CGRect _argumentHandleViewCurrentFrame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.data = [[Data alloc] init];
    
    [self initParticleContentView];
    [self initSeparatorView];
    [self initArgumentHandleView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {    
    [super viewDidAppear:animated];
    
    CGFloat y = self.container1.view.frame.origin.y;
    
    // layout container2
    CGRect frame = self.container2.view.frame;
    y = self.container1.depthTextField.frame.origin.y + self.container1.depthTextField.frame.size.height;
    frame.origin.y = y;
    self.container2.view.frame = frame;
    
    CGSize size = self.argumentHandleView.contentSize;
    size.height -= self.view.frame.size.height - self.container2.lifeTimeTextField.frame.origin.y - self.container2.lifeTimeTextField.frame.size.height;
    self.argumentHandleView.contentSize = size;
    
    // layout container3
    frame = self.container3.view.frame;
    y = y + self.container2.cellLifeTimeRangeTextField.frame.origin.y + self.container2.cellLifeTimeRangeTextField.frame.size.height;
    frame.origin.y = y;
    self.container3.view.frame = frame;
    
    // layout container4
    frame = self.container4.view.frame;
    y = y + self.container3.alphaSpeedTextField.frame.origin.y + self.container3.alphaSpeedTextField.frame.size.height;
    frame.origin.y = y;
    self.container4.view.frame = frame;
    
    // layout container5
    frame = self.container5.view.frame;
    y = y + self.container4.spinRangeTextField.frame.origin.y + self.container4.spinRangeTextField.frame.size.height;
    frame.origin.y = y;
    self.container5.view.frame = frame;
}

- (void)initParticleContentView {
    UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    [self.particleContentView addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark
#pragma mark UITapGestureRecognizer
- (void)handleTap:(UITapGestureRecognizer*)recognizer {
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        CGPoint point = [recognizer locationInView:recognizer.view];
        self.particleContentView.emitterLayer.position = point;
        self.container1.xPosTextField.text = [NSString stringWithFormat:@"%.f", point.x];
        self.container1.yPosTextField.text = [NSString stringWithFormat:@"%.f", point.y];
    }
}

- (void)initSeparatorView {
    UIPanGestureRecognizer* panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    [self.separatorImageView addGestureRecognizer:panGestureRecognizer];
    self.separatorImageView.center = self.separatorView.center;
    
    _separatorViewCurrentFrame = self.separatorView.frame;
    _particleContentViewCurrentFrame = self.particleContentView.frame;
    _argumentHandleViewCurrentFrame = self.argumentHandleView.frame;
}

- (void)handlePan:(UIPanGestureRecognizer*)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint changedPoint = [recognizer translationInView:self.view];
        
        // 禁止拖出屏幕顶部
        if (self.separatorView.frame.origin.y <= 0 && changedPoint.y < 0) {
            return;
        }
        // 禁止拖出屏幕底部
        if (self.separatorView.frame.origin.y + self.separatorView.frame.size.height >= self.view.frame.size.height && changedPoint.y > 0) {
            return;
        }
        
        // 移动 separatorView
        self.separatorView.frame = CGRectOffset(_separatorViewCurrentFrame, 0, changedPoint.y);
        
        // 移动 separatorImageView
        self.separatorImageView.center = self.separatorView.center;
        
        // 改变 particleContentView
        CGRect frame = _particleContentViewCurrentFrame;
        frame.size.height += changedPoint.y;
        self.particleContentView.frame = frame;
        
        // 改变 argumentHandleView
        frame = _argumentHandleViewCurrentFrame;
        frame.origin.y += changedPoint.y;
        frame.size.height -= changedPoint.y;
        self.argumentHandleView.frame = frame;
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        // 保存当前已经改变的frame
        _separatorViewCurrentFrame = self.separatorView.frame;
        _particleContentViewCurrentFrame = self.particleContentView.frame;
        _argumentHandleViewCurrentFrame = self.argumentHandleView.frame;
        
        // 更新发射器的坐标信息
        CGPoint point = self.particleContentView.emitterLayer.position;
        self.container1.xPosTextField.text = [NSString stringWithFormat:@"%.f", point.x];
        self.container1.yPosTextField.text = [NSString stringWithFormat:@"%.f", point.y];
    }
}

- (void)initArgumentHandleView {
//    self.argumentHandleView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self initContainers];
}

- (void)initContainers {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    // Container 1
    self.container1 = [storyboard instantiateViewControllerWithIdentifier:@"ContainerViewController1"];
    self.container1.delegate = self;
    [self.argumentHandleView addSubview:self.container1.view];
    
    CGSize size = self.argumentHandleView.contentSize;
    size.width = self.view.frame.size.width;
    
    size.height += self.container1.view.frame.size.height;
    self.argumentHandleView.contentSize = size;

    // Container 2
    self.container2 = [storyboard instantiateViewControllerWithIdentifier:@"ContainerViewController2"];
    self.container2.delegate = self;
    [self.argumentHandleView addSubview:self.container2.view];
    
    size.height += self.container2.view.frame.size.height;
    self.argumentHandleView.contentSize = size;
    
    // Container 3
    self.container3 = [storyboard instantiateViewControllerWithIdentifier:@"ContainerViewController3"];
    self.container3.delegate = self;
    [self.argumentHandleView addSubview:self.container3.view];
    
    size.height += self.container3.view.frame.size.height;
    self.argumentHandleView.contentSize = size;
    
    // Container 4
    self.container4 = [storyboard instantiateViewControllerWithIdentifier:@"ContainerViewController4"];
    self.container4.delegate = self;
    [self.argumentHandleView addSubview:self.container4.view];
    
    size.height += self.container4.view.frame.size.height;
    self.argumentHandleView.contentSize = size;
    
    // Container 5
    self.container5 = [storyboard instantiateViewControllerWithIdentifier:@"ContainerViewController5"];
    self.container5.delegate = self;
    [self.argumentHandleView addSubview:self.container5.view];
    
    size.height += self.container5.view.frame.size.height;
    self.argumentHandleView.contentSize = size;
}


#pragma mark
#pragma mark ContainerViewControllerDelegate

- (CAEmitterLayer *)containerViewControllerShouldGetEmitter {
    return self.particleContentView.emitterLayer;
}

- (CAEmitterCell *)containerViewControllerShouldGetParticle {
    return self.particleContentView.emitterCell;
}

- (NSArray *)containerViewControllerShouldGetRenderMode {
    return self.data.renderMode;
}

- (NSArray *)containerViewControllerShouldGetEmitterShape {
    return self.data.emitterShape;
}

- (NSArray *)containerViewControllerShouldGetEmitterMode {
    return self.data.emitterMode;
}

- (NSArray *)containerViewControllerShouldGetScalingFilters {
    return self.data.scalingFilter;
}

@end













