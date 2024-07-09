
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends AppBar implements PreferredSizeWidget {
  final Widget? customLeading;
  final Widget? customTitle;
  final List<Widget>? customActions;
  final Color? customBackgroundColor;
  final double? customElevation;
  final double? titleSpacing;
  final VoidCallback? customLeadingOnPressed;

  final bool automaticallyImplyLeading;

  final SystemUiOverlayStyle? systemOverlayStyle;
   CustomAppBar({
    super.key,
    this.customLeading,
     this.titleSpacing,
    this.customTitle,
    this.customActions,
    this.customBackgroundColor,
    this.customElevation,
    this.customLeadingOnPressed,
     this.systemOverlayStyle,
      required this.automaticallyImplyLeading,
  }) : super(
     surfaceTintColor: Colors.transparent,
     automaticallyImplyLeading: automaticallyImplyLeading,
     titleSpacing: titleSpacing,
    leading: customLeading,
    title: customTitle,
    actions: customActions,
    backgroundColor: customBackgroundColor,
    elevation: customElevation,
  );

  Widget build(BuildContext context)
  {
    return AppBar(
      scrolledUnderElevation: 0.0,
      surfaceTintColor: Colors.transparent,
      titleSpacing: titleSpacing ?? 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      systemOverlayStyle: systemOverlayStyle ?? const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark,

      ),
      leading: customLeading,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: customTitle ?? const Text(
          "", // Assuming BaseStrings.setYourFingerprint is defined
        )
      ),
      actions: customActions,
      backgroundColor: customBackgroundColor,
      elevation: customElevation,
    );
  }}