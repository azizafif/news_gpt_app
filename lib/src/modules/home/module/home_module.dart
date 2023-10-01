import 'package:news_gpt/src/modules/home/home_controller.dart';
import 'package:news_gpt/src/modules/home/home_screen.dart';

import '../../../shared/modules/exports.dart';

final homeModule = GetPage(
  name: '/homeModule',
  page: () => const InheritanceProviderOf<HomeController>(across: HomeScreen()),
  binding: BindingsBuilder.put(() => HomeController()),
);
