import '../../../../shared/modules/exports.dart';
import '../../../../shared/screens/exports.dart';
import '../signUp_controller.dart';
import '../signup_screen.dart';

final signUpModule = GetPage(
  name: '/signUpModule',
  page: () => const InheritanceProviderOf<SignUpController>(across: SignUpScreen()),
  binding: BindingsBuilder.put(() => SignUpController()),
);
