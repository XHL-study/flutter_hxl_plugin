import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_js_bridge_helper/webview_js_bridge_helper.dart';
class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  WebViewController? wvc;
  String? title;
  String url = '';
  int? progress;

  TextEditingController? tec;

  WebviewFlutterJsBridgeIntercept? wfji;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    tec = TextEditingController();
    // tec?.value = TextEditingValue(text: 'https://www.baidu.com');
    tec?.value = TextEditingValue(
        text: 'http://127.0.0.1:8808/test/test.html');

    wfji = WebviewFlutterJsBridgeIntercept();
  }

  List<JavascriptChannel> _jsChanelApi(BuildContext context) {
    List<JavascriptChannel> chanelList = [];

    chanelList.add(JavascriptChannel(
        name: 'showDialog',
        onMessageReceived: (JavascriptMessage message) async {
          Map<String, dynamic> node = json.decode(message.message);
          dynamic str = await showDialog(
            context: context,
            builder: (c) {
              return SafeArea(
                child: AlertDialog(
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(c).pop("ok");
                      },
                      child: Text("确定(ok)"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(c).pop("no");
                      },
                      child: Text("取消(no)"),
                    ),
                  ],
                  content: Container(
                    width: 200,
                    height: 100,
                    child: Text("$node"),
                    color: Colors.grey,
                  ),
                ),
              );
            },
          );

          //把结果回调给网页
          String callback = node['callback'];
          if (str == 'ok') {
            await wvc
                ?.evaluateJavascript('window.$callback.success("你选择了 ok");');
          } else {
            await wvc?.evaluateJavascript('window.$callback.error("你选了no!!!")');
          }
        }));

    return chanelList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'cs'),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // height: 300,
              child: WebView(
                // initialUrl: 'http://192.168.3.124:8808/test/test.html',
                initialUrl: tec?.value.text,
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: wfji!.initChannels(_jsChanelApi(context)),
                onWebViewCreated: (WebViewController wvc) {
                  this.wvc = wvc;
                },
                navigationDelegate: (NavigationRequest navigation) {
                  if (navigation.url.startsWith("baidubox"))
                    return NavigationDecision.prevent;
                  return NavigationDecision.navigate;
                },
                onPageFinished: (String url) async {
                  this.title = await wvc?.getTitle();
                  await wfji?.onPageFinished(wvc);
                  this.setState(() {});
                },
                onPageStarted: (String url) {
                  this.setState(() async {
                    this.url = url.length > 30 ? url.substring(0, 30) : url;
                  });
                },
                onProgress: (int p) {
                  this.setState(() {
                    this.progress = p;
                  });
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 50,
            child: Text("标题：$title 进度：$progress"),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: tec,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    wvc?.loadUrl("${tec?.text}");
                  },
                  child: Text("跳转"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
