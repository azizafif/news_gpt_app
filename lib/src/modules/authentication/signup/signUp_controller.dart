import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_gpt/src/modules/authentication/signup/module/signUp_module.dart';

import '../../../shared/controllers/exports.dart';
import '../data/services/auth_service.dart';
import '../login/module/login_module.dart';

class SignUpController extends ServingFormController<AuthService> {
  SignUpController() : super(AuthService());
  SignUpController.serving(super.service);

  @override
  int get inputsCount => 2;
  final AuthService auth = AuthService();

  @override
  final formKey = GlobalKey<FormState>();

  void signUp() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.isShow;
      dynamic result =
          await auth.signUpWithEmailAndPassword(inputControls.first.controller.text, inputControls.last.controller.text);

      if (result == null) {
        EasyLoading.dismiss();
        goToSignIn();
      } else {
        EasyLoading.dismiss();
        Get.snackbar("Error", result);
        update();
      }
    }
  }

  void goToSignIn() => Get.toNamed(loginModule.name);
}
