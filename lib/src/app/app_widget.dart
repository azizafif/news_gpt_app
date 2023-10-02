import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_gpt/src/app/design/app_images.dart';
import 'package:news_gpt/src/app/design/index.dart';
import 'package:news_gpt/src/modules/home/module/home_module.dart';

import '../modules/authentication/data/services/auth_service.dart';
import '../modules/authentication/login/module/login_module.dart';
import '../modules/authentication/signup/module/signUp_module.dart';
import '../modules/profile/profile_module.dart';
import '../shared/handlers/connectivity_handler.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key}) {
    ConnectivityHandler.startMonitoring();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthService _auth;

  @override
  void initState() {
    _auth = AuthService();
    scheduleMicrotask(() async {
      await AppImages.precacheAssets(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          //$ Theme management
          theme: AppThemes.lightTheme,
          themeMode: AppThemes.themeMode,

          builder: EasyLoading.init(),

          //@ Routing
          initialRoute: _auth.isUserSignedIn() ? homeModule.name : loginModule.name,
          getPages: [
            homeModule,
            loginModule,
            signUpModule,
            profileModule,
          ],
          defaultTransition: Transition.cupertino,
        );
      });
}
