//
//  Renderer.h
//  GPURTLab Shared
//
//  Created by 沈思傑 on 4/22/20.
//  Copyright © 2020 sijieshen. All rights reserved.
//

#import <MetalKit/MetalKit.h>

// Our platform independent renderer class.   Implements the MTKViewDelegate protocol which
//   allows it to accept per-frame update and drawable resize callbacks.
@interface Renderer : NSObject <MTKViewDelegate>

-(nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)view;

@end

