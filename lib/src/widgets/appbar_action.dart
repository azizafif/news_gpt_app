import 'package:flutter/material.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.title,
    this.tooltip,
  }) : super(key: key);

  final void Function()? onPressed;
  final IconData icon;
  final String title;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 70,
        child: IconButton(
          onPressed: onPressed,
          tooltip: tooltip,
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
