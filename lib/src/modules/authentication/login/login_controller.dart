import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_gpt/src/modules/authentication/signup/module/signUp_module.dart';

import '../../../shared/controllers/exports.dart';
import '../../home/module/home_module.dart';
import '../data/services/auth_service.dart';
import 'module/login_module.dart';

class LoginController extends ServingFormController<AuthService> {
  LoginController() : super(AuthService());
  LoginController.serving(super.service);

  @override
  int get inputsCount => 2;

  void login() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      dynamic result =
          await service.signInWithEmailAndPassword(inputControls.first.controller.text, inputControls.last.controller.text);
      if (result == null) {
        EasyLoading.dismiss();
        goToHome();
      } else {
        EasyLoading.dismiss();
        Get.snackbar("Error", result);
        update();
      }
    }
  }

  void goToHome() => Get.offAllNamed(homeModule.name);
  void goToSignUp() => Get.toNamed(signUpModule.name);
}
