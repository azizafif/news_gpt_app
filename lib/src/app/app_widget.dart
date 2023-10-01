import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_gpt/src/app/design/app_images.dart';
import 'package:news_gpt/src/app/design/index.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await AppImages.precacheAssets(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          //$ Theme management
          theme: AppThemes.lightTheme,
          themeMode: AppThemes.themeMode,

          builder: EasyLoading.init(),

          //@ Routing
          //  initialRoute: signInModule.name,
          getPages: const [
            //  signInModule,
            //    signUpModule,
          ],
          defaultTransition: Transition.cupertino,
        );
      });
}
