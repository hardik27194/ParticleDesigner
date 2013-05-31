//
//  ContainerViewControllerDelegate.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-13.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ContainerViewControllerDelegate <NSObject>

- (CAEmitterLayer*)containerViewControllerShouldGetEmitter;
- (CAEmitterCell*)containerViewControllerShouldGetParticle;

- (NSArray*)containerViewControllerShouldGetRenderMode;
- (NSArray*)containerViewControllerShouldGetEmitterShape;
- (NSArray*)containerViewControllerShouldGetEmitterMode;

- (NSArray*)containerViewControllerShouldGetScalingFilters;

@end