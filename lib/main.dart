import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(title: 'RecViewer',home: RecView()));

class RecView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RecViewState();
}

class  _RecViewState extends State<RecView>{
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.0),
      child: AppBar(
        title: Text('RecViewer'),
        backgroundColor: Color.fromARGB(255, 64, 81, 181),
        centerTitle: true,
        )
      ),
      body: WebView(
        initialUrl: 'http://192.168.2.10/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
      ),
    );
  }
}