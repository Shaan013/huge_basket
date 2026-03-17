import 'package:flutter/material.dart';

Widget sectionContainer(BuildContext context, {required Widget child}) {
  return Container(
    width: double.infinity,
    color: Theme.of(context).colorScheme.primaryContainer.withAlpha(80),
    child: child,
  );
}
