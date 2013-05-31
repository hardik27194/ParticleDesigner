//
//  Data.m
//  ParticleDesigner
//
//  Created by Bet007 on 13-4-10.
//  Copyright (c) 2013年 ifeng. All rights reserved.
//

#import "Data.h"

@implementation Data

-(id)init {
    if (self = [super init]) {
        self.renderMode = @[@{@"Unordered": kCAEmitterLayerUnordered},
                            @{@"Oldest First": kCAEmitterLayerOldestFirst},
                            @{@"Oldest Last": kCAEmitterLayerOldestLast},
                            @{@"Back To Front": kCAEmitterLayerBackToFront},
                            @{@"Additive": kCAEmitterLayerAdditive}];
        
        self.emitterShape = @[@{@"Point": kCAEmitterLayerPoint},
                              @{@"Line": kCAEmitterLayerLine},
                              @{@"Rectangle": kCAEmitterLayerRectangle},
                              @{@"Cuboid": kCAEmitterLayerCuboid},
                              @{@"Circle": kCAEmitterLayerCircle},
                              @{@"Sphere": kCAEmitterLayerSphere}];
        
        self.emitterMode = @[@{@"Points": kCAEmitterLayerPoints},
                             @{@"Outline": kCAEmitterLayerOutline},
                             @{@"Surface": kCAEmitterLayerSurface},
                             @{@"Volume": kCAEmitterLayerVolume}];
        
        self.scalingFilter = @[@{@"Linear": kCAFilterLinear},
                                     @{@"Nearest": kCAFilterNearest},
                                     @{@"Trilinear": kCAFilterTrilinear}];
    }
    return self;
}

@end
