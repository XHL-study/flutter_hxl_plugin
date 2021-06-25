
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:android_back_to_desktop/android_back_to_desktop.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 102,
                child: Text("xxxx"),
              ),
              Expanded(
                flex: 1,
                child: MyApp(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SingleChildScrollView(child: Column(
            children: [
              TextField(
                decoration: InputDecoration(prefixText: "test"),
              ),
              TButton(),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              Text("test back to desktop plugin in android"),
              TButton(),
              TextButton(
                onPressed: () {
                  AndroidBackToDesktop.backDesktop();
                },
                child: Text("click me back desktop"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Scaffold(
                        body: Center(
                          child: Text("xxxxx"),
                        ),
                        appBar: AppBar(
                          title: Text("page"),
                        ),
                      );
                    }),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Text("click me back desktop"),
              ),
            ],
          ),),
        ),
      ),
    );
  }
}


class TButton extends StatefulWidget {
  @override
  _TButtonState createState() => _TButtonState();
}

class _TButtonState extends State<TButton> {

  double y = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        Timer(Duration(seconds: 1), () {
          RenderObject ro = context.findRenderObject();
          setState(() {
            y = ro.getTransformTo(context.findRenderObject().parent.parent).getTranslation().y;
          });
        });
  }

  @override
  Widget build(BuildContext context) {

    return Container(child: Text("距离顶部：$y"),);
  }
}
