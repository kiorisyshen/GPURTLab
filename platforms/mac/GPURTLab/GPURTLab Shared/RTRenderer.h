//
//  RTRenderer.h
//  GPURTLab
//
//  Created by 沈思傑 on 4/22/20.
//  Copyright © 2020 sijieshen. All rights reserved.
//

#ifndef RTRenderer_h
#define RTRenderer_h

#import <MetalKit/MetalKit.h>

@interface RTRenderer : NSObject <MTKViewDelegate>

-(nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)view;

@end

#endif /* RTRenderer_h */
