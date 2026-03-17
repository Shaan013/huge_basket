import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppListTitle extends StatelessWidget {
  final Widget? leading;
  final List<Widget>? middle;
  final Widget? traling;

  const AppListTitle({super.key, this.leading, this.middle, this.traling});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18.r,
      children: [
        ?leading,
        Expanded(
          child: Column(
            spacing: 5.h,

            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: middle ?? [],
          ),
        ),
        Column(mainAxisAlignment: .start, children: [traling ?? SizedBox()]),

      ],
    );
  }
}
