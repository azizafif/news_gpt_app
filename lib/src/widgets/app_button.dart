import 'dart:ui';

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.string,
    this.width = 1.5,
    required this.voidCallback,
  });

  final String string;
  final double width;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
