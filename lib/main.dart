import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_gpt/src/modules/home/home_screen.dart';

import 'firebase_options.dart';
import 'src/app/app_widget.dart';
import 'src/app/environment/app_environment.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _setupStatusBarTransparency();

  _setupAllowedDeviceOrientations();

  _setupEasyLoading();

  _setupEnvironment(Environment.dev);

  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

void _setupEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = const Color.fromARGB(255, 12, 13, 12)
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

void _setupStatusBarTransparency() => SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

void _setupAllowedDeviceOrientations() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

void _setupEnvironment(Environment environment) => AppEnvironment.current = environment;

// Widget body(Size size) {
//   return Column(
//     children: [
//       Expanded(
//         flex: 5,
//         child: Padding(
//           padding: EdgeInsets.only(top: size.height * .1),
//           child: Text(
//             'APP NAME',
//             style: TextStyle(
//               color: Colors.white.withOpacity(.7),
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1,
//               wordSpacing: 4,
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         flex: 7,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             component1(Icons.account_circle_outlined, 'User name...', false, false),
//             component1(Icons.email_outlined, 'Email...', false, true),
//             component1(Icons.lock_outline, 'Password...', true, false),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 component2(
//                   'LOGIN',
//                   2.58,
//                   () {
//                     HapticFeedback.lightImpact();
//                     Fluttertoast.showToast(msg: 'Login button pressed');
//                   },
//                 ),
//                 SizedBox(width: size.width / 20),
//                 component2(
//                   'Forgotten password!',
//                   2.58,
//                   () {
//                     HapticFeedback.lightImpact();
//                     Fluttertoast.showToast(msg: 'Forgotten password button pressed');
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       Expanded(
//         flex: 6,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             component2(
//               'Create a new Account',
//               2,
//               () {
//                 HapticFeedback.lightImpact();
//                 Fluttertoast.showToast(msg: 'Create a new account button pressed');
//               },
//             ),
//             SizedBox(height: size.height * .05),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget component1(IconData icon, String hintText, bool isPassword, bool isEmail) {
//   Size size = MediaQuery.of(context).size;
//   return ClipRRect(
//     borderRadius: BorderRadius.circular(15),
//     child: BackdropFilter(
//       filter: ImageFilter.blur(
//         sigmaY: 15,
//         sigmaX: 15,
//       ),
//       child: Container(
//         height: size.width / 8,
//         width: size.width / 1.2,
//         alignment: Alignment.center,
//         padding: EdgeInsets.only(right: size.width / 30),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(.05),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: TextField(
//           style: TextStyle(color: Colors.white.withOpacity(.8)),
//           cursorColor: Colors.white,
//           obscureText: isPassword,
//           keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
//           decoration: InputDecoration(
//             prefixIcon: Icon(
//               icon,
//               color: Colors.white.withOpacity(.7),
//             ),
//             border: InputBorder.none,
//             hintMaxLines: 1,
//             hintText: hintText,
//             hintStyle: TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget component2(String string, double width, VoidCallback voidCallback) {
//   Size size = MediaQuery.of(context).size;
//   return ClipRRect(
//     borderRadius: BorderRadius.circular(15),
//     child: BackdropFilter(
//       filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
//       child: InkWell(
//         highlightColor: Colors.transparent,
//         splashColor: Colors.transparent,
//         onTap: voidCallback,
//         child: Container(
//           height: size.width / 8,
//           width: size.width / width,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(.05),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Text(
//             string,
//             style: TextStyle(color: Colors.white.withOpacity(.8)),
//           ),
//         ),
//       ),
//     ),
//   );
// }
