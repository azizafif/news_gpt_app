import 'package:news_gpt/src/shared/screens/exports.dart';

import '../../../utils/helpers/index.dart';
import '../../../widgets/app_animated_bg.dart';
import '../../../widgets/app_button.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.find<LoginController>();
    return AppAnimatedBg(
      child: SmartScaffold(
        backgroundColor: Colors.transparent,
        safeArea: true,
        body: ScrollableColumn(
          formKey: controller.formKey,
          children: <Widget>[
            Text("Welcome", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white)),
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
            const SignInButton(),
            const VerticalSpacing(55),
            const SignUpShortcut(),
            const VerticalSpacing(40),
          ],
        ),
      ),
    );
  }
}

class SignInButton extends KeyedStatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(voidCallback: context.find<LoginController>().login, string: "Login");
  }
}

class SignUpShortcut extends KeyedStatelessWidget {
  const SignUpShortcut({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(voidCallback: context.find<LoginController>().goToSignUp, string: "Create an account");
  }
}
