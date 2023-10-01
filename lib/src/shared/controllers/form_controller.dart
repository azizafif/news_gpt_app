import 'package:flutter/material.dart';

import 'base_controller.dart';
import '../models/input_control.dart';

abstract class FormController extends BaseController {
  final formKey = GlobalKey<FormState>();

  late List<InputControl> inputControls;
  int get inputsCount;

  @override
  @mustCallSuper
  void onInit() {
    inputControls = InputControl.generate(inputsCount);
    super.onInit();
  }

  @override
  @mustCallSuper
  void onClose() {
    inputControls.dispose();
    super.onClose();
  }
}
