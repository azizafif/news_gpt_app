import '../../../../shared/modules/exports.dart';
import '../login_controller.dart';
import '../login_screen.dart';

final loginModule = GetPage(
  name: '/loginModule',
  page: () => const InheritanceProviderOf<LoginController>(across: LoginScreen()),
  binding: BindingsBuilder.put(() => LoginController()),
);
