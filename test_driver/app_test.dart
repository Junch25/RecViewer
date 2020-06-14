import 'package:flutter_driver/flutter_driver.dart';
import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('WebView Test', () {

    final openPageFinder = find.byValueKey('OK');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    Future<void> takeScreenshot(FlutterDriver driver, String path) async {
      print('setup $path');
      await driver.waitUntilNoTransientCallbacks();
      final pixels = await driver.screenshot();
      final file = File(path);
      await file.writeAsBytes(pixels);
      print('wrote $file');
    }

    test('check flutter', () async {
      final health = await driver.checkHealth();
      print(health.status);
    });

    test('Show WebView', () async {
      await driver.tap(openPageFinder);
      await takeScreenshot(driver, './test_driver/screenshots/web_view.png');
    });
  });
}