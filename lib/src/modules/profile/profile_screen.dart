import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_gpt/src/modules/profile/profile_controller.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';
import 'package:news_gpt/src/widgets/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VerticalSpacing(30),
        Text("Profile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white)),
        VerticalSpacing(30),
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.black,
          child: Icon(Icons.person, color: Colors.orangeAccent, size: 70),
        ),
        VerticalSpacing(30),
        Center(child: SignOut())
      ],
    );
  }
}

class SignOut extends KeyedStatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButton(voidCallback: context.find<ProfileController>().signOut, string: "Sign Out"),
    );
  }
}
