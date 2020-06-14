import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  testWidgets('webview widget', (WidgetTester tester) async {
    final Completer<WebViewController> webView = Completer<WebViewController>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: WebView(
          initialUrl: 'https://flutter.dev/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            webView.complete(controller);
          },
        ),
      ),
    ));
    final WebViewController controller = await webView.future;
    final String currentUrl = await controller.currentUrl();
    expect(currentUrl, 'https://flutter.dev/');
  });
}
