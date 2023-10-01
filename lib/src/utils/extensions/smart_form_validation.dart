import 'package:flutter/widgets.dart';
import '../../app/environment/app_environment.dart';
import '../../shared/screens/exports.dart';

extension SmartFormValidation on GlobalKey<FormState> {
  bool validate() => (AppEnvironment.testingEnabled || AppEnvironment.mockingEnabled) ? true : _validateAndUnfocus();

  bool _validateAndUnfocus() {
    unfocus();

    BaseInput? lastInput;

    if (currentState?.widget.child is Column)
      for (final Widget currentWidget in (currentState?.widget.child as Column).children) {
        if (currentWidget is! BaseInput) continue;

        if (currentWidget.isValid) {
          lastInput = currentWidget;
          continue;
        } else {
          _ensureVisible(lastInput != null ? lastInput.key! : currentWidget.key!);
          break;
        }
      }

    return currentState?.validate() ?? false;
  }

  void _ensureVisible(Key key) {
    if ((key as GlobalKey).currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInToLinear,
      );
    }
  }

  void unfocus() => currentContext != null ? FocusScope.of(currentContext!).unfocus() : () {};
}
