import 'package:news_gpt/src/shared/screens/exports.dart';

import '../../../utils/helpers/index.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.find<LoginController>();
    return SmartScaffold(
      safeArea: true,
      body: ScrollableColumn(
        formKey: controller.formKey,
        children: <Widget>[
          Text("Welcome", style: Theme.of(context).textTheme.displayMedium),
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
          const SignInButton(),
          const VerticalSpacing(25),
          const SignUpShortcut(),
          const VerticalSpacing(40),
        ],
      ),
    );
  }
}

class SignInButton extends KeyedStatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.find<LoginController>().login,
      child: Text("Login", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 21)),
    );
  }
}

class SignUpShortcut extends KeyedStatelessWidget {
  const SignUpShortcut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextSpan(
              text: "Sign Up Now",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = context.find<LoginController>().goToSignUp,
            ),
          ],
        ),
      ),
    );
  }
}
