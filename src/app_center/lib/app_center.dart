import 'dart:async';

import 'package:flutter/services.dart';

class AppCenter {
  static const MethodChannel _channel = MethodChannel(
      'aloisdeniel.github.com/flutter_plugin_appcenter/appcenter');

  /// Starts App Center services
  static Future<String?> configure(String appSecret) =>
      _channel.invokeMethod<String?>('configure', <String, dynamic>{
        'app_secret': appSecret,
      });

  static Future<String> start(String appSecret, List<String> services) {
    return _channel.invokeMethod('start', <String, dynamic>{
      'app_secret': appSecret,
      'services': services
    }).then((r) => r as String);
  }

  static Future<String> get installId =>
      _channel.invokeMethod('installId').then((r) => r as String);

  static Future<bool?> get isEnabled =>
      _channel.invokeMethod<bool?>('isEnabled');

  static Future setEnabled(bool isEnabled) =>
      _channel.invokeMethod('setEnabled', <String, bool>{
        'isEnabled': isEnabled,
      });
}
