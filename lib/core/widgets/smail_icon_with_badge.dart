import 'package:flutter/material.dart';
import 'package:huge_basket/core/theme/app_colors.dart';

Widget smallIconsBadge({
  required IconData icons,
  required int? count,
  Color? bgColor,
  Color? iconColor,
}) {
  if (count == null || count == 0) {
   return Icon(icons);
  } else {
    return Badge.count(
      backgroundColor: bgColor ?? AppColors.seedColor,
      count: count,
      smallSize: 1,
      offset: Offset(10, -15),
      alignment: .center,
      child: Center(child: Icon(icons, color: iconColor)),
    );
  }
}
