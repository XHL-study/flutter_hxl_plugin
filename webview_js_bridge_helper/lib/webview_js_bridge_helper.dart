import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

///
///  webView_flutter Communication channel Intercept
///
class WebviewJsBridgeHelper {
  List<String>? channelNames;
  WebViewController? webViewController;

  // RegisterFlutterApi.min.js
  final String jsHelper =
  '''function RegisterChannelToHtml(b){window.flutterChannelApis=b;window.__flutterChanneIsRegister="1";var a=this;(b||[]).forEach(function(c){a.__mockPostMessage(c)})}RegisterChannelToHtml.prototype.__mockPostMessage=function(b){var a=this;var c=window[b];window[b]=Object.create(c);var d=window[b].postMessage;window[b].postMessage=function(e){e.callback="flutter_callback_"+Date.now();window[e.callback]={success:function(f){return e.success&&e.success(f)},error:function(f){return e.error&&e.error(f)}};return c.postMessage(JSON.stringify(e))}};''';

  WebviewJsBridgeHelper();

  ///
  /// get all channel names
  ///
  Set<JavascriptChannel>? initChannels(List<JavascriptChannel>? channels) {
    this.channelNames = channels?.map((e) => e.name).toList() ?? [];
    return channels?.toSet();
  }

  ///
  /// injection ，intercept
  ///
  Future<JsBridgeInterceptType>? onPageFinished(
      WebViewController? webViewController) async {
    this.webViewController = webViewController;
    if (await this._isInjection()) {
      return Future.value(JsBridgeInterceptType.registered);
    }
    //injection js
    await webViewController?.evaluateJavascript(this.jsHelper);
    //intercept js bridge channel
    await webViewController?.evaluateJavascript(
        'new RegisterChannelToHtml(${json.encode(this.channelNames)})');
    return Future.value(JsBridgeInterceptType.init);
  }

  ///
  /// is injection
  ///
  Future<bool> _isInjection() async {
    return await this
        .webViewController
        ?.evaluateJavascript('window.__flutterChanneIsRegister') ==
        '1';
  }
}

enum JsBridgeInterceptType {
  init,
  registered,
}
