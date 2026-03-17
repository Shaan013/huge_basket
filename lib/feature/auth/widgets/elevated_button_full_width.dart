import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

Widget fullWidthButton(BuildContext context,{required String text,VoidCallback? onTap}){
  return  Row(
    children: [
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12),
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary,
          ),
          onPressed: onTap ??(){} ,
          child: Text(
            S.of(context).login,
            style: TextTheme.of(context).labelLarge,
          ),
        ),
      ),
    ],
  );
}