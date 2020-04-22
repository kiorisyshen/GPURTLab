//
//  RTRenderer.m
//  GPURTLab
//
//  Created by 沈思傑 on 4/22/20.
//  Copyright © 2020 sijieshen. All rights reserved.
//

#import "RTRenderer.h"
#include "utils/Logger.hpp"

using namespace GPURTLab;

@implementation RTRenderer
{
    MTKView *_view;
    id <MTLDevice> _device;
}

-(nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)view;
{
    self = [super init];

    if (self)
    {
        _view = view;
        _device = view.device;
        
        Logger::GetLogger().info("Metal device: {}", device.name.UTF8String);
    }
    
    return self;
}

- (void)drawInMTKView:(nonnull MTKView *)view {
    
}

- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size {
    
}

@end
