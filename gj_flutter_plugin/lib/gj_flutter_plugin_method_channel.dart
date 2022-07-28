import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gj_flutter_plugin_platform_interface.dart';

/// An implementation of [GjFlutterPluginPlatform] that uses method channels.
class MethodChannelGjFlutterPlugin extends GjFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gj_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
