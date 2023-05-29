import 'package:flutter/material.dart';
import 'Config.dart';

class CustomappBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomappBar({
    Key? key,
    this.appTitle,
    this.route,
    this.icon,
    this.actions,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String? appTitle;
  final String? route;
  final Icon? icon;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  State<CustomappBar> createState() => _CustomappBarState();
}

class _CustomappBarState extends State<CustomappBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      elevation: 0,
      title: Text(
        widget.appTitle!,
        style: TextStyle(
          fontSize: 20,
          color: widget.textColor ?? Colors.black,
        ),
      ),
      leading: widget.icon != null
          ? Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Config.primaryColor,
        ),
        child: IconButton(
          onPressed: () {
            if (widget.route != null) {
              Navigator.of(context).pushNamed(widget.route!);
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: widget.icon!,
          iconSize: 16,
          color: Colors.white,
        ),
      )
          : null,
      actions: widget.actions,
    );
  }
}
