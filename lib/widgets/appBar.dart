import 'package:flutter/material.dart';
import 'package:unicon/utils/colors.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.person, color: iconColor,),
      title: Image.asset('images/app_logo.png'),
      elevation: 0,
      actions: const [
        Icon(Icons.settings, color: iconColor,)
      ],
    );
  }
}