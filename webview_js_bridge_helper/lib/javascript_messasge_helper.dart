import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

class JavascriptMessageHelper {
  final JavascriptMessage rawMessage;
  Map<String, dynamic>? message;

  final WebViewController? _wvc;
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
