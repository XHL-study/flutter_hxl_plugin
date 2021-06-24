import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_back_to_desktop/android_back_to_desktop.dart';

void main() {
  runApp(MyApp());
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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(prefixText: "test"),),
              Text("test back to desktop plugin in android"),
              TextButton(
                  onPressed: () {
                    AndroidBackToDesktop.backDesktop();
                  },
                  child: Text("click me back desktop"))
            ],
          ),
        ),
      ),
    );
  }
}
