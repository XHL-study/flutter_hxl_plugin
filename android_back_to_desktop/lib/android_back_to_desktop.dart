import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class AndroidBackToDesktop {
  static const MethodChannel _channel =
      const MethodChannel('android_back_to_desktop');

  static Future<bool> backDesktop() async {
    if (Platform.isFuchsia || Platform.isAndroid) {
      try {
        await _channel.invokeMethod("backDesktop");
        return false;
      } on PlatformException catch (e) {}
    }
    return true;
  }
}
