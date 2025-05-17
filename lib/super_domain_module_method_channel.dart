import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'super_domain_module_platform_interface.dart';

/// An implementation of [SuperDomainModulePlatform] that uses method channels.
class MethodChannelSuperDomainModule extends SuperDomainModulePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('super_domain_module');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
