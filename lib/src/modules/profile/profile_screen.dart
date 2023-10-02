import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_gpt/src/modules/profile/profile_controller.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Column(
      children: [
        const VerticalSpacing(30),
        const Text("Profile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
        const VerticalSpacing(30),
        const CircleAvatar(radius: 70),
        const VerticalSpacing(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: ElevatedButton(
            onPressed: context.find<ProfileController>().signOut,
            child: const Text("Sign Out", style: TextStyle(fontSize: 21, color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
