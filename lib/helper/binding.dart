import 'package:get/get.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:micromobitech/helper/network.dart';

class Binding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => AuthControl());
    Get.lazyPut(() => NetworkControl());
  }
}
