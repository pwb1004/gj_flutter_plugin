import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gj_flutter_plugin/gj_flutter_plugin_method_channel.dart';

void main() {
  MethodChannelGjFlutterPlugin platform = MethodChannelGjFlutterPlugin();
  const MethodChannel channel = MethodChannel('gj_flutter_plugin');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
