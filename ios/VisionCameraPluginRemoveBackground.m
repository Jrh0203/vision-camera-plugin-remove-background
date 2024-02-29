#import <Foundation/Foundation.h>
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>
#import <VisionCamera/Frame.h>

#if __has_include("VisionCameraPluginRemoveBackground/VisionCameraPluginRemoveBackground-Swift.h")
#import "VisionCameraPluginRemoveBackground/VisionCameraPluginRemoveBackground-Swift.h"
#else
#import "VisionCameraPluginRemoveBackground-Swift.h"
#endif
@interface VisionCameraPluginRemoveBackground (FrameProcessorPluginLoader)
@end

@implementation VisionCameraPluginRemoveBackground (FrameProcessorPluginLoader)

+ (void)load
{
    [FrameProcessorPluginRegistry addFrameProcessorPlugin:@"removeBackground"
                                        withInitializer:^FrameProcessorPlugin* (VisionCameraProxyHolder* proxy, NSDictionary* options) {
        return [[VisionCameraPluginRemoveBackground alloc] initWithProxy:proxy withOptions:options];
    }];
}

@end