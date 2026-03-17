import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageBgContainer({
  required Widget child,
  required String imageUrl,
  double height = 300,
}) {
  BoxDecoration bgImageDecoration() => BoxDecoration(
    image: DecorationImage(
      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
      image: NetworkImage(imageUrl),
      fit: .cover,
    ),
  );
  return Container(
    height: height.h,
    decoration: bgImageDecoration(),
    child: child,
  );
}
