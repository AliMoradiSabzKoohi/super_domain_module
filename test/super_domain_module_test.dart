import 'package:flutter_test/flutter_test.dart';
import 'package:super_domain_module/super_domain_module.dart';
import 'package:super_domain_module/super_domain_module_platform_interface.dart';
import 'package:super_domain_module/super_domain_module_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSuperDomainModulePlatform
    with MockPlatformInterfaceMixin
    implements SuperDomainModulePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SuperDomainModulePlatform initialPlatform = SuperDomainModulePlatform.instance;

  test('$MethodChannelSuperDomainModule is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSuperDomainModule>());
  });

  test('getPlatformVersion', () async {
    SuperDomainModule superDomainModulePlugin = SuperDomainModule();
    MockSuperDomainModulePlatform fakePlatform = MockSuperDomainModulePlatform();
    SuperDomainModulePlatform.instance = fakePlatform;

    expect(await superDomainModulePlugin.getPlatformVersion(), '42');
  });
}
