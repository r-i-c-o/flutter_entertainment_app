import 'package:flutter/material.dart';
import 'package:tarot/widgets/appbar.dart';

class FadingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController controller;
  final String title;
  final VoidCallback? onLeadingPressed;

  const FadingAppBar({
    Key? key,
    required this.controller,
    required this.title,
    this.onLeadingPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        color: Color(0xFF142431).withOpacity(
          controller.hasClients
              ? (controller.offset / 50.0).clamp(0.0, 1.0).toDouble()
              : 0.0,
        ),
        child: child,
      ),
      child: AppTopBar(
        title: title,
        onLeadingPressed: onLeadingPressed,
        shrink: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.0);
}
