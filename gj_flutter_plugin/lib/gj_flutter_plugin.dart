import 'gj_flutter_plugin_platform_interface.dart';

class GjFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return GjFlutterPluginPlatform.instance.getPlatformVersion();
  }
}
