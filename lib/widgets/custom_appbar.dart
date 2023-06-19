import 'package:even/config/themes/assets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.titleWidget,
    this.isCenter,
    this.actionWidgets,
    this.leadingWidget,
    this.elevation = 0,
    this.backgroundColor = AppColors.backgroundColor,
  }) : super(key: key);

  final Widget? titleWidget;
  final bool? isCenter;
  final List<Widget>? actionWidgets;
  final Widget? leadingWidget;
  final double? elevation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.blackColor,
      ),
      leading: leadingWidget,
      elevation: elevation,
      backgroundColor: backgroundColor,
      centerTitle: isCenter,
      title: titleWidget,
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
