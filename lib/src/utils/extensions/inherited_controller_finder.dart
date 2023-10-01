import '../../shared/controllers/exports.dart';
import '../../shared/modules/inherited_controller.dart';

extension InheritedControllerFinder on BuildContext {
  T find<T extends BaseController>() => dependOnInheritedWidgetOfExactType<InheritedController<T>>()?.controller ?? Get.find<T>();
}
