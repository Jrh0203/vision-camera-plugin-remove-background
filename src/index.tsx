import { NativeModules, Platform } from 'react-native';
import { VisionCameraProxy, type Frame } from 'react-native-vision-camera';

const LINKING_ERROR =
  `The package 'vision-camera-plugin-remove-background' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const VisionCameraPluginRemoveBackground = NativeModules.VisionCameraPluginRemoveBackground
  ? NativeModules.VisionCameraPluginRemoveBackground
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return VisionCameraPluginRemoveBackground.multiply(a, b);
}

const plugin = VisionCameraProxy.initFrameProcessorPlugin('removeBackground');

export function removeBackground(frame: Frame, frameIndex: number) {
  'worklet';
  if (plugin == null) {
    throw new Error('Failed to load Frame Processor Plugin!');
  }
  return plugin.call(frame, { frameIndex: frameIndex });
}