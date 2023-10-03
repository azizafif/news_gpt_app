import 'package:flutter/material.dart';
import 'package:news_gpt/src/modules/authentication/signup/signUp_controller.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';

import '../../../utils/helpers/index.dart';
import '../../../widgets/app_animated_bg.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/index.dart';
import '../login/login_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.find<SignUpController>();
    return AppAnimatedBg(
      child: SmartScaffold(
        safeArea: true,
        body: ScrollableColumn(
          formKey: controller.formKey,
          children: <Widget>[
            Text("Sign Up", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white)),
            const VerticalSpacing(60),
            Input(
              controls: controller.inputControls,
              index: 0,
              labelText: "Email",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.login_outlined),
              validator: InputValidators.validateLogin,
            ),
            const VerticalSpacing(20),
            Input(
              controls: controller.inputControls,
              index: 1,
              labelText: "Password",
              prefixIcon: const Icon(Icons.password),
              validator: InputValidators.validatePassword,
              displayCounter: true,
              isPassword: true,
            ),
            const VerticalSpacing(30),
            const SignUpButton(),
            const VerticalSpacing(35),
            const ToSignInButton()
          ],
        ),
      ),
    );
  }
}

class SignUpButton extends KeyedStatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(voidCallback: context.find<SignUpController>().signUp, string: "Sign Up");
  }
}

class ToSignInButton extends KeyedStatelessWidget {
  const ToSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(voidCallback: context.find<SignUpController>().goToSignIn, string: "I have an account");
  }
}
