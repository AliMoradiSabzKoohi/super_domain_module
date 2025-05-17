import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'super_domain_module_method_channel.dart';

abstract class SuperDomainModulePlatform extends PlatformInterface {
  /// Constructs a SuperDomainModulePlatform.
  SuperDomainModulePlatform() : super(token: _token);

  static final Object _token = Object();

  static SuperDomainModulePlatform _instance = MethodChannelSuperDomainModule();

  /// The default instance of [SuperDomainModulePlatform] to use.
  ///
  /// Defaults to [MethodChannelSuperDomainModule].
  static SuperDomainModulePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SuperDomainModulePlatform] when
  /// they register themselves.
  static set instance(SuperDomainModulePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
