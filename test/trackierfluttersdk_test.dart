import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trackier_flutter_sdk/trackierfluttersdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('trackierfluttersdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Trackierfluttersdk.platformVersion, '42');
  });
}
