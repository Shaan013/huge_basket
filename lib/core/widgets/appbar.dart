import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'back_button.dart';

PreferredSizeWidget myAppBar(BuildContext context,{required String title,List<Widget>? action, Widget? leading,Color? bgColor }){
  final textTheme=Theme.of(context).textTheme;
  return  AppBar(

    backgroundColor:bgColor,
    leading:leading ?? backButton(context),
    centerTitle: true,
    actionsPadding: EdgeInsetsGeometry.symmetric(horizontal: 20),
    actions: action,
    scrolledUnderElevation: 40,
    shadowColor: Colors.black12,
    title: Text(
      title,
      style: textTheme.headlineMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );

}

// Widget bagedIcon({required IconData icons,,})