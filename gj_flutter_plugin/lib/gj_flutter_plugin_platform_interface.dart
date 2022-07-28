import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gj_flutter_plugin_method_channel.dart';

abstract class GjFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a GjFlutterPluginPlatform.
  GjFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static GjFlutterPluginPlatform _instance = MethodChannelGjFlutterPlugin();

  /// The default instance of [GjFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelGjFlutterPlugin].
  static GjFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GjFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(GjFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
