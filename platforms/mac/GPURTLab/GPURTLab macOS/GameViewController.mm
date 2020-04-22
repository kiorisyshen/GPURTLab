//
//  GameViewController.m
//  GPURTLab macOS
//
//  Created by 沈思傑 on 4/22/20.
//  Copyright © 2020 sijieshen. All rights reserved.
//

#import "GameViewController.h"
#import "RTRenderer.h"
#include "utils/Logger.hpp"

using namespace GPURTLab;

@implementation GameViewController
{
    MTKView *_view;

    RTRenderer *_renderer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Init Logger
    Logger::AddCoutSink();

    _view = (MTKView *)self.view;
    
    // Set color space of view to SRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
    _view.colorspace = colorSpace;
    CGColorSpaceRelease(colorSpace);

    // _view.device = MTLCreateSystemDefaultDevice();
    // Lookup high power GPU if this is a discrete GPU system
    NSArray<id <MTLDevice>> *devices = MTLCopyAllDevices();
    
    id <MTLDevice> device = devices[0];
    
    for (id <MTLDevice> potentialDevice in devices) {
        if (!potentialDevice.lowPower) {
            device = potentialDevice;
            break;
        }
    }

    _view.device = device;

    if(!_view.device)
    {
        Logger::GetLogger().critical("Metal is not supported on this device");
        self.view = [[NSView alloc] initWithFrame:self.view.frame];
        return;
    }

    _renderer = [[RTRenderer alloc] initWithMetalKitView:_view];

    [_renderer mtkView:_view drawableSizeWillChange:_view.bounds.size];

    _view.delegate = _renderer;
}

@end
