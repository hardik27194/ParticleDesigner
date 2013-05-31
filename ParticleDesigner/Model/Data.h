//
//  Data.h
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-10.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RenderMode;

@interface Data : NSObject

@property (nonatomic, strong) NSArray* renderMode;
@property (nonatomic, strong) NSArray* emitterShape;
@property (nonatomic, strong) NSArray* emitterMode;
@property (nonatomic, strong) NSArray* scalingFilter;

@end
