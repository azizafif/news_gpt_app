import 'package:get/get.dart';

extension RoutingOnGetPage on GetPage<dynamic> {
  void toNamed() => Get.toNamed(name);
  void offNamed() => Get.offNamed(name);
  void offAllNamed() => Get.offAllNamed(name);
  void offAndToNamed() => Get.offAndToNamed(name);
}
