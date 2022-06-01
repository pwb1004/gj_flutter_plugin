import 'package:flutter_test/flutter_test.dart';
import 'package:gj_flutter_plugin/gj_flutter_plugin.dart';
import 'package:gj_flutter_plugin/gj_flutter_plugin_platform_interface.dart';
import 'package:gj_flutter_plugin/gj_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGjFlutterPluginPlatform 
    with MockPlatformInterfaceMixin
    implements GjFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GjFlutterPluginPlatform initialPlatform = GjFlutterPluginPlatform.instance;

  test('$MethodChannelGjFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGjFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    GjFlutterPlugin gjFlutterPlugin = GjFlutterPlugin();
    MockGjFlutterPluginPlatform fakePlatform = MockGjFlutterPluginPlatform();
    GjFlutterPluginPlatform.instance = fakePlatform;
  
    expect(await gjFlutterPlugin.getPlatformVersion(), '42');
  });
}
