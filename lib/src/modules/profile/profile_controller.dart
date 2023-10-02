import 'package:get/get.dart';
import 'package:news_gpt/src/modules/authentication/login/module/login_module.dart';
import 'package:news_gpt/src/shared/controllers/base_controller.dart';

import '../authentication/data/services/auth_service.dart';

class ProfileController extends BaseController {
  final AuthService auth = AuthService();

  void signOut() {
    auth.signOut();
    Get.offAllNamed(loginModule.name);
  }
}
