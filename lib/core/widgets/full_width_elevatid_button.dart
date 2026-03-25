// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huge_basket/core/theme/app_edge_insets.dart';

Widget fullWidthElevatedButton(
  BuildContext context, {
  required Widget child1,
  required VoidCallback? onTap,
}) {
  return Row(
    mainAxisAlignment: .center,
    children: [
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: AppEdgeInsets.m,
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: Theme.of(context).colorScheme.outline,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(28),
            ),
          ),
          onPressed: onTap,
          child: child1,
        ),
      ),
    ],
  );
}
