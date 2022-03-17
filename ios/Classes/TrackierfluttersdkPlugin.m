#import "TrackierfluttersdkPlugin.h"
#if __has_include(<trackier_sdk_flutter/trackier_sdk_flutter-Swift.h>)
#import <trackier_sdk_flutter/trackier_sdk_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "trackier_sdk_flutter-Swift.h"
#endif

@implementation TrackierfluttersdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTrackierfluttersdkPlugin registerWithRegistrar:registrar];
}
@end
