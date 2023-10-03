import 'package:get/get_utils/get_utils.dart';

class InputValidators {
  InputValidators._();

  static String? validateLogin(String? value) => (value != null && value.length >= 6) ? null : 'Invalid Login';

  static String? validateEmail(String? value) => (value != null && GetUtils.isEmail(value)) ? null : 'Invalid Email';

  static String? validatePassword(String? value) => (value != null && value.length > 7) ? null : 'Invalid Password';
}
