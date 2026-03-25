import 'package:flutter/material.dart';

class AppBoxDecoration {
  static BoxDecoration cartCounterBox(BuildContext context) {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      borderRadius: BorderRadius.circular(40),
    );
  }
}
