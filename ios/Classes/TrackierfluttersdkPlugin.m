#import "TrackierfluttersdkPlugin.h"
#if __has_include(<trackierfluttersdk/trackierfluttersdk-Swift.h>)
#import <trackierfluttersdk/trackierfluttersdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "trackierfluttersdk-Swift.h"
#endif

@implementation TrackierfluttersdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTrackierfluttersdkPlugin registerWithRegistrar:registrar];
}
@end
