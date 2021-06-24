#import "AndroidBackToDesktopPlugin.h"
#if __has_include(<android_back_to_desktop/android_back_to_desktop-Swift.h>)
#import <android_back_to_desktop/android_back_to_desktop-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "android_back_to_desktop-Swift.h"
#endif

@implementation AndroidBackToDesktopPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAndroidBackToDesktopPlugin registerWithRegistrar:registrar];
}
@end
