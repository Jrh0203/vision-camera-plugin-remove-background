#import <Foundation/Foundation.h>
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>
#import <VisionCamera/Frame.h>

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