import 'package:get/get.dart';
import 'package:news_gpt/src/modules/profile/profile_controller.dart';
import 'package:news_gpt/src/modules/profile/profile_screen.dart';

import '../../shared/modules/exports.dart';
import '../home/home_controller.dart';

final profileModule = GetPage(
  name: '/profileModule',
  page: () => const InheritanceProviderOf<HomeController>(across: ProfileScreen()),
  binding: BindingsBuilder.put(() => ProfileController()),
);
