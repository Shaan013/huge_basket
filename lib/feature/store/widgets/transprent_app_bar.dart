import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/back_button.dart';
import '../../../core/widgets/smail_icon_with_badge.dart';

PreferredSizeWidget storeAppBar(
  BuildContext context, {
  required String title,
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
  actions: [
    smallIconsBadge(
      icons: icon ?? Icons.shopping_cart,
      count: count ?? 2,
      iconColor: Colors.white,
    ),
  ],
);
