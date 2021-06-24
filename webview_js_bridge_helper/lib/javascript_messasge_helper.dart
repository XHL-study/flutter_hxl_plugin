
import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

class JavascriptMessageHelper {
  final JavascriptMessage rawMessage;
  Map<String,dynamic>? message;
  String? callback;

  JavascriptMessageHelper(this.rawMessage) {
    this.message = json.decode(this.rawMessage.message);
    this.callback = this.message?["callback"];
  }

  String success(dynamic val){
    return 'window.${this.callback}.success($val)';
  }

  String error(dynamic val){
    return 'window.${this.callback}.error($val)';
  }

}
