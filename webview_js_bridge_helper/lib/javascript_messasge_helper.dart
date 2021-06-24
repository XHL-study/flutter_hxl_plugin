import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

class JavascriptMessageHelper {
  final JavascriptMessage rawMessage;

  final WebViewController? _wvc;
  Map<String, dynamic>? message;
  String? _callback;

  JavascriptMessageHelper(this.rawMessage, this._wvc) {
    this.message = json.decode(this.rawMessage.message);
    this._callback = this.message?["callback"];
  }

  Future<String>? success(String val) {
    return this._wvc?.evaluateJavascript("window.$_callback.success('$val');");
  }

  Future<String>? error(String val) {
    return this._wvc?.evaluateJavascript("window.$_callback.error('$val');");
  }
}
