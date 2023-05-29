import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leadingWidget;
  final Color? backgroundColor;
  AppBarWidget({required this.title, this.leadingWidget, this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    // Implement the build method to return the custom app bar widget
    return AppBar(

      centerTitle: true,
      title: Text(title,
      style: const TextStyle(color: mainPurple,fontWeight: FontWeight.normal ),),
      backgroundColor: backgroundColor ?? mainWhite,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


