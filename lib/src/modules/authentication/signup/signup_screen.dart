import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_gpt/src/modules/authentication/signup/signUp_controller.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';

import '../../../utils/helpers/index.dart';
import '../../../widgets/index.dart';
import '../login/login_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.find<SignUpController>();
    return SmartScaffold(
      appBar: AppBar(),
      safeArea: true,
      body: ScrollableColumn(
        formKey: controller.formKey,
        children: <Widget>[
          Text("Sign Up", style: Theme.of(context).textTheme.displayMedium),
          const VerticalSpacing(60),
          Input(
            controls: controller.inputControls,
            index: 0,
            labelText: "Eamil",
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
          const VerticalSpacing(25),
        ],
      ),
    );
  }
}

class SignUpButton extends KeyedStatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.find<SignUpController>().signUp,
      child: Text("SignUp", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 21)),
    );
  }
}
