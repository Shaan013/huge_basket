import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/widgets/cart_widget.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/back_button.dart';

PreferredSizeWidget storeAppBar(
  BuildContext context, {
  required String title,
  Color color = AppColors.black,
  IconData? icon,
  int? count,
}) => AppBar(
  actionsPadding: EdgeInsets.only(right: 18.r),
  centerTitle: true,
  systemOverlayStyle: SystemUiOverlayStyle.light,
  backgroundColor: Colors.transparent,
  leading: backButton(context, color: Colors.white),
  title: Text(
    title,
    style: TextTheme.of(context).headlineSmall!.copyWith(color: Colors.white),
    maxLines: 1,
  ),
  actions: [cartIcon(context, iconColor: Colors.white)],
);
